class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.142.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.142.0/aos-darwin-arm64"
      sha256 "fd1637c13b064676029b3ea36ee173bf25fee9c557495145b979d17935a4ad0e"
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.142.0/aosguard-darwin-arm64"
        sha256 "33821dd43685f9fca73b2f3683ddef60c64358956b861e2bdf9b681c0c2de7cb"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.142.0/agent-terminal-darwin-arm64"
        sha256 "2ff86ad4d64c030314cf6fe6f03e20859739a51c4d049ef7586e1c5f27e0a028"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.142.0/aos-linux-amd64"
      sha256 "92a5c53acd95a9fbebabceba41bb5525d93c0c36b6b647a07eb6b04b44a7f2ce"
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.142.0/aosguard-linux-amd64"
        sha256 "1a5fab4196362db22136b43c0c00963435bf057d1a6891bd3921c0d068d96bf0"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.142.0/agent-terminal-linux-amd64"
        sha256 "cd2eb116248cb8ab0f1c9bc4415a79d5bc58d0dd0c696e39bd09e81b65223e26"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.142.0/aos-linux-arm64"
      sha256 "056f9eaee7ed76a7f241dedb571e2cdc9990cf1ac540de4b8b03ca24ae31e152"
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.142.0/aosguard-linux-arm64"
        sha256 "cece66f0188eb0866f9f83b4f872f12cee49ae1e0b7e97be8a76e04bd62c64d3"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.142.0/agent-terminal-linux-arm64"
        sha256 "28067ce442cdb1dd11a54474ce3664fb466459fbb5740ba6e2c70a8a2b4a70f8"
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
