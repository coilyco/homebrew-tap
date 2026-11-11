class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.611.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.611.0/aos-darwin-arm64"
    sha256 "4155f4b49a2a9445c0c12a8a540a8b573fa3a329993d8350e7c11e07f2b1527d"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.611.0/aoscompose-darwin-arm64"
      sha256 "4155f4b49a2a9445c0c12a8a540a8b573fa3a329993d8350e7c11e07f2b1527d"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.611.0/aosguard-darwin-arm64"
      sha256 "63f254f41352a5ad5995e9b538157635620f77f38a608278472843a6c60b6eed"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.611.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "f4640a9c6be6b5624826b1bd87e1dc70f563dcd72aab52bfb7ca3e5b40b996ce"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.611.0/aos-linux-amd64"
      sha256 "ad3b228d558b73f2d812e8cc10da0d5374803061a9b642813f31d05af5eade69"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.611.0/aoscompose-linux-amd64"
        sha256 "ad3b228d558b73f2d812e8cc10da0d5374803061a9b642813f31d05af5eade69"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.611.0/aosguard-linux-amd64"
        sha256 "d370299a9669b3c967a6c329738752a5a6ebf2802d5b14f013eb8a8bfbc2702b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.611.0/aterm-linux-amd64"
        sha256 "e589cb7a86d55dfefa4d5c21d3e31f3148ebf4c8683c6f92a38cdc79556ad6a6"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.611.0/aos-linux-arm64"
      sha256 "71368bc7384b6483b7ab4042d7eb9d02c29706ddbdd6dd5372d60210b383666d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.611.0/aoscompose-linux-arm64"
        sha256 "71368bc7384b6483b7ab4042d7eb9d02c29706ddbdd6dd5372d60210b383666d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.611.0/aosguard-linux-arm64"
        sha256 "c9444309f0f0de5abd76b89ea4dffdc3f99b9bde6f0cf7dedea5275be51a2bf3"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.611.0/aterm-linux-arm64"
        sha256 "f6d3e3fe82cb1e6137073038a77415aafcba20b7b134919cab14b9c463b6ba77"
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
