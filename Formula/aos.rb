class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.534.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.534.0/aos-darwin-arm64"
    sha256 "ddd568ac38aa9e5b7b80e16c49de2ae91a98ffd95c22e623f50406e7fba86237"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.534.0/aoscompose-darwin-arm64"
      sha256 "ddd568ac38aa9e5b7b80e16c49de2ae91a98ffd95c22e623f50406e7fba86237"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.534.0/aosguard-darwin-arm64"
      sha256 "b06f005b20bf3cacef56e9e232f0fd5123e56c7fb64a54862ec79779777a53e9"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.534.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "7ea7537491700f29572ef7317f2f61a2b3df1163e909d401d82f59f3c7f71a8b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.534.0/aos-linux-amd64"
      sha256 "acb6334d1f261cfecc4ce4c20d867a3822188ee632b3d1da5db597947e1de7bb"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.534.0/aoscompose-linux-amd64"
        sha256 "acb6334d1f261cfecc4ce4c20d867a3822188ee632b3d1da5db597947e1de7bb"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.534.0/aosguard-linux-amd64"
        sha256 "1e38a171cdca1b22b08b659b1e5f00a053f66fd56c393fe7df7fa06a73a00353"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.534.0/aterm-linux-amd64"
        sha256 "6c5c3232dfe205ae61ac05e05af9f0a8666a2cf9d5d514276eed464ead5c05d1"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.534.0/aos-linux-arm64"
      sha256 "d333fb6ae6612369789f6fc1302be7d32b9f1c7bef517ad82ec207392510bb0b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.534.0/aoscompose-linux-arm64"
        sha256 "d333fb6ae6612369789f6fc1302be7d32b9f1c7bef517ad82ec207392510bb0b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.534.0/aosguard-linux-arm64"
        sha256 "75159af3aace88c8b61fc04a7c5b8dbd322de12108a96b795ce5b2eaf06ef906"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.534.0/aterm-linux-arm64"
        sha256 "1e35a194b6cc2742abd2865a073336f2b9207d2f1378122b3a2b610f8869d948"
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
