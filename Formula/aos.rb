class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.545.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.545.0/aos-darwin-arm64"
    sha256 "e1be57762ef441d71efa4a6f37ba995907a32c3406c1674833df3b4b0fa5cd0c"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.545.0/aoscompose-darwin-arm64"
      sha256 "e1be57762ef441d71efa4a6f37ba995907a32c3406c1674833df3b4b0fa5cd0c"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.545.0/aosguard-darwin-arm64"
      sha256 "773edec3b9f6f4aabcdc33a63886ee29b846f5bb8340a342368b4a7a78278fa4"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.545.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "28ef12701a186638d20a9096adc6d7d0564d76deb2a1618db5059d57102f8442"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.545.0/aos-linux-amd64"
      sha256 "9236fe569892689c1c16e7a47e82653d76fee5895acbdd6905f52ad2bb4bf000"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.545.0/aoscompose-linux-amd64"
        sha256 "9236fe569892689c1c16e7a47e82653d76fee5895acbdd6905f52ad2bb4bf000"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.545.0/aosguard-linux-amd64"
        sha256 "96ed98a5445ba4ebd73da9a6596cc1f030618d6e983d6444f86ba4d4e01922be"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.545.0/aterm-linux-amd64"
        sha256 "8857ea7344e4de8cfa9ab3a0b3ab498bd1bef9446894c2bd55c16a24776f68dd"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.545.0/aos-linux-arm64"
      sha256 "c15f901b9270cd3c907a821c420679284b646ef94611225a823c6e9170cee287"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.545.0/aoscompose-linux-arm64"
        sha256 "c15f901b9270cd3c907a821c420679284b646ef94611225a823c6e9170cee287"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.545.0/aosguard-linux-arm64"
        sha256 "fc114977ff4236404ae4f17660bbd3ca0c720cf81befa1a209788bf4703f84b8"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.545.0/aterm-linux-arm64"
        sha256 "6fb23daa3332e72f9c758638d94154b13af50556b838289c624f1ea246af53f1"
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
