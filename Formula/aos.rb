class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.182.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aos-darwin-arm64"
      sha256 "3f705390aa0444d198d51fd8b9e71c0636dfb5e1ce4b8030f7fdaf3d1882e4ec"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aoscompose-darwin-arm64"
        sha256 "3f705390aa0444d198d51fd8b9e71c0636dfb5e1ce4b8030f7fdaf3d1882e4ec"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aosward-darwin-arm64"
        sha256 "3f705390aa0444d198d51fd8b9e71c0636dfb5e1ce4b8030f7fdaf3d1882e4ec"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aosguard-darwin-arm64"
        sha256 "379bc1365f0eac9957e209d6b1c3fe50082d3ef845e136e8250980bc494d2a73"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/agent-terminal-darwin-arm64"
        sha256 "4029ab53cbbfc262c12e7f64387dd9e77b01592d7d906ab1b5e885fc0a18e34b"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aosterm-darwin-arm64"
        sha256 "4029ab53cbbfc262c12e7f64387dd9e77b01592d7d906ab1b5e885fc0a18e34b"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aos-linux-amd64"
      sha256 "dfc9f627a1bfd1e57f687ffb9e57906e225edf8080a85952aa9831d6d158738c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aoscompose-linux-amd64"
        sha256 "dfc9f627a1bfd1e57f687ffb9e57906e225edf8080a85952aa9831d6d158738c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aosward-linux-amd64"
        sha256 "dfc9f627a1bfd1e57f687ffb9e57906e225edf8080a85952aa9831d6d158738c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aosguard-linux-amd64"
        sha256 "9aa7148960ce856e0efd9980be687b255dc53c9bded8883343215ecb1ef95d96"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/agent-terminal-linux-amd64"
        sha256 "f9be69e9e2a94f03e9707ec117c1baafe3068ca9a72c155c57c278db4ac85e78"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aosterm-linux-amd64"
        sha256 "f9be69e9e2a94f03e9707ec117c1baafe3068ca9a72c155c57c278db4ac85e78"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aos-linux-arm64"
      sha256 "88d810e77032beb31953bb036f01e8e102276c5ba588a0ef9c2a50b83164614b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aoscompose-linux-arm64"
        sha256 "88d810e77032beb31953bb036f01e8e102276c5ba588a0ef9c2a50b83164614b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aosward-linux-arm64"
        sha256 "88d810e77032beb31953bb036f01e8e102276c5ba588a0ef9c2a50b83164614b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aosguard-linux-arm64"
        sha256 "cc25752eda8fcdd59bc3b7600fe5d5196a8f8a48b46c9c9a0bbacc703648be14"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/agent-terminal-linux-arm64"
        sha256 "59a563ed311c30632fa80dec3e80a05091c9e5a50eee6f835d664eb351efea54"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.182.0/aosterm-linux-arm64"
        sha256 "59a563ed311c30632fa80dec3e80a05091c9e5a50eee6f835d664eb351efea54"
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
