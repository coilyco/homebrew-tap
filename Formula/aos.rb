class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.173.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aos-darwin-arm64"
      sha256 "23c06ae535bdb5b9f94d3dfc1de0fcbec4baff627853674d8dffa94b276b4c8f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aoscompose-darwin-arm64"
        sha256 "23c06ae535bdb5b9f94d3dfc1de0fcbec4baff627853674d8dffa94b276b4c8f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aosward-darwin-arm64"
        sha256 "23c06ae535bdb5b9f94d3dfc1de0fcbec4baff627853674d8dffa94b276b4c8f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aosguard-darwin-arm64"
        sha256 "25433dfabb83dfb52f0c5090aa6a7d94dcb38cb64f0ea08ed61027a2054d42d7"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/agent-terminal-darwin-arm64"
        sha256 "150ce53c45a314a8ae4e30da6d1544697292c64b1a1ae38c26e8c8c7685521f5"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aosterm-darwin-arm64"
        sha256 "150ce53c45a314a8ae4e30da6d1544697292c64b1a1ae38c26e8c8c7685521f5"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aos-linux-amd64"
      sha256 "51841c0f9488d5ccdf4e3f0da6391cd1a9b5e67879ce96d9064b20d1aacc7f7d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aoscompose-linux-amd64"
        sha256 "51841c0f9488d5ccdf4e3f0da6391cd1a9b5e67879ce96d9064b20d1aacc7f7d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aosward-linux-amd64"
        sha256 "51841c0f9488d5ccdf4e3f0da6391cd1a9b5e67879ce96d9064b20d1aacc7f7d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aosguard-linux-amd64"
        sha256 "6abb7d550ee051f3d07884c2622786add3e13ae5f4a67a28fa2bb33ccae07903"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/agent-terminal-linux-amd64"
        sha256 "d75fc877cd10689bc45eba4233de13a9e4c57c9d88abe83add4cd9fa840bdb4f"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aosterm-linux-amd64"
        sha256 "d75fc877cd10689bc45eba4233de13a9e4c57c9d88abe83add4cd9fa840bdb4f"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aos-linux-arm64"
      sha256 "6d5ffcab3baa56aa58b767cb4258e06ae2e57f0140837d7923d56d2ae12ddc35"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aoscompose-linux-arm64"
        sha256 "6d5ffcab3baa56aa58b767cb4258e06ae2e57f0140837d7923d56d2ae12ddc35"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aosward-linux-arm64"
        sha256 "6d5ffcab3baa56aa58b767cb4258e06ae2e57f0140837d7923d56d2ae12ddc35"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aosguard-linux-arm64"
        sha256 "d39df09c0639c95877e46b647190072781bbdf6057fd2dbc862f3ce5acc26f54"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/agent-terminal-linux-arm64"
        sha256 "3caec6976b04b7f999792323e1d08e1211a39b9ac0cbcae58ab4cdf658b48bbd"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.173.0/aosterm-linux-arm64"
        sha256 "3caec6976b04b7f999792323e1d08e1211a39b9ac0cbcae58ab4cdf658b48bbd"
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
