class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.369.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aos-darwin-arm64"
      sha256 "edb2bd5df00a3a394b90f34cdd88a71a4e73add2384f0367ff02ac77e016f4e3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aoscompose-darwin-arm64"
        sha256 "edb2bd5df00a3a394b90f34cdd88a71a4e73add2384f0367ff02ac77e016f4e3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aosward-darwin-arm64"
        sha256 "edb2bd5df00a3a394b90f34cdd88a71a4e73add2384f0367ff02ac77e016f4e3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aosguard-darwin-arm64"
        sha256 "b72988ef12742ad3f7846731efc86422f298051d3f44e4243fc11366430f33d7"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aterm-darwin-arm64"
        sha256 "923ee652a24de6a8b72ff3f433b698263b985909448bf26d0202ef36cd0ecd22"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aos-linux-amd64"
      sha256 "84afa7a0a5626d3353ec53add53c3da2e7323167223bfd75e9cc5218f597b592"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aoscompose-linux-amd64"
        sha256 "84afa7a0a5626d3353ec53add53c3da2e7323167223bfd75e9cc5218f597b592"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aosward-linux-amd64"
        sha256 "84afa7a0a5626d3353ec53add53c3da2e7323167223bfd75e9cc5218f597b592"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aosguard-linux-amd64"
        sha256 "afe804193621f56b8e423e78bf2aab517c48c1aac5b6b6547cd269a1130b6baf"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aterm-linux-amd64"
        sha256 "3529674ec522845f4f7a71dd8a79aef5f4cd625265075dbae590fe162d0e01d8"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aos-linux-arm64"
      sha256 "70b5f60e8f480dd46b3ed9458ddaf728c2dbdd0958b47e3c4a0cca68d5eb7f53"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aoscompose-linux-arm64"
        sha256 "70b5f60e8f480dd46b3ed9458ddaf728c2dbdd0958b47e3c4a0cca68d5eb7f53"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aosward-linux-arm64"
        sha256 "70b5f60e8f480dd46b3ed9458ddaf728c2dbdd0958b47e3c4a0cca68d5eb7f53"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aosguard-linux-arm64"
        sha256 "62ff8e8885c702278b96036f26b6d44b00adf588249b55311d3f2f4650d9b9fd"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.369.0/aterm-linux-arm64"
        sha256 "cc29a5d63064d0fa785832416edccd34d1725438a460a317c53233234dd5bd7c"
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
