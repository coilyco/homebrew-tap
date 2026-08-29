class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.277.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aos-darwin-arm64"
      sha256 "5294559ae6a42e3e234f5f562a0824bc2ddc8a0a20a257330425cfa2dfd7d257"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aoscompose-darwin-arm64"
        sha256 "5294559ae6a42e3e234f5f562a0824bc2ddc8a0a20a257330425cfa2dfd7d257"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aosward-darwin-arm64"
        sha256 "5294559ae6a42e3e234f5f562a0824bc2ddc8a0a20a257330425cfa2dfd7d257"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aosguard-darwin-arm64"
        sha256 "6c919dc8064fd3f52a7df274973d1ea578b4a5db79b68f12e1b84507a86b1348"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aterm-darwin-arm64"
        sha256 "e50c5fe9f5217946f8a87d90ef8459d150320df9938857983dd83445474dfa7c"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aos-linux-amd64"
      sha256 "df3d51e86dc53a614afa5a300466836a14a53fb1655dfe4a288caf9d416894c7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aoscompose-linux-amd64"
        sha256 "df3d51e86dc53a614afa5a300466836a14a53fb1655dfe4a288caf9d416894c7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aosward-linux-amd64"
        sha256 "df3d51e86dc53a614afa5a300466836a14a53fb1655dfe4a288caf9d416894c7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aosguard-linux-amd64"
        sha256 "4824a40331fbf6a0c2ab2bb612bc86a83570f3dfdde3125a44905566d2d4f8a8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aterm-linux-amd64"
        sha256 "218e25dd16366c90e74f270de764d81a663e74a0b2e7479341a52a276de98ffa"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aos-linux-arm64"
      sha256 "b28343af23ff22bc095dcee7bd1e281b9789165dbdf8d009e04ad195ffe5b1f6"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aoscompose-linux-arm64"
        sha256 "b28343af23ff22bc095dcee7bd1e281b9789165dbdf8d009e04ad195ffe5b1f6"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aosward-linux-arm64"
        sha256 "b28343af23ff22bc095dcee7bd1e281b9789165dbdf8d009e04ad195ffe5b1f6"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aosguard-linux-arm64"
        sha256 "8319fdf9b9e81dc237cc5fba6b495514e0f1ded8c9a9d4994200d64d74093453"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.277.0/aterm-linux-arm64"
        sha256 "ab3625a1a13e1dce47ad4999a13faa02d531905da0fef93f34911436bee9743e"
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
