class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.600.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.600.0/aos-darwin-arm64"
    sha256 "e6c1b421a108f462878ee17efa1f96504c221ee2741b8003d126cc73542345dc"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.600.0/aoscompose-darwin-arm64"
      sha256 "e6c1b421a108f462878ee17efa1f96504c221ee2741b8003d126cc73542345dc"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.600.0/aosguard-darwin-arm64"
      sha256 "61d4284b8ba9e17660808b651ff0e8ddf7cfdeadc1aedb36e1ebd6c7127a557a"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.600.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "b4f67421390a1d72fb47ac174a313ce2298072bc62882a89b10b55e4c2990fef"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.600.0/aos-linux-amd64"
      sha256 "48289ce62183acfd24747ad562e5fbca2c191fb3e8a2813fa85eaedfe34a11b5"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.600.0/aoscompose-linux-amd64"
        sha256 "48289ce62183acfd24747ad562e5fbca2c191fb3e8a2813fa85eaedfe34a11b5"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.600.0/aosguard-linux-amd64"
        sha256 "5269796e1871784dce30592c2895c05b17aefa8c75aea1617d7c05d00bf4efac"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.600.0/aterm-linux-amd64"
        sha256 "ae903e685bfc48a25fe957775aa378b7bc261da48c36690117e328d3d06cc7ac"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.600.0/aos-linux-arm64"
      sha256 "c1164ea445c50f50b872e5b1ccbe8ce3bd31fb2c934d6bfa70cc23136553a41d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.600.0/aoscompose-linux-arm64"
        sha256 "c1164ea445c50f50b872e5b1ccbe8ce3bd31fb2c934d6bfa70cc23136553a41d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.600.0/aosguard-linux-arm64"
        sha256 "e1362f1b4c7530aec7c7509ad89663541cf8cf9a778e23f59ea7a10ba12ddccb"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.600.0/aterm-linux-arm64"
        sha256 "4e05d16db016d189408274d5f797eaa16fb5828fd6105d13b13eb4ace7d8fd75"
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
