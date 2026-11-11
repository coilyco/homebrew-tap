class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.597.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.597.0/aos-darwin-arm64"
    sha256 "d7ee402eca0b2f3ef4f6d3fe89033e7719f60f59824316a2f66574ccf784e6d1"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.597.0/aoscompose-darwin-arm64"
      sha256 "d7ee402eca0b2f3ef4f6d3fe89033e7719f60f59824316a2f66574ccf784e6d1"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.597.0/aosguard-darwin-arm64"
      sha256 "4626552c6e72badc325c605f41e9fb0ed28c5672aba93e4222d9c96954bf9253"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.597.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "9354c501ec3dfab70873127cf1bbecc21f3f0f86142c3feb4b6bfd37b2e3b5a3"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.597.0/aos-linux-amd64"
      sha256 "75de73cdd9867a5f27c8a15a156bde4a925b622f225858dde174f73c4527fd04"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.597.0/aoscompose-linux-amd64"
        sha256 "75de73cdd9867a5f27c8a15a156bde4a925b622f225858dde174f73c4527fd04"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.597.0/aosguard-linux-amd64"
        sha256 "e392bce2f27be9d11d827bec197a12c761e0e68da68ea097010440d16c22ba67"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.597.0/aterm-linux-amd64"
        sha256 "b6b447b3a428eda592c01e5254a32b2b9964f2dc5db6b095c705568a9b1f4d4e"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.597.0/aos-linux-arm64"
      sha256 "ebad4bf6c8f2adf597f174881d62f82e2989f3b7ea717a52a9670bc5826a0c10"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.597.0/aoscompose-linux-arm64"
        sha256 "ebad4bf6c8f2adf597f174881d62f82e2989f3b7ea717a52a9670bc5826a0c10"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.597.0/aosguard-linux-arm64"
        sha256 "53b7118e1c542d8b70e594568534c8f52be898723bec9f6c7c43af26f5009416"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.597.0/aterm-linux-arm64"
        sha256 "5a34cbddc6579b2d95dcb49c323e5c4a6ccde32a0d1b5a3efbe6b9537f75853a"
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
