class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.382.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aos-darwin-arm64"
      sha256 "7988f22efa34636b00a31d653e6ec3efbe96071926b20497256c2ea7c7bc0da0"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aoscompose-darwin-arm64"
        sha256 "7988f22efa34636b00a31d653e6ec3efbe96071926b20497256c2ea7c7bc0da0"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aosward-darwin-arm64"
        sha256 "7988f22efa34636b00a31d653e6ec3efbe96071926b20497256c2ea7c7bc0da0"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aosguard-darwin-arm64"
        sha256 "9e1b6afb90a9e3b4d810c71be8bbc573f1001ef6b7f96599567c35cc0f687df1"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aterm-darwin-arm64"
        sha256 "fbd8753e605a3e2744e4effe10a8b31f329452b46167017c63135b27550e8b1f"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aos-linux-amd64"
      sha256 "ee697880cb34e8d4f286bacac5ed9fce1134f0689e911d7f8e4358ecd8c4a8a6"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aoscompose-linux-amd64"
        sha256 "ee697880cb34e8d4f286bacac5ed9fce1134f0689e911d7f8e4358ecd8c4a8a6"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aosward-linux-amd64"
        sha256 "ee697880cb34e8d4f286bacac5ed9fce1134f0689e911d7f8e4358ecd8c4a8a6"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aosguard-linux-amd64"
        sha256 "018025bda64a6cbf789391ecd283322c70e3affd944bba3902139bbe20b04577"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aterm-linux-amd64"
        sha256 "6cf13d9bfe904ca9c90947b5f356655e862ec5dd396b9c0efaa93ed1c508d9c5"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aos-linux-arm64"
      sha256 "1e07297b3edafa1cd887ef0d837f3d3a139635113b4a066802856ebf7e6233dc"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aoscompose-linux-arm64"
        sha256 "1e07297b3edafa1cd887ef0d837f3d3a139635113b4a066802856ebf7e6233dc"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aosward-linux-arm64"
        sha256 "1e07297b3edafa1cd887ef0d837f3d3a139635113b4a066802856ebf7e6233dc"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aosguard-linux-arm64"
        sha256 "905d0a330ea4883e07480e26ab0c697ad76b9ac69abad789fe2ba3eb62e8c53a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.382.0/aterm-linux-arm64"
        sha256 "0cafcad0432736ff390ed054e2c4ef9ca4f70b0e8baf8fe05a5f131dfe2317d0"
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
