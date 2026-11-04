class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.502.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.502.0/aos-darwin-arm64"
    sha256 "8e8aa62285df1f738c6ea2bf6dd9bc91df57ff7a2a2f984621d711b75ec37391"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.502.0/aoscompose-darwin-arm64"
      sha256 "8e8aa62285df1f738c6ea2bf6dd9bc91df57ff7a2a2f984621d711b75ec37391"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.502.0/aosguard-darwin-arm64"
      sha256 "5dbc1adeca76086f9a0d565ecd5b0382fffc1b916d03e2aa8d76f64e18ebae5e"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.502.0/aterm-darwin-arm64"
      sha256 "eaf1ff7a552dfd9c4375da36c5856cbc68373dec2a61c5ef7f8f534a1d3b610a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.502.0/aos-linux-amd64"
      sha256 "0d8509f9c4209a52c8c8df5409ed9c0cb7b910fa2cabcc4d675e4ebdde15592b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.502.0/aoscompose-linux-amd64"
        sha256 "0d8509f9c4209a52c8c8df5409ed9c0cb7b910fa2cabcc4d675e4ebdde15592b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.502.0/aosguard-linux-amd64"
        sha256 "2bcf07afbbe8164e3421d637708bb7d801d755742717ec679752174a92140c03"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.502.0/aterm-linux-amd64"
        sha256 "f3aeedcd006986f010fca2d517e63a12ddb61a53554c32a5715df538b7c9b961"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.502.0/aos-linux-arm64"
      sha256 "32853fbbd2f44e2aa7f0ee4ad3ca6eac04e9c69b96ebe571ac36402ec3e96099"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.502.0/aoscompose-linux-arm64"
        sha256 "32853fbbd2f44e2aa7f0ee4ad3ca6eac04e9c69b96ebe571ac36402ec3e96099"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.502.0/aosguard-linux-arm64"
        sha256 "cff894d841c052a812a08c151f7e2563906cf7a54c318365cb17bab3830cf980"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.502.0/aterm-linux-arm64"
        sha256 "8225058623a15da6957da0e79496f4671d7e35291c46223cc7f7b9f3be9af446"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
