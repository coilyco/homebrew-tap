class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.566.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.566.0/aos-darwin-arm64"
    sha256 "2ea718401561c54b357407b55c55c00e006d554a858602c43ca3bccfa800a7c5"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.566.0/aoscompose-darwin-arm64"
      sha256 "2ea718401561c54b357407b55c55c00e006d554a858602c43ca3bccfa800a7c5"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.566.0/aosguard-darwin-arm64"
      sha256 "fc421e7ca0c05b4fd2905ade1da51d60f090c83b2992fcb65ef4fe288e9012ca"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.566.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "da4bc416e6bc591c78e3b2c92670c46f4158e3c049050ef30d6d5aa7ad4e86f0"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.566.0/aos-linux-amd64"
      sha256 "390313190279bf1a1a4f5e2dc81595742938581c4008bbb09995f561761e8303"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.566.0/aoscompose-linux-amd64"
        sha256 "390313190279bf1a1a4f5e2dc81595742938581c4008bbb09995f561761e8303"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.566.0/aosguard-linux-amd64"
        sha256 "af4441d8125527165ad8b031df69c07cf7f61bf9bcd05c7cd79767dc1dd7a5c5"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.566.0/aterm-linux-amd64"
        sha256 "30cf8bd48f5a3d6f9dab92d36833d3714b5aefc7e458817f1d287ad4a5c6b76b"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.566.0/aos-linux-arm64"
      sha256 "54eb63f73caf8ba27988006c3499673cf8de0333fa953bd165fdef23705977ac"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.566.0/aoscompose-linux-arm64"
        sha256 "54eb63f73caf8ba27988006c3499673cf8de0333fa953bd165fdef23705977ac"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.566.0/aosguard-linux-arm64"
        sha256 "b57558bad9141a5ca22751f0a89a5bea3cbe3a8edffd00d274faedd76b60938b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.566.0/aterm-linux-arm64"
        sha256 "71b1be4db090085a22aa88c83a4826f8722d4c3040a6a34a70658be2941e7f25"
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
