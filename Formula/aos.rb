class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.205.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aos-darwin-arm64"
      sha256 "7868d6e1f1c3368153b5f478d23ef14a0aac60cc14df28931ff733ca005ec2fe"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aoscompose-darwin-arm64"
        sha256 "7868d6e1f1c3368153b5f478d23ef14a0aac60cc14df28931ff733ca005ec2fe"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aosward-darwin-arm64"
        sha256 "7868d6e1f1c3368153b5f478d23ef14a0aac60cc14df28931ff733ca005ec2fe"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aosguard-darwin-arm64"
        sha256 "509cc545868a6014c1d20272cf4b9f071cac2ff9caa197db45f508c616db0147"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/agent-terminal-darwin-arm64"
        sha256 "98c8bd7802c6058fe8564c0cf3200335f8ab43cdbc202e42255c2e7fb8a1bbc3"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aosterm-darwin-arm64"
        sha256 "98c8bd7802c6058fe8564c0cf3200335f8ab43cdbc202e42255c2e7fb8a1bbc3"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aos-linux-amd64"
      sha256 "23873cd572f41d990a90a5459e750280a91a7add29edf09ce82d2691df28333a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aoscompose-linux-amd64"
        sha256 "23873cd572f41d990a90a5459e750280a91a7add29edf09ce82d2691df28333a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aosward-linux-amd64"
        sha256 "23873cd572f41d990a90a5459e750280a91a7add29edf09ce82d2691df28333a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aosguard-linux-amd64"
        sha256 "05eea6977a53f422dbd8a1dd79d90d39953d09f530e6228c41c679a4e3e39ab9"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/agent-terminal-linux-amd64"
        sha256 "b6f1406d40bd6a43da3c61e347ffa8a22f06a12881604c683f0fad14f9c5c0d3"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aosterm-linux-amd64"
        sha256 "b6f1406d40bd6a43da3c61e347ffa8a22f06a12881604c683f0fad14f9c5c0d3"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aos-linux-arm64"
      sha256 "8353a3730e27dcba3f5d9235cc5801f3065739c33269f7a324f34336758dacfb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aoscompose-linux-arm64"
        sha256 "8353a3730e27dcba3f5d9235cc5801f3065739c33269f7a324f34336758dacfb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aosward-linux-arm64"
        sha256 "8353a3730e27dcba3f5d9235cc5801f3065739c33269f7a324f34336758dacfb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aosguard-linux-arm64"
        sha256 "62fffa9c4dd579f9314cffc5db760289fa12d99e77ba63015b80ddcdf87ff18f"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/agent-terminal-linux-arm64"
        sha256 "78f4f73be77d8174d787ab381e73f90186ed5b14c0d0fca55ffca673e424f43b"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.205.0/aosterm-linux-arm64"
        sha256 "78f4f73be77d8174d787ab381e73f90186ed5b14c0d0fca55ffca673e424f43b"
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
    resource("aosterm").stage { bin.install Dir["aosterm-*"].first => "aosterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/agent-terminal --version")
    assert_match version.to_s, shell_output("#{bin}/aosterm --version")
  end
end
