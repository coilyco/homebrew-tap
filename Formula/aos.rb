class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.601.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.601.0/aos-darwin-arm64"
    sha256 "86a9a037e0827e766d3f95a12b3defae40de580f9b499229bde372fb1cce1907"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.601.0/aoscompose-darwin-arm64"
      sha256 "86a9a037e0827e766d3f95a12b3defae40de580f9b499229bde372fb1cce1907"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.601.0/aosguard-darwin-arm64"
      sha256 "62c664dcab9e8c9715a7eb4bdc21dec86419c43cd6521b5bf5c891f09d0219b2"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.601.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "911e74a811a4257ff389030dadca05017e82c4afb794a861ba3234f27c3bb454"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.601.0/aos-linux-amd64"
      sha256 "ab290ab5ed7394e85c27f42e7a443054a8c52727b03b2eedfe93cb8f02346b08"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.601.0/aoscompose-linux-amd64"
        sha256 "ab290ab5ed7394e85c27f42e7a443054a8c52727b03b2eedfe93cb8f02346b08"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.601.0/aosguard-linux-amd64"
        sha256 "384f36a29d338d2fc737b9cf718abb4d40837beef79b408230b719353d016a1a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.601.0/aterm-linux-amd64"
        sha256 "991644e61ff8f4edaeb4d3e1ad4cb0c1cc4700b3238f261b6e294199f5adfd7c"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.601.0/aos-linux-arm64"
      sha256 "54b7eabcf500dfd567399f49deeb6637c21c2af1b14489a0ed4bf0e4930cc389"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.601.0/aoscompose-linux-arm64"
        sha256 "54b7eabcf500dfd567399f49deeb6637c21c2af1b14489a0ed4bf0e4930cc389"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.601.0/aosguard-linux-arm64"
        sha256 "ae6321a71faa23ffde1aa77cf62cc5af15ed06be724fbb82d2efafa348733fb4"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.601.0/aterm-linux-arm64"
        sha256 "3f18050d37bebcc386a1e82ac2736d0059d3b3dd7896446163533a26301ebdba"
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
