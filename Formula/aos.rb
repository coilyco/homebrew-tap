class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.143.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.143.0/aos-darwin-arm64"
      sha256 "402ca34888145ea579e37dc93481cbfbe2aeb650a55abaec7c2ed017ef16d758"
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.143.0/aosguard-darwin-arm64"
        sha256 "c0dda48aceef4652fb88f5886059777d016e890151c6993666f092b2e6ed76f6"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.143.0/agent-terminal-darwin-arm64"
        sha256 "a832efec5c7038372fd2af2852f82c2f073e9dc22d3ae3d8ef82ca1614597311"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.143.0/aos-linux-amd64"
      sha256 "06d82cba37d29dbc21aa45a195068eba67e718f750bd1a3e20efaa82efa43597"
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.143.0/aosguard-linux-amd64"
        sha256 "7e33556d56cb796001b62d2234625b8459b04fb4cb6dac175f56b23a5042f0ad"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.143.0/agent-terminal-linux-amd64"
        sha256 "9458ece63b16990aecdba29eb0da68653d264ec790e44044bbd7dbc039533155"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.143.0/aos-linux-arm64"
      sha256 "2eb47a3cadd5d70a7588b3f5c1438c1abb50e30011938b07963142f597c9f56f"
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.143.0/aosguard-linux-arm64"
        sha256 "4821b2e8e9bbc22f8ff3b2632853fe296b198a1dc9e28f990eb690b21ebe6923"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.143.0/agent-terminal-linux-arm64"
        sha256 "a5761ac9e700e24aa0efab2a2bbe14856e9f52a06e331df29cb59f82212bd249"
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
