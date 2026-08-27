class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.256.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aos-darwin-arm64"
      sha256 "74953b338966bd87a7a6c202aa95a761f7e46b8925155b592977f933df5fe6a2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aoscompose-darwin-arm64"
        sha256 "74953b338966bd87a7a6c202aa95a761f7e46b8925155b592977f933df5fe6a2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aosward-darwin-arm64"
        sha256 "74953b338966bd87a7a6c202aa95a761f7e46b8925155b592977f933df5fe6a2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aosguard-darwin-arm64"
        sha256 "0eb27359ccb9fe9938800dbb22b40d895acc3e6036654365952f29b486725b62"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aterm-darwin-arm64"
        sha256 "9f78295ece12a9c9c53014ecbd8c6b6957649c97b5bfb0aa7d978b9ea348373a"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aos-linux-amd64"
      sha256 "3e4d1cae88f0107448f4d4f9fecf699c7e9e55680455ecb61d8285a208952946"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aoscompose-linux-amd64"
        sha256 "3e4d1cae88f0107448f4d4f9fecf699c7e9e55680455ecb61d8285a208952946"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aosward-linux-amd64"
        sha256 "3e4d1cae88f0107448f4d4f9fecf699c7e9e55680455ecb61d8285a208952946"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aosguard-linux-amd64"
        sha256 "e894d65eb4ef6a6025667bf5f8165c6b815286b871888c830023e221f21e409f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aterm-linux-amd64"
        sha256 "cf0779f107e761e8cf33f2a38a3cace361f1e4ead875d3e73ef816141c8c51d2"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aos-linux-arm64"
      sha256 "71ea2a94070172dcfb03424ef1d7f04ad125e5b9fec727a0f5089ee4597a4247"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aoscompose-linux-arm64"
        sha256 "71ea2a94070172dcfb03424ef1d7f04ad125e5b9fec727a0f5089ee4597a4247"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aosward-linux-arm64"
        sha256 "71ea2a94070172dcfb03424ef1d7f04ad125e5b9fec727a0f5089ee4597a4247"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aosguard-linux-arm64"
        sha256 "d97541f6ecfbd34154ca43b082fb7accfc560fb68c8ee902248f4b4d90095803"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.256.0/aterm-linux-arm64"
        sha256 "4eaf99b6360cdb54bd8b43a46cee95e015af4a07079793e3d61f45165966a123"
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
