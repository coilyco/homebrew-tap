class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.152.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/aos-darwin-arm64"
      sha256 "3b4bd7134a2cd745b9dc1946a0185c7f8d47b86db5138250badd088242750d77"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/aoscompose-darwin-arm64"
        sha256 "3b4bd7134a2cd745b9dc1946a0185c7f8d47b86db5138250badd088242750d77"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/aosward-darwin-arm64"
        sha256 "3b4bd7134a2cd745b9dc1946a0185c7f8d47b86db5138250badd088242750d77"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/aosguard-darwin-arm64"
        sha256 "2853eb7ce2f6857fc862ec8d8fbbf338f37736b7052b83dd9c21df1b75c11cd2"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/agent-terminal-darwin-arm64"
        sha256 "7af1683301c05f2349670d1c81f5534cbe79d26553ab2ecbd6406f248148f801"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/aos-linux-amd64"
      sha256 "21b082f0e71752241ec383b3d79f890e6f516e78813db757bd8e9c57b18fa878"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/aoscompose-linux-amd64"
        sha256 "21b082f0e71752241ec383b3d79f890e6f516e78813db757bd8e9c57b18fa878"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/aosward-linux-amd64"
        sha256 "21b082f0e71752241ec383b3d79f890e6f516e78813db757bd8e9c57b18fa878"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/aosguard-linux-amd64"
        sha256 "b6e79a5081a138db33ca135b5b7ee0dacfbbf05810a98b1745e930fd50fd2ff9"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/agent-terminal-linux-amd64"
        sha256 "399f85afd38789ef9ef37990af89565325698781f68d50d649898e6c7141198c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/aos-linux-arm64"
      sha256 "0fefe4d53330be11981b5b39afae0176a084501c7b927de18a4ddf5e94631515"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/aoscompose-linux-arm64"
        sha256 "0fefe4d53330be11981b5b39afae0176a084501c7b927de18a4ddf5e94631515"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/aosward-linux-arm64"
        sha256 "0fefe4d53330be11981b5b39afae0176a084501c7b927de18a4ddf5e94631515"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/aosguard-linux-arm64"
        sha256 "35bf9cc1c019e4bed7ac5bc23be2b5132e065863447cdaf7ceaaa8e294808a75"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.152.0/agent-terminal-linux-arm64"
        sha256 "4bdc91c1b04f1d93a5a6ca34a7838ebc7f66299424f0799d1df5ee724e12bcdf"
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
