class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.564.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.564.0/aos-darwin-arm64"
    sha256 "0370783f3de9487dfff870eaff898b609ba58faa0dd4189e0aba408bff2d96e7"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.564.0/aoscompose-darwin-arm64"
      sha256 "0370783f3de9487dfff870eaff898b609ba58faa0dd4189e0aba408bff2d96e7"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.564.0/aosguard-darwin-arm64"
      sha256 "6b216e2c9e7b238eb5110c0f9170f58d1fb5ceb7b0398932880db22dd4154c0f"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.564.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "1378d12f024392d3e6fbc6a5ce8b4da03aa9c0c033c0a0eae0ab60968402e24e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.564.0/aos-linux-amd64"
      sha256 "d42387cff0657bd658c4996e0b5f2b8d1714205e2db9983c46a2b01330a32821"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.564.0/aoscompose-linux-amd64"
        sha256 "d42387cff0657bd658c4996e0b5f2b8d1714205e2db9983c46a2b01330a32821"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.564.0/aosguard-linux-amd64"
        sha256 "852616f466c21ef4108d197a08f14c398c179b1256453523850e270f58525686"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.564.0/aterm-linux-amd64"
        sha256 "bb3c8b37a2843f99167858d848d10aaf646556bc2b961be69d85b7419549c0b2"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.564.0/aos-linux-arm64"
      sha256 "662afa1bbbf05760d6c3cecdb3797c71a16ab506f1667117e1e9cfc9ca72a89a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.564.0/aoscompose-linux-arm64"
        sha256 "662afa1bbbf05760d6c3cecdb3797c71a16ab506f1667117e1e9cfc9ca72a89a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.564.0/aosguard-linux-arm64"
        sha256 "45396e0dec87de64361d6eef60655878fe3da633e78b32652d5c98cafde93de3"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.564.0/aterm-linux-arm64"
        sha256 "3a2f03e27ab0fea004819e38273db402443da145374a5d2385c53f0c62055b71"
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
