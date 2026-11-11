class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.593.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.593.0/aos-darwin-arm64"
    sha256 "dde9bf123d368cfc049bdd0c8a7776459e199f0e446ca424d46eab2577556505"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.593.0/aoscompose-darwin-arm64"
      sha256 "dde9bf123d368cfc049bdd0c8a7776459e199f0e446ca424d46eab2577556505"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.593.0/aosguard-darwin-arm64"
      sha256 "322658fc5d03cdd2278f2a68dd40097b435e5f5fb7c5d46009ec28a9fc603aef"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.593.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "9fe92961912ba06984d335d7cad2b9f820cd061105ffe8f2752cf4e55ada00a1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.593.0/aos-linux-amd64"
      sha256 "726ed79925d9f535e785d326a1f5e37a480b9a9734f296ffa2f0d0b09ec5c228"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.593.0/aoscompose-linux-amd64"
        sha256 "726ed79925d9f535e785d326a1f5e37a480b9a9734f296ffa2f0d0b09ec5c228"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.593.0/aosguard-linux-amd64"
        sha256 "eaa52525224ddc50d1a93a4dad16ae68bdd554a33e3c55b5eaecfc8db2ce49ac"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.593.0/aterm-linux-amd64"
        sha256 "2c25980c10b1c0bbe94a6bdc05ed0ea8d27c19aceba477160c2640f529dcb894"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.593.0/aos-linux-arm64"
      sha256 "a465f66bf379a4b68af35e8d44d0c0d02949060ca2eb74be85a97530439e7396"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.593.0/aoscompose-linux-arm64"
        sha256 "a465f66bf379a4b68af35e8d44d0c0d02949060ca2eb74be85a97530439e7396"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.593.0/aosguard-linux-arm64"
        sha256 "08b220a2314af6c4bd668650668bc19f6ae24d4d148adf2ea32a428d1253336e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.593.0/aterm-linux-arm64"
        sha256 "297269c27da85af83767e1379a65520ac4b7b643508e7ef6e6c96b3006ca1826"
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
