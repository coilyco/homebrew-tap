class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.573.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.573.0/aos-darwin-arm64"
    sha256 "a9a0cbf3e86b34b8a51a0d10d26c594554336d1289eda93c2eeb591993111360"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.573.0/aoscompose-darwin-arm64"
      sha256 "a9a0cbf3e86b34b8a51a0d10d26c594554336d1289eda93c2eeb591993111360"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.573.0/aosguard-darwin-arm64"
      sha256 "8bb7f8c66edac05afbae408a0f3dcb58b548f3d8310dbfa173fc98ce43dad83e"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.573.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "56883b3629ea73ca936f17c7b551e5c406b230846a3ccbd1514aa7f28f4b84de"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.573.0/aos-linux-amd64"
      sha256 "6e2397222ea172121cd87764a8d27b84934721f81e1a025ea4a3017e861dac9e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.573.0/aoscompose-linux-amd64"
        sha256 "6e2397222ea172121cd87764a8d27b84934721f81e1a025ea4a3017e861dac9e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.573.0/aosguard-linux-amd64"
        sha256 "7bce4c385070e49a43471421dd6d5ccfcdb3402caa83acc443e6eae6b3d39d56"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.573.0/aterm-linux-amd64"
        sha256 "c7aa7247a02f0176730f7806bd952efeed0112be951e7f55e4409ef5b9524e51"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.573.0/aos-linux-arm64"
      sha256 "2a6c4cde3c47b6a2deecb610be801f3293662981deea6ff9f8bb41e1e0b9e286"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.573.0/aoscompose-linux-arm64"
        sha256 "2a6c4cde3c47b6a2deecb610be801f3293662981deea6ff9f8bb41e1e0b9e286"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.573.0/aosguard-linux-arm64"
        sha256 "3c0f8dc0d4e7ed953f23a74d76ce37ae05693925b4de744ae4ffc2ed4e4ae404"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.573.0/aterm-linux-arm64"
        sha256 "cf654cfdceb4d5a9a009dcf42d0f19127fd99f2bd2fb379f398b9baf3e2cbea2"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    # macOS installs the signed bundle, whole (:nounzip) because a stage would
    # step into it, and links bin/aterm to its executable. See docs/aos-cli.md.
    if OS.mac?
      resource("aterm").stage do
        system "tar", "-xzf", Dir["*.tar.gz"].first, "-C", prefix
      end
      bin.install_symlink prefix/"Treehouse.app/Contents/MacOS/aterm"
    else
      resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
