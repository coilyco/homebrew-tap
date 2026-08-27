class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.253.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aos-darwin-arm64"
      sha256 "d2a4ccf8bd4ada9e5395a572c58a42122fd3236739816074f2b9fc03af0d1ebe"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aoscompose-darwin-arm64"
        sha256 "d2a4ccf8bd4ada9e5395a572c58a42122fd3236739816074f2b9fc03af0d1ebe"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aosward-darwin-arm64"
        sha256 "d2a4ccf8bd4ada9e5395a572c58a42122fd3236739816074f2b9fc03af0d1ebe"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aosguard-darwin-arm64"
        sha256 "79ab2ed26cc1354fd4229369defe9e449307af1c09122373b86d63526315243b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aterm-darwin-arm64"
        sha256 "1964c2a0887f83cedc8f77ab4b6af1d32c0922e8ed491cb69f508244684f853a"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aos-linux-amd64"
      sha256 "e422ea1bc52f8f5da4f923e7691ad2da4274f60943184e02ca437f578a42894a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aoscompose-linux-amd64"
        sha256 "e422ea1bc52f8f5da4f923e7691ad2da4274f60943184e02ca437f578a42894a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aosward-linux-amd64"
        sha256 "e422ea1bc52f8f5da4f923e7691ad2da4274f60943184e02ca437f578a42894a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aosguard-linux-amd64"
        sha256 "75738c0c759be206df10ef1e0fd55bcde2070d1174c585ce17fad3eb95836e8a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aterm-linux-amd64"
        sha256 "b48d73e973b71713f3e81a69bd8e6131409f92c97421ad84191bb677add62c30"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aos-linux-arm64"
      sha256 "4d3933178d6e32805f3fec46674cb3b171a53711ae04b9f03e5f6492b6058358"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aoscompose-linux-arm64"
        sha256 "4d3933178d6e32805f3fec46674cb3b171a53711ae04b9f03e5f6492b6058358"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aosward-linux-arm64"
        sha256 "4d3933178d6e32805f3fec46674cb3b171a53711ae04b9f03e5f6492b6058358"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aosguard-linux-arm64"
        sha256 "bdbb544338302873d79c76e11f81d19ab98fb7eadf91203c35acc05c7bad1ac7"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.253.0/aterm-linux-arm64"
        sha256 "8cbfbbac479d72fde73ff60d665cbc972355e9159c2f35d46aaa63d8805589c2"
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
