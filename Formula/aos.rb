class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.156.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/aos-darwin-arm64"
      sha256 "ec57105c4ad7c43aece3b7f1d814aa7b85cd6fb7039b5de1095a2845898899b5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/aoscompose-darwin-arm64"
        sha256 "ec57105c4ad7c43aece3b7f1d814aa7b85cd6fb7039b5de1095a2845898899b5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/aosward-darwin-arm64"
        sha256 "ec57105c4ad7c43aece3b7f1d814aa7b85cd6fb7039b5de1095a2845898899b5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/aosguard-darwin-arm64"
        sha256 "d272cc8ec81b2efed46ae203c8a83baa7611a4e6da5709475f6c81c190f1ea95"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/agent-terminal-darwin-arm64"
        sha256 "5887f77106dcff1070b6f21656ee50d10def1c2e1fbab197db62a16808d59907"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/aos-linux-amd64"
      sha256 "286746487c6c38b056d71a21f8584ebebd0787cabe5ff0a31ba3ae0f157ac29c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/aoscompose-linux-amd64"
        sha256 "286746487c6c38b056d71a21f8584ebebd0787cabe5ff0a31ba3ae0f157ac29c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/aosward-linux-amd64"
        sha256 "286746487c6c38b056d71a21f8584ebebd0787cabe5ff0a31ba3ae0f157ac29c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/aosguard-linux-amd64"
        sha256 "1aafe8e475cd17540faa02bdbc95c3e8406dcc67ac5d65684c83380794409196"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/agent-terminal-linux-amd64"
        sha256 "8a5ddd28fcbe3d6869d5e46979fe46a6ed7d9cf691d521d9403fea9131ddd06f"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/aos-linux-arm64"
      sha256 "1445f2b4cb67b6519014e74fa95e133cd2e782adb8fa713f2544b498ae0ae425"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/aoscompose-linux-arm64"
        sha256 "1445f2b4cb67b6519014e74fa95e133cd2e782adb8fa713f2544b498ae0ae425"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/aosward-linux-arm64"
        sha256 "1445f2b4cb67b6519014e74fa95e133cd2e782adb8fa713f2544b498ae0ae425"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/aosguard-linux-arm64"
        sha256 "446712e5dd03b9dcabc0441e9b226a4b1dd201e6ae035913851e751d6be8521e"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.156.0/agent-terminal-linux-arm64"
        sha256 "2f2847bf913002a4c0a746f5e6d261accb02dc37f024ab2297ea48feac9afdd1"
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
