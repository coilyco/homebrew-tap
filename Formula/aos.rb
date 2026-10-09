class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.456.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aos-darwin-arm64"
      sha256 "83f2d88ce1cf371092962970387249b908f1f984053e9d1d910f4e1b56596838"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aoscompose-darwin-arm64"
        sha256 "83f2d88ce1cf371092962970387249b908f1f984053e9d1d910f4e1b56596838"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aosward-darwin-arm64"
        sha256 "83f2d88ce1cf371092962970387249b908f1f984053e9d1d910f4e1b56596838"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aosguard-darwin-arm64"
        sha256 "7efd6bd69fc454bdbf4fe0621e325032f4e5290447654eae4f4a69a8878ffa21"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aterm-darwin-arm64"
        sha256 "40b117e50206eb7020ea89f059b508ab352de136c2e2b91918675d32196cd2b7"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aos-linux-amd64"
      sha256 "628d9503bdd7718b2864f03a434e8cd64d8c51f70e1f7c342abb8b33a60ae984"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aoscompose-linux-amd64"
        sha256 "628d9503bdd7718b2864f03a434e8cd64d8c51f70e1f7c342abb8b33a60ae984"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aosward-linux-amd64"
        sha256 "628d9503bdd7718b2864f03a434e8cd64d8c51f70e1f7c342abb8b33a60ae984"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aosguard-linux-amd64"
        sha256 "edf62609d436cff09f7fb93b90faa8624bef146d1f047c87a561aecf3f5398d5"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aterm-linux-amd64"
        sha256 "ff17b30e5c0d94876737238193e826c378a6bfcf8dab90ab70a5f5b8d919afce"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aos-linux-arm64"
      sha256 "71c2e6a5f7f5e517fe9100e0bf42c28a22af74dd64c49e8d8c687301c7b6e09e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aoscompose-linux-arm64"
        sha256 "71c2e6a5f7f5e517fe9100e0bf42c28a22af74dd64c49e8d8c687301c7b6e09e"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aosward-linux-arm64"
        sha256 "71c2e6a5f7f5e517fe9100e0bf42c28a22af74dd64c49e8d8c687301c7b6e09e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aosguard-linux-arm64"
        sha256 "25888b021a234df68a38e423f8259e9f4bad9653901fe9192b60f9a3a28d32e1"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.456.0/aterm-linux-arm64"
        sha256 "7f30468a6d0cf71fa4d45291e32a135f476cc6a56bbd7f9cb261ff448585fb47"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
