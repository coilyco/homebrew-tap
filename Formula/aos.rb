class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.531.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.531.0/aos-darwin-arm64"
    sha256 "b6e0fee5b95e222efecd22c6d9d331eaf88bfa3ae549bd6891af35e53e5784a4"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.531.0/aoscompose-darwin-arm64"
      sha256 "b6e0fee5b95e222efecd22c6d9d331eaf88bfa3ae549bd6891af35e53e5784a4"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.531.0/aosguard-darwin-arm64"
      sha256 "99bf2e2e6a3d9137e64fa7b245c86ab18f8c627df6e68d606d2b392c4dab4690"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.531.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "438313ccb10c5227f9bbe64999ceeddc6b65990b3b1d26a675069e9721e88a84"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.531.0/aos-linux-amd64"
      sha256 "a1ef25d983502617a3ceeba4c8a01059a1c1fa08cc24339a7dc09e7cdac4ed04"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.531.0/aoscompose-linux-amd64"
        sha256 "a1ef25d983502617a3ceeba4c8a01059a1c1fa08cc24339a7dc09e7cdac4ed04"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.531.0/aosguard-linux-amd64"
        sha256 "6e00a2a3f98ba339383c4f1714f6bd690362898e569ba63cedd5732c40aa21d2"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.531.0/aterm-linux-amd64"
        sha256 "c8c5348d40c8e160edfda77eb48d66e895b6f3f04f523218d17bbe39a6029bca"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.531.0/aos-linux-arm64"
      sha256 "e3b95e9c00f2583e27085d1a2ed39f3bbdae0331a3fd65afa9607b57c8bec99a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.531.0/aoscompose-linux-arm64"
        sha256 "e3b95e9c00f2583e27085d1a2ed39f3bbdae0331a3fd65afa9607b57c8bec99a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.531.0/aosguard-linux-arm64"
        sha256 "5a70c0a3a842b7064bf85daace4193176123a4403c472c8b78a900cbf82ca880"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.531.0/aterm-linux-arm64"
        sha256 "1ff30b9a37a2118e3d345f73827de31ba2ff3a0aaa04dc7bef9a9dea8ef1414b"
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
