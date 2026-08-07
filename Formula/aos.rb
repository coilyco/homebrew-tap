class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.185.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aos-darwin-arm64"
      sha256 "a6314eab50b23a324de614a0c02519bf1f281f2105b297e10b18084d04be7a72"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aoscompose-darwin-arm64"
        sha256 "a6314eab50b23a324de614a0c02519bf1f281f2105b297e10b18084d04be7a72"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aosward-darwin-arm64"
        sha256 "a6314eab50b23a324de614a0c02519bf1f281f2105b297e10b18084d04be7a72"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aosguard-darwin-arm64"
        sha256 "855de013a44425a61e570a3278ba4ae1550b26f46c5ff6bed483ccd6b547edd7"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/agent-terminal-darwin-arm64"
        sha256 "69ee6be509f9660ae292375269de37dd806f3056ac6860c6f07d3da155f61a75"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aosterm-darwin-arm64"
        sha256 "69ee6be509f9660ae292375269de37dd806f3056ac6860c6f07d3da155f61a75"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aos-linux-amd64"
      sha256 "929982f7782f70dd1a0e31f5af997d1651169f7909f051ab39d35125291de8b6"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aoscompose-linux-amd64"
        sha256 "929982f7782f70dd1a0e31f5af997d1651169f7909f051ab39d35125291de8b6"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aosward-linux-amd64"
        sha256 "929982f7782f70dd1a0e31f5af997d1651169f7909f051ab39d35125291de8b6"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aosguard-linux-amd64"
        sha256 "129a4048a0d0df7ca4973fbea48dc032880f43bb7151384e77f0d237a3cf8774"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/agent-terminal-linux-amd64"
        sha256 "e1ba0052b78904c1f2976baae68b209bdc5e9730403d721aaf2808c6ffe96fa9"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aosterm-linux-amd64"
        sha256 "e1ba0052b78904c1f2976baae68b209bdc5e9730403d721aaf2808c6ffe96fa9"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aos-linux-arm64"
      sha256 "3cc913cbf2e9687e41484b9133b57e409a969c0837aedfa7830fd2daab1b850c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aoscompose-linux-arm64"
        sha256 "3cc913cbf2e9687e41484b9133b57e409a969c0837aedfa7830fd2daab1b850c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aosward-linux-arm64"
        sha256 "3cc913cbf2e9687e41484b9133b57e409a969c0837aedfa7830fd2daab1b850c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aosguard-linux-arm64"
        sha256 "ef09f15f076e717e80d2a65263e8036b3a00ab543d3c2f2025adf70a13dfcc42"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/agent-terminal-linux-arm64"
        sha256 "721ab115c3e4668b381d3b40d5a1b90b64107185fe6220b18db71a43e28a1b86"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.185.0/aosterm-linux-arm64"
        sha256 "721ab115c3e4668b381d3b40d5a1b90b64107185fe6220b18db71a43e28a1b86"
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
