class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.144.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.144.0/aos-darwin-arm64"
      sha256 "efdad3dfa4ad0fdd39e59f90a81395704a7075578ee7067bb8d35fc8fc23869c"
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.144.0/aosguard-darwin-arm64"
        sha256 "704f68a937ed20ae59217ef639eaeded4c0a5a0205b58fb2d67518f44be11f28"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.144.0/agent-terminal-darwin-arm64"
        sha256 "93b4964b967b3935cf5489068b1d3970793436277cf021656f67c067a3b25791"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.144.0/aos-linux-amd64"
      sha256 "a83547c31bb6cf72594d0ae04588002433eb20c725e2dd76cd939e411989bb9e"
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.144.0/aosguard-linux-amd64"
        sha256 "3e501e6d759067d19b007bdf02837718b5d1a0fc8254012941cad64edbf37bc1"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.144.0/agent-terminal-linux-amd64"
        sha256 "17a6628b175ebf3511e4d05fb08ce932dbb41f3547ab6fda9561bdf70d3f5fc7"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.144.0/aos-linux-arm64"
      sha256 "fad31486ad5be9f3b7819d7ca2497c32dd748273c71914ae545a8ce948622a3a"
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.144.0/aosguard-linux-arm64"
        sha256 "4f02e5add1b4d55d05fc3005df70ac4426c3dd688da726177d0bccaeafc38f2a"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.144.0/agent-terminal-linux-arm64"
        sha256 "9ab36d3dd7647a6975c750271b49a7099bfaed51c37887c6ca8e625a9d4115c4"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("agent-terminal").stage { bin.install Dir["agent-terminal-*"].first => "agent-terminal" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/agent-terminal --version")
  end
end
