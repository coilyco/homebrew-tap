class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.184.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aos-darwin-arm64"
      sha256 "67ae7aaa667196d848620c85dd259dda2720ddbdf845ba33b92dfa2ecbac4126"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aoscompose-darwin-arm64"
        sha256 "67ae7aaa667196d848620c85dd259dda2720ddbdf845ba33b92dfa2ecbac4126"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aosward-darwin-arm64"
        sha256 "67ae7aaa667196d848620c85dd259dda2720ddbdf845ba33b92dfa2ecbac4126"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aosguard-darwin-arm64"
        sha256 "57b32689cfa4ca77e558b65b1be82ee68ea54d41478d9c233eb75dbe7ac0f778"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/agent-terminal-darwin-arm64"
        sha256 "07539cb0e7b219dc6db8a4a5a5a90027ad5f69cd86085b6ded05bd6fd9d46664"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aosterm-darwin-arm64"
        sha256 "07539cb0e7b219dc6db8a4a5a5a90027ad5f69cd86085b6ded05bd6fd9d46664"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aos-linux-amd64"
      sha256 "74304a22eb4b68591b45a82a0d02bb51af03c42dedf6931ca4511f37257bf809"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aoscompose-linux-amd64"
        sha256 "74304a22eb4b68591b45a82a0d02bb51af03c42dedf6931ca4511f37257bf809"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aosward-linux-amd64"
        sha256 "74304a22eb4b68591b45a82a0d02bb51af03c42dedf6931ca4511f37257bf809"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aosguard-linux-amd64"
        sha256 "415f13507b2f6d98961b2170c000c4ab53d1cc7e4919bf0e03baea8405504861"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/agent-terminal-linux-amd64"
        sha256 "9bf11c3c982e85326ceb63c42abf46ddf5fd498b2fc532bd0c2f751eda18e243"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aosterm-linux-amd64"
        sha256 "9bf11c3c982e85326ceb63c42abf46ddf5fd498b2fc532bd0c2f751eda18e243"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aos-linux-arm64"
      sha256 "f858385932dd5d48932623d3b9131634da10dde8263bc17880c6ec42b5358c66"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aoscompose-linux-arm64"
        sha256 "f858385932dd5d48932623d3b9131634da10dde8263bc17880c6ec42b5358c66"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aosward-linux-arm64"
        sha256 "f858385932dd5d48932623d3b9131634da10dde8263bc17880c6ec42b5358c66"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aosguard-linux-arm64"
        sha256 "8ee2b851f323536fafdea71e8210290883fbca09dfa45f6f2b017c29247c886d"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/agent-terminal-linux-arm64"
        sha256 "cf2fcd0929a4edfe4eb815782e569802e01155739e0efb9618e92d475a6f8026"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.184.0/aosterm-linux-arm64"
        sha256 "cf2fcd0929a4edfe4eb815782e569802e01155739e0efb9618e92d475a6f8026"
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
