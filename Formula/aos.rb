class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.431.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aos-darwin-arm64"
      sha256 "d9e4cc1aa708d976018eb960444f3f09be5633b81b23f14c13f24f078897ad19"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aoscompose-darwin-arm64"
        sha256 "d9e4cc1aa708d976018eb960444f3f09be5633b81b23f14c13f24f078897ad19"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aosward-darwin-arm64"
        sha256 "d9e4cc1aa708d976018eb960444f3f09be5633b81b23f14c13f24f078897ad19"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aosguard-darwin-arm64"
        sha256 "5e8c97ad63cb25f425f3538b0349d09b302c44c79b32592bec110ac34ecc49c4"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aterm-darwin-arm64"
        sha256 "9bcf5b21060d9ac4588eecc7aca6b085518fef26aa670db82ec7dc20b57d9183"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aos-linux-amd64"
      sha256 "778b94e9d86518987cfd76a5f9f606f734c6076601207aff5efed1c9891e9fdc"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aoscompose-linux-amd64"
        sha256 "778b94e9d86518987cfd76a5f9f606f734c6076601207aff5efed1c9891e9fdc"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aosward-linux-amd64"
        sha256 "778b94e9d86518987cfd76a5f9f606f734c6076601207aff5efed1c9891e9fdc"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aosguard-linux-amd64"
        sha256 "efe339b6123e8434cb901f6abf362d6f8dd0522076c9ded606d9a11e58494c9e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aterm-linux-amd64"
        sha256 "e6f75e5d7e81e199ffb0081c286f2f14f61a9d1f62537dcca1df460bfc3aade2"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aos-linux-arm64"
      sha256 "89504573dd9a667ab89492b764904c9d698313f155e423591c3c73cdab858dfc"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aoscompose-linux-arm64"
        sha256 "89504573dd9a667ab89492b764904c9d698313f155e423591c3c73cdab858dfc"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aosward-linux-arm64"
        sha256 "89504573dd9a667ab89492b764904c9d698313f155e423591c3c73cdab858dfc"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aosguard-linux-arm64"
        sha256 "6b8825d948da69d9fe95ce8cebf5ea8fdb87051c43c109cd05df90a0c713eef4"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.431.0/aterm-linux-arm64"
        sha256 "2803178cbce0bb4e98f0710588b782f9fd20181529fd925e7701d5314dac1e3c"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
