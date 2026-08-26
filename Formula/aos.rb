class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.228.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aos-darwin-arm64"
      sha256 "29b737310868564f2870c4dca3e510d61ec9568de73c0b04430efbeecca58ebd"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aoscompose-darwin-arm64"
        sha256 "29b737310868564f2870c4dca3e510d61ec9568de73c0b04430efbeecca58ebd"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aosward-darwin-arm64"
        sha256 "29b737310868564f2870c4dca3e510d61ec9568de73c0b04430efbeecca58ebd"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aosguard-darwin-arm64"
        sha256 "f1dfd5af7c134b7c324d3d7633ce436929e9d47fa2878ef482649df418cc18bb"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aterm-darwin-arm64"
        sha256 "0544b4b76c3019edb73c498c25c9852487a55fc4146619eb62f6dfbc0bfe0744"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aos-linux-amd64"
      sha256 "1be636a4e34c25ecc91a5e91c3ae80d3fc7ba161e265d4074c53e1704eab0f3d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aoscompose-linux-amd64"
        sha256 "1be636a4e34c25ecc91a5e91c3ae80d3fc7ba161e265d4074c53e1704eab0f3d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aosward-linux-amd64"
        sha256 "1be636a4e34c25ecc91a5e91c3ae80d3fc7ba161e265d4074c53e1704eab0f3d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aosguard-linux-amd64"
        sha256 "4a1125166dec756d64146f0efc7889fffe7d8a6333b268901ceb3fbed65677e1"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aterm-linux-amd64"
        sha256 "a6c4886716ad83bdd5c67922a797e3bad5c84670803509f72c61f01bd790906d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aos-linux-arm64"
      sha256 "e9c243f6d0fbc4657833d321a165f3f5d43b04f8e8e067e4a7f6c185698e9552"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aoscompose-linux-arm64"
        sha256 "e9c243f6d0fbc4657833d321a165f3f5d43b04f8e8e067e4a7f6c185698e9552"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aosward-linux-arm64"
        sha256 "e9c243f6d0fbc4657833d321a165f3f5d43b04f8e8e067e4a7f6c185698e9552"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aosguard-linux-arm64"
        sha256 "695c94af7f440704672d6c90aa61a5e7dd6223f58d4842952011ebc1969e8224"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.228.0/aterm-linux-arm64"
        sha256 "6fbb8c30b88fe94790e9121bbd81ffd95107fda6d92ecf287a5fa0a068492674"
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
