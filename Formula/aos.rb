class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.516.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.516.0/aos-darwin-arm64"
    sha256 "0927941775d4e7b18f1ee44bf89dfe7d3af44516017b762e2fd62708b4bdfa47"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.516.0/aoscompose-darwin-arm64"
      sha256 "0927941775d4e7b18f1ee44bf89dfe7d3af44516017b762e2fd62708b4bdfa47"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.516.0/aosguard-darwin-arm64"
      sha256 "d668298688b18c04ad3332983aad2d903aa45c808be0958aa4e6646575adc2b6"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.516.0/aterm-darwin-arm64"
      sha256 "cf94024fde5a0c423941bbb374aa493ac824a3065bc95c9b30ab1eeb3d8f6e3d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.516.0/aos-linux-amd64"
      sha256 "327ceb29366dc3702a80206f16b1c91b775ec4d2ae7493296144170a5385c96c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.516.0/aoscompose-linux-amd64"
        sha256 "327ceb29366dc3702a80206f16b1c91b775ec4d2ae7493296144170a5385c96c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.516.0/aosguard-linux-amd64"
        sha256 "effe79ca88d96eec33e156ed03132b541e754a5ed023e4a31ada8ceb4f05befc"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.516.0/aterm-linux-amd64"
        sha256 "7b57f157b0d639aab49e983dbed4b3fc52592ab417f25c363e36f342fc837d38"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.516.0/aos-linux-arm64"
      sha256 "0a0186a5dd700217aab848790e7652a0b7cccb94dd0b809e9c15d9b5d129d99b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.516.0/aoscompose-linux-arm64"
        sha256 "0a0186a5dd700217aab848790e7652a0b7cccb94dd0b809e9c15d9b5d129d99b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.516.0/aosguard-linux-arm64"
        sha256 "be0d2c0c9f31b4c51d4553b87af59a363b79ad215b4236ae344982bbf9ffe918"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.516.0/aterm-linux-arm64"
        sha256 "a903b71634ce8708b894c9a68d830eaf3bae570cc37fce90a222298f6696aaa3"
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
