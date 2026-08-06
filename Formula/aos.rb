class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.177.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aos-darwin-arm64"
      sha256 "0ce943351ec64ad2511d85b71b53c5fc82dbb19eb6166061518d3885a3d153d1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aoscompose-darwin-arm64"
        sha256 "0ce943351ec64ad2511d85b71b53c5fc82dbb19eb6166061518d3885a3d153d1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aosward-darwin-arm64"
        sha256 "0ce943351ec64ad2511d85b71b53c5fc82dbb19eb6166061518d3885a3d153d1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aosguard-darwin-arm64"
        sha256 "1b5e395a36432a4c0b4abccde0ce33c2c254db25bdf0071a69ef4bacfb314405"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/agent-terminal-darwin-arm64"
        sha256 "c02c42dad30e2f4607e4edd522b1fb7b935a9c8d63a32599296250e75af67117"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aosterm-darwin-arm64"
        sha256 "c02c42dad30e2f4607e4edd522b1fb7b935a9c8d63a32599296250e75af67117"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aos-linux-amd64"
      sha256 "f1871d75eed622e467e5798830f440f3b0a9af3c7e97fa55336c18e8f522d9c0"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aoscompose-linux-amd64"
        sha256 "f1871d75eed622e467e5798830f440f3b0a9af3c7e97fa55336c18e8f522d9c0"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aosward-linux-amd64"
        sha256 "f1871d75eed622e467e5798830f440f3b0a9af3c7e97fa55336c18e8f522d9c0"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aosguard-linux-amd64"
        sha256 "5ec1ec1ccbf0f2187587056ed488d6b53c4ce76cd4fe62b4ce0a8aecee94dcae"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/agent-terminal-linux-amd64"
        sha256 "bbca1c7bb9000d725cc4ff8fe59728ab04c73730fa94ec8c2853d57e30446c3b"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aosterm-linux-amd64"
        sha256 "bbca1c7bb9000d725cc4ff8fe59728ab04c73730fa94ec8c2853d57e30446c3b"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aos-linux-arm64"
      sha256 "d2fb7409fd01706f9b6b4f04c133eb2a5d509774736ac8c06815b003f2678f2a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aoscompose-linux-arm64"
        sha256 "d2fb7409fd01706f9b6b4f04c133eb2a5d509774736ac8c06815b003f2678f2a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aosward-linux-arm64"
        sha256 "d2fb7409fd01706f9b6b4f04c133eb2a5d509774736ac8c06815b003f2678f2a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aosguard-linux-arm64"
        sha256 "e909af934ecf2f92e24184a361ada34428a3495fbbb94614d18a8f480bacb703"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/agent-terminal-linux-arm64"
        sha256 "b8a44814c13034415bee833724017701bd1ed5c73e9884da834118ea3696d1f3"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.177.0/aosterm-linux-arm64"
        sha256 "b8a44814c13034415bee833724017701bd1ed5c73e9884da834118ea3696d1f3"
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
