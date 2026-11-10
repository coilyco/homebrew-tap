class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.575.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.575.0/aos-darwin-arm64"
    sha256 "61ee34cc6e3b51a4c4a0a5386d57761743ff095c334b57e78f48343e2985f2f4"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.575.0/aoscompose-darwin-arm64"
      sha256 "61ee34cc6e3b51a4c4a0a5386d57761743ff095c334b57e78f48343e2985f2f4"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.575.0/aosguard-darwin-arm64"
      sha256 "ee6ca4ce2bc8ecbadfe3aaab94c18c404646d39d60c90dbf01636c7bfa1b515e"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.575.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "020f3514d49727afb02279286ce90ab82708544082302192872f06be9d45c42c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.575.0/aos-linux-amd64"
      sha256 "283e4335536477064d51cf2281c86145d9784de435687ceb0a36f87bf2a6fc63"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.575.0/aoscompose-linux-amd64"
        sha256 "283e4335536477064d51cf2281c86145d9784de435687ceb0a36f87bf2a6fc63"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.575.0/aosguard-linux-amd64"
        sha256 "a88e5d79df05a15a789771f87d70f3f2690d2313fa880ee2e6b3b1424e9d65f5"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.575.0/aterm-linux-amd64"
        sha256 "443ac138bdc4bf0ac91a24d4a18d01f8f60bafcbd890d399016030e23d40c34a"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.575.0/aos-linux-arm64"
      sha256 "5b548778ffb829f340a91b661c3e1ed888ef85cf0b9a7ecb1de4245e49ea9157"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.575.0/aoscompose-linux-arm64"
        sha256 "5b548778ffb829f340a91b661c3e1ed888ef85cf0b9a7ecb1de4245e49ea9157"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.575.0/aosguard-linux-arm64"
        sha256 "47fd1894b89977ffe021ab1372f77c5f2712c3a1e8afc0e56e23f9cdd257ab36"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.575.0/aterm-linux-arm64"
        sha256 "ec672e9982e22e1a1e264c2a87e3c75da5a05ac379360f93eda4945cdd1adadc"
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
