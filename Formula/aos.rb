class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.283.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aos-darwin-arm64"
      sha256 "684ffea2d5d39660278ef17b8533525f108a227809b37c3ae8a53e0ddfc93c28"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aoscompose-darwin-arm64"
        sha256 "684ffea2d5d39660278ef17b8533525f108a227809b37c3ae8a53e0ddfc93c28"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aosward-darwin-arm64"
        sha256 "684ffea2d5d39660278ef17b8533525f108a227809b37c3ae8a53e0ddfc93c28"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aosguard-darwin-arm64"
        sha256 "abeceb8af4fe74f2c908d424691b56afdd27bc14da6f2ca9bc48893b756b7969"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aterm-darwin-arm64"
        sha256 "142b8db11119477b9c63ed6242a7c7a1056e5496dbe99e992216435e65f37c61"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aos-linux-amd64"
      sha256 "f0d51a6843baa73a0d465b237d27904640b71889c174eeccd2e87ae201a77866"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aoscompose-linux-amd64"
        sha256 "f0d51a6843baa73a0d465b237d27904640b71889c174eeccd2e87ae201a77866"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aosward-linux-amd64"
        sha256 "f0d51a6843baa73a0d465b237d27904640b71889c174eeccd2e87ae201a77866"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aosguard-linux-amd64"
        sha256 "eb63c6e064fd117feb60d3e8134594bdf44e72810d679639d71e1995f7885417"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aterm-linux-amd64"
        sha256 "f023c8d653ca4931efd831978c8185bab4d2bc407e58deaf09c4a958ebd0d69f"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aos-linux-arm64"
      sha256 "e7840db7eb328068f6ae4a3f8b23506bcefefb61ed0d4be2a505da547210877b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aoscompose-linux-arm64"
        sha256 "e7840db7eb328068f6ae4a3f8b23506bcefefb61ed0d4be2a505da547210877b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aosward-linux-arm64"
        sha256 "e7840db7eb328068f6ae4a3f8b23506bcefefb61ed0d4be2a505da547210877b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aosguard-linux-arm64"
        sha256 "5fd5f28038d8fb7ce61a0a88103779703fc15bdcc3a8d23073797b6f963c734c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.283.0/aterm-linux-arm64"
        sha256 "c95e4b8053c38e1aabb5317a852b971f0ad7663dbe54561ec20fb7db60a76650"
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
