class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.603.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.603.0/aos-darwin-arm64"
    sha256 "693b0cbd5d103d99aaafd7c09f213a5a64f2389fed1192e3f1b19892968e5f68"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.603.0/aoscompose-darwin-arm64"
      sha256 "693b0cbd5d103d99aaafd7c09f213a5a64f2389fed1192e3f1b19892968e5f68"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.603.0/aosguard-darwin-arm64"
      sha256 "6b9d9410ea88ce8b67ef6019f911bff10ae26ac74ad11c1a68563f96c5cb83bd"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.603.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "7333a49fabcd9f190729e58e5ecbf8e180c08d25aaeff6918ae67edd9099545a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.603.0/aos-linux-amd64"
      sha256 "8545e9a1ed1c3bbdd39afa8f813fbba7ec4ebc0611066f8432a70723407b2c39"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.603.0/aoscompose-linux-amd64"
        sha256 "8545e9a1ed1c3bbdd39afa8f813fbba7ec4ebc0611066f8432a70723407b2c39"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.603.0/aosguard-linux-amd64"
        sha256 "04d8a94f6691ebf721f8fcd63b54c1ae90f6cc15347792c7a94cfc84710d12d0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.603.0/aterm-linux-amd64"
        sha256 "56843782f7917ce2aa1065a8b1f9edb4d857cfe9affaa215d6c7efea99a2883d"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.603.0/aos-linux-arm64"
      sha256 "125159a33b013af18370b82d9b190750b835c87682d29340505ed5f1487b4c2f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.603.0/aoscompose-linux-arm64"
        sha256 "125159a33b013af18370b82d9b190750b835c87682d29340505ed5f1487b4c2f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.603.0/aosguard-linux-arm64"
        sha256 "ba89681e1edbc39d9d70158ec025298e805cb669973f6ef7ff778b60230f22c0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.603.0/aterm-linux-arm64"
        sha256 "6d9b03ddea57898c53aa48dfd8f78c46e44ae3863926a8a23407e2f6c66e391d"
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
