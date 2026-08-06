class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.183.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aos-darwin-arm64"
      sha256 "89762cc0d8622b9a657205d6a43b9901f87c398c0969beccf21aa69aca7c4943"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aoscompose-darwin-arm64"
        sha256 "89762cc0d8622b9a657205d6a43b9901f87c398c0969beccf21aa69aca7c4943"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aosward-darwin-arm64"
        sha256 "89762cc0d8622b9a657205d6a43b9901f87c398c0969beccf21aa69aca7c4943"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aosguard-darwin-arm64"
        sha256 "6bdcefb8d92d32d9f48ff611b2e9f5edc43babe2b3658045bf36d10f23b5ea7a"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/agent-terminal-darwin-arm64"
        sha256 "48d5ff3658e9a4cbce6ef7ffd43ec5a97c0e2a11cb3c7ba5cad932273a8a67b6"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aosterm-darwin-arm64"
        sha256 "48d5ff3658e9a4cbce6ef7ffd43ec5a97c0e2a11cb3c7ba5cad932273a8a67b6"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aos-linux-amd64"
      sha256 "599dc73466ae92441e8b78c95d1d1765628be84af89ebbd8f365c3ff56dbfd8d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aoscompose-linux-amd64"
        sha256 "599dc73466ae92441e8b78c95d1d1765628be84af89ebbd8f365c3ff56dbfd8d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aosward-linux-amd64"
        sha256 "599dc73466ae92441e8b78c95d1d1765628be84af89ebbd8f365c3ff56dbfd8d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aosguard-linux-amd64"
        sha256 "e74cb8ec318692c2512fee3154848fd5d854cd629325d3806665c83d5bcdf872"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/agent-terminal-linux-amd64"
        sha256 "ce72acd5e4f11b7a6162a403bcda331c57ebd36f229df4995e52478a69752c90"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aosterm-linux-amd64"
        sha256 "ce72acd5e4f11b7a6162a403bcda331c57ebd36f229df4995e52478a69752c90"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aos-linux-arm64"
      sha256 "5b757911a13bce24465ed2e55b80fc9e6a1e19fe769ffecfbb2546994c84b4e8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aoscompose-linux-arm64"
        sha256 "5b757911a13bce24465ed2e55b80fc9e6a1e19fe769ffecfbb2546994c84b4e8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aosward-linux-arm64"
        sha256 "5b757911a13bce24465ed2e55b80fc9e6a1e19fe769ffecfbb2546994c84b4e8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aosguard-linux-arm64"
        sha256 "7bf7eabc648b383a5b4964f628a6c01c5d5fe0ac60007009d94bde75bce58ccf"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/agent-terminal-linux-arm64"
        sha256 "168ee8fc0f8df8ef165c778b351a519cc799abba55ab642ff6236e647c34ec94"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.183.0/aosterm-linux-arm64"
        sha256 "168ee8fc0f8df8ef165c778b351a519cc799abba55ab642ff6236e647c34ec94"
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
