class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.364.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aos-darwin-arm64"
      sha256 "db05b2b8b1448e5d12e9cb1a99966fb409b3a8ceb13f78ae5eb039ffefa93418"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aoscompose-darwin-arm64"
        sha256 "db05b2b8b1448e5d12e9cb1a99966fb409b3a8ceb13f78ae5eb039ffefa93418"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aosward-darwin-arm64"
        sha256 "db05b2b8b1448e5d12e9cb1a99966fb409b3a8ceb13f78ae5eb039ffefa93418"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aosguard-darwin-arm64"
        sha256 "4b904fd81dd87b489967b2162569a9b8ea2b8ae0d220b32de2ed7141934a6e79"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aterm-darwin-arm64"
        sha256 "83a4ec95a9abf212878eb65db6b57ae4a9ad33de2681701be27af42bf97d30ed"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aos-linux-amd64"
      sha256 "23d5d10574ce095a39f7b8101da0b1618ac9205040ad924ba9f8bcf8530007a3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aoscompose-linux-amd64"
        sha256 "23d5d10574ce095a39f7b8101da0b1618ac9205040ad924ba9f8bcf8530007a3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aosward-linux-amd64"
        sha256 "23d5d10574ce095a39f7b8101da0b1618ac9205040ad924ba9f8bcf8530007a3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aosguard-linux-amd64"
        sha256 "8e9ecb98a72561de704e7b65276d9673a294c72117d90738154c0a11b2899359"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aterm-linux-amd64"
        sha256 "74677fe8e804d62eabbfe61a82f1e3243530c4c0fa44e26bf9717761e6a9feb2"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aos-linux-arm64"
      sha256 "86b594a52e77d1f433bcedd0dd02aaffac2a2de25315d05ecc528ddb673bca79"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aoscompose-linux-arm64"
        sha256 "86b594a52e77d1f433bcedd0dd02aaffac2a2de25315d05ecc528ddb673bca79"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aosward-linux-arm64"
        sha256 "86b594a52e77d1f433bcedd0dd02aaffac2a2de25315d05ecc528ddb673bca79"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aosguard-linux-arm64"
        sha256 "d44dd10416f37274696661b906fb60b891e42335e2b475d951234b77e0c5955f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.364.0/aterm-linux-arm64"
        sha256 "afb04cc8068c950d78728aae5c72f0ba4553beace143165160df873da16325c0"
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
