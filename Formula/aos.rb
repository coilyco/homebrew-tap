class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.159.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/aos-darwin-arm64"
      sha256 "adc65e888897d4601ea24159a05238360804355196a671461e92d0024772c2e5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/aoscompose-darwin-arm64"
        sha256 "adc65e888897d4601ea24159a05238360804355196a671461e92d0024772c2e5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/aosward-darwin-arm64"
        sha256 "adc65e888897d4601ea24159a05238360804355196a671461e92d0024772c2e5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/aosguard-darwin-arm64"
        sha256 "0b1ebb5249bbc06706aeb92cec03d46f224193205d6a89bc4f3f82e0a1df7b3d"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/agent-terminal-darwin-arm64"
        sha256 "a5d7220ae158b59fce2359cba9da45fd6cef56dbfd598bc78de8caa29f463fdd"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/aos-linux-amd64"
      sha256 "94478f43ecc0ccb4060827ff01a53cbf4187aa4f2e1d37ab99a6b46d9aa6a50f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/aoscompose-linux-amd64"
        sha256 "94478f43ecc0ccb4060827ff01a53cbf4187aa4f2e1d37ab99a6b46d9aa6a50f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/aosward-linux-amd64"
        sha256 "94478f43ecc0ccb4060827ff01a53cbf4187aa4f2e1d37ab99a6b46d9aa6a50f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/aosguard-linux-amd64"
        sha256 "6c24b5a34a7a84a1c5fca1890c6eff9ec6e05c75fef8b17ae86ceff87b24181d"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/agent-terminal-linux-amd64"
        sha256 "b8d515cbc7f4e76ae7077c0edca36113c73176bf88b1823c186faaa7c8545b0b"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/aos-linux-arm64"
      sha256 "78bd29a9e1e75d108fdb9dca1343be33112f4f9379c43857843e4ed47690fe95"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/aoscompose-linux-arm64"
        sha256 "78bd29a9e1e75d108fdb9dca1343be33112f4f9379c43857843e4ed47690fe95"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/aosward-linux-arm64"
        sha256 "78bd29a9e1e75d108fdb9dca1343be33112f4f9379c43857843e4ed47690fe95"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/aosguard-linux-arm64"
        sha256 "40f1813e18383e219c27e0ed02f28b6247c29afad1be755366d3b6fe9e531e99"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.159.0/agent-terminal-linux-arm64"
        sha256 "28ca96a0f7a686efb13ce2141bbb9d627fbf2b9de86ea6aa881590e5970d76e2"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("agent-terminal").stage { bin.install Dir["agent-terminal-*"].first => "agent-terminal" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/agent-terminal --version")
  end
end
