class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.533.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.533.0/aos-darwin-arm64"
    sha256 "6a7ae00c289db31cd932dc039e5ed9ab90f269abc2bb2b8c2e1c589cf7592a69"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.533.0/aoscompose-darwin-arm64"
      sha256 "6a7ae00c289db31cd932dc039e5ed9ab90f269abc2bb2b8c2e1c589cf7592a69"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.533.0/aosguard-darwin-arm64"
      sha256 "16897d92458205a3bbddc283e33e18b3b5286f4fcd6e2020285b948c6e72151a"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.533.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "665e5ac4c3e2aabb94fb796447934e4f119718ebc3a035f5394725a946bc0f57"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.533.0/aos-linux-amd64"
      sha256 "02e5b013e1ecfa48da3e87b870e0296cc66f380af22328c76cd62cd339a5d183"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.533.0/aoscompose-linux-amd64"
        sha256 "02e5b013e1ecfa48da3e87b870e0296cc66f380af22328c76cd62cd339a5d183"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.533.0/aosguard-linux-amd64"
        sha256 "1f2e3cc7466becee01b299d3a59b32898f045de4c8cf0484c70e597a6a955c28"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.533.0/aterm-linux-amd64"
        sha256 "aa66e8d91e1a5b44a6f57c43621ad2f113c1811b0e1c334e66ceb71a9e6e1f91"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.533.0/aos-linux-arm64"
      sha256 "c139b322ba9a52d0fda562441579248a9ff921560da3094a1229ea64dafe2b1f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.533.0/aoscompose-linux-arm64"
        sha256 "c139b322ba9a52d0fda562441579248a9ff921560da3094a1229ea64dafe2b1f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.533.0/aosguard-linux-arm64"
        sha256 "813f146ba20c7558068ca1dffda4f3ce27eedfe68ca8e565062d88d0f2c5674d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.533.0/aterm-linux-arm64"
        sha256 "1a737ba7706c10a88083fd6015f1c439233041d960f0a5543f4f2ee9158b60da"
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
