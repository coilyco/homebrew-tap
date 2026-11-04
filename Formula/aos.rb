class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.503.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.503.0/aos-darwin-arm64"
    sha256 "edb47559fb9a7443df05988ec36a94cf619a269d53430d158cb29d9ffe26f28e"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.503.0/aoscompose-darwin-arm64"
      sha256 "edb47559fb9a7443df05988ec36a94cf619a269d53430d158cb29d9ffe26f28e"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.503.0/aosguard-darwin-arm64"
      sha256 "ccdf59f083cd2cd7914422be8220215af8d2e0545b37b59c746cef312bd8b16b"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.503.0/aterm-darwin-arm64"
      sha256 "ecd8fd1dfd6baa96287d11cb3a661f500c0b0ae75a01c42f1ad58de2edc86ee6"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.503.0/aos-linux-amd64"
      sha256 "cc30d8831d0dbb4d10da25a6c1e76cf1c18ba6b6622a0716ac9e4cb0c6b8603a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.503.0/aoscompose-linux-amd64"
        sha256 "cc30d8831d0dbb4d10da25a6c1e76cf1c18ba6b6622a0716ac9e4cb0c6b8603a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.503.0/aosguard-linux-amd64"
        sha256 "ae5497db2913b84fed38b5a125b4ddac1fac636551fd361f81200e8485826841"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.503.0/aterm-linux-amd64"
        sha256 "550a7b15ad7dfaeb736cd2a27146c78c35e78ef6eaed208fa6a4ca11850c00e7"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.503.0/aos-linux-arm64"
      sha256 "2d0e9535a568a4a7d7af19d1bb2579013bf284c10e3338f863fca880676f6d50"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.503.0/aoscompose-linux-arm64"
        sha256 "2d0e9535a568a4a7d7af19d1bb2579013bf284c10e3338f863fca880676f6d50"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.503.0/aosguard-linux-arm64"
        sha256 "0c31619c317d967413df20211bcaf4a73786f7fafd1b1c1d95a8c1df25e67bcd"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.503.0/aterm-linux-arm64"
        sha256 "ba5829e3302607337b84b50ea4569b5a0fe7cf377908976c86c7a96dcf10be12"
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
