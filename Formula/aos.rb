class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.506.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.506.0/aos-darwin-arm64"
    sha256 "16d6f8e89b0734c428824d75a74d516380d27d3c05eb9b59a20ae534e769a0d1"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.506.0/aoscompose-darwin-arm64"
      sha256 "16d6f8e89b0734c428824d75a74d516380d27d3c05eb9b59a20ae534e769a0d1"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.506.0/aosguard-darwin-arm64"
      sha256 "0db502ef9d1612e97cbd781351e2f1947aadb0b230b784fbadd58deb1b92b33b"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.506.0/aterm-darwin-arm64"
      sha256 "67918ff78fd7e3a34d9be241c557c6d557932e3ae51c572aab9d895678e75fcb"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.506.0/aos-linux-amd64"
      sha256 "96c194c5cd50f2b7c9bbf2d8dac64828ce8bda06fc4dfd551eaa0b697ee54ccb"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.506.0/aoscompose-linux-amd64"
        sha256 "96c194c5cd50f2b7c9bbf2d8dac64828ce8bda06fc4dfd551eaa0b697ee54ccb"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.506.0/aosguard-linux-amd64"
        sha256 "b7e9432ad2ada4d4ce1e1dbf5be07cff71a026934b45d06e9b9f8bd47051c4fe"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.506.0/aterm-linux-amd64"
        sha256 "fca77d6e0f51d012cee122bee83028078f1aa37a2944216619add40fa287ade4"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.506.0/aos-linux-arm64"
      sha256 "e0ff213dcfe6ac125c3f4ab366269c3f0a8aa2528d260c64e6bc0d26c719d196"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.506.0/aoscompose-linux-arm64"
        sha256 "e0ff213dcfe6ac125c3f4ab366269c3f0a8aa2528d260c64e6bc0d26c719d196"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.506.0/aosguard-linux-arm64"
        sha256 "ad8cbb6662e1f55649a38edf56a8088c5b3ef4e9478dd478062409b73e118593"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.506.0/aterm-linux-arm64"
        sha256 "9a885adf2968e6d48236366e383249b3f58c4ab02a51fb5614642e35ce20189e"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
