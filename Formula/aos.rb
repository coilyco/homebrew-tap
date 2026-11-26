class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.630.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.630.0/aos-darwin-arm64"
    sha256 "3333ace33757f14740b30dc42493eed0ccec4a2d06d01e3e4e815865d190a493"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.630.0/aoscompose-darwin-arm64"
      sha256 "3333ace33757f14740b30dc42493eed0ccec4a2d06d01e3e4e815865d190a493"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.630.0/aosguard-darwin-arm64"
      sha256 "3ef9f8cb220f65e4f708578ed87abfe15421d09c79c0b5ef06e140b69fbe8595"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.630.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "aa8cc006d4a9eea27a0f2dd9bb8716fa5d0d344544039f5925e66f7b24a4bc9e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.630.0/aos-linux-amd64"
      sha256 "8ebd88f373ea89114d157d07beca75629b9ceeae8cdd1e299daf3e8f16739e04"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.630.0/aoscompose-linux-amd64"
        sha256 "8ebd88f373ea89114d157d07beca75629b9ceeae8cdd1e299daf3e8f16739e04"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.630.0/aosguard-linux-amd64"
        sha256 "bb89a2a859af481d299712f940de9e7c895cdf0820169237857d2e52f0977cda"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.630.0/aterm-linux-amd64"
        sha256 "06709faf8e4d40fb338254fddc4db79e9ee8272d64c379c995f4365f7a3eb11f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.630.0/aos-linux-arm64"
      sha256 "c38a88156c3bbf266d79a987078692e56dce7987a4d4ac11ddce5ac40b599b85"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.630.0/aoscompose-linux-arm64"
        sha256 "c38a88156c3bbf266d79a987078692e56dce7987a4d4ac11ddce5ac40b599b85"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.630.0/aosguard-linux-arm64"
        sha256 "5a1999b928e5dcc6d31963dae7eb878850ec50ab1f9c4d0e6ccee43947d6414c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.630.0/aterm-linux-arm64"
        sha256 "59ba32f96b070041df7350ffac37cf05a6421a614f5f558a7d0267ae15daf387"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    # macOS installs the signed bundle, whole (:nounzip) because a stage would
    # step into it, and links bin/aterm to its executable. See docs/aos-cli.md.
    if OS.mac?
      resource("aterm").stage do
        system "tar", "-xzf", Dir["*.tar.gz"].first, "-C", prefix
      end
      bin.install_symlink prefix/"Treehouse.app/Contents/MacOS/aterm"
    else
      resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
