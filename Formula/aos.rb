class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.298.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aos-darwin-arm64"
      sha256 "5caed681a48313bf9e51387b560ef2dd72e013a3eb5259266c471c6dca597475"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aoscompose-darwin-arm64"
        sha256 "5caed681a48313bf9e51387b560ef2dd72e013a3eb5259266c471c6dca597475"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aosward-darwin-arm64"
        sha256 "5caed681a48313bf9e51387b560ef2dd72e013a3eb5259266c471c6dca597475"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aosguard-darwin-arm64"
        sha256 "7031be304c0ba0c15b09f025daa76155e8799d38a649efc8d8b809dadb418ace"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aterm-darwin-arm64"
        sha256 "6ff75587c2429d3c5e32e35e7a99c86280b50254a1fbbbe3bf6091caa0e83100"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aos-linux-amd64"
      sha256 "2356c406af7431730f294d73a52b4e713cbf04851d5e7b4e44113574e4e385a8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aoscompose-linux-amd64"
        sha256 "2356c406af7431730f294d73a52b4e713cbf04851d5e7b4e44113574e4e385a8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aosward-linux-amd64"
        sha256 "2356c406af7431730f294d73a52b4e713cbf04851d5e7b4e44113574e4e385a8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aosguard-linux-amd64"
        sha256 "96bb6748f822b68e4b398b4db01d1b32a9f53ee9dd4d7a343cc7a2ad8dcdc397"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aterm-linux-amd64"
        sha256 "282322345622f52587f36fa175c4b060a8c11290d3a4793dba44813da5d7b463"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aos-linux-arm64"
      sha256 "ffcedd6a241b108708020cffcd88d0bc7cf24262c2c36303150ed5d2650e854a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aoscompose-linux-arm64"
        sha256 "ffcedd6a241b108708020cffcd88d0bc7cf24262c2c36303150ed5d2650e854a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aosward-linux-arm64"
        sha256 "ffcedd6a241b108708020cffcd88d0bc7cf24262c2c36303150ed5d2650e854a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aosguard-linux-arm64"
        sha256 "b8ce6c82527b7179bd8a9106a270186146a0aab2236ebe5fd1fadf562fbd5f1b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.298.0/aterm-linux-arm64"
        sha256 "10c56f835692c0b70fe1c33bf2ca1cbef81123bf5bc5f0175a8c070df36e093f"
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
