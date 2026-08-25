class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.223.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aos-darwin-arm64"
      sha256 "a323974c5277d4efc45c2edd3944231f3954c668c7d31bb237ad40b1034843f7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aoscompose-darwin-arm64"
        sha256 "a323974c5277d4efc45c2edd3944231f3954c668c7d31bb237ad40b1034843f7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aosward-darwin-arm64"
        sha256 "a323974c5277d4efc45c2edd3944231f3954c668c7d31bb237ad40b1034843f7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aosguard-darwin-arm64"
        sha256 "4296c3be88f9aaca98fc6492f8121992595004df96107edd625257c77680f02c"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/agent-terminal-darwin-arm64"
        sha256 "c47f2bbe00c483c0c57bc03cdb718c8512903dda61da5aadbfa060057dc66706"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aosterm-darwin-arm64"
        sha256 "c47f2bbe00c483c0c57bc03cdb718c8512903dda61da5aadbfa060057dc66706"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aos-linux-amd64"
      sha256 "84cb3482be87e9cdb1db5593ea256ca59aa876cfd74c83f6cec139e850bfc0bf"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aoscompose-linux-amd64"
        sha256 "84cb3482be87e9cdb1db5593ea256ca59aa876cfd74c83f6cec139e850bfc0bf"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aosward-linux-amd64"
        sha256 "84cb3482be87e9cdb1db5593ea256ca59aa876cfd74c83f6cec139e850bfc0bf"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aosguard-linux-amd64"
        sha256 "1e0a34a02080500288923590eadcf775fa5162d77860456c4a223a395f05a3db"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/agent-terminal-linux-amd64"
        sha256 "a58e1daedd821c380282ca0e0dc045973aa9d0f9132064e75a9f4e5f3197dfcc"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aosterm-linux-amd64"
        sha256 "a58e1daedd821c380282ca0e0dc045973aa9d0f9132064e75a9f4e5f3197dfcc"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aos-linux-arm64"
      sha256 "61644a888e61faf2930f34b4bb717504fb3eb849ef2afdba02ad7049c1d600ea"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aoscompose-linux-arm64"
        sha256 "61644a888e61faf2930f34b4bb717504fb3eb849ef2afdba02ad7049c1d600ea"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aosward-linux-arm64"
        sha256 "61644a888e61faf2930f34b4bb717504fb3eb849ef2afdba02ad7049c1d600ea"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aosguard-linux-arm64"
        sha256 "530c45152fe66990dfe1b5d36267f9685f7eed9289098068802a09d8b9f68a64"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/agent-terminal-linux-arm64"
        sha256 "3c07efa2b15f9edd36169bf7bd4fce97cdffccd7a0d193b72d09d3fd037dd700"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.223.0/aosterm-linux-arm64"
        sha256 "3c07efa2b15f9edd36169bf7bd4fce97cdffccd7a0d193b72d09d3fd037dd700"
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
