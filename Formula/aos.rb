class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.499.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.499.0/aos-darwin-arm64"
    sha256 "5f84f6e861f887018a353ce9d6215132188751dcc3e84b618f3d1327bd4e3fbe"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.499.0/aoscompose-darwin-arm64"
      sha256 "5f84f6e861f887018a353ce9d6215132188751dcc3e84b618f3d1327bd4e3fbe"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.499.0/aosguard-darwin-arm64"
      sha256 "0671bc4de5996a445d250d173d6a08350bdeefaf95a596abcada29d20e2f1169"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.499.0/aterm-darwin-arm64"
      sha256 "7713d33f1f50ef2e0975f09cd57f490efb9ca4d1ae2b596f5d8dbf01e63fcfbe"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.499.0/aos-linux-amd64"
      sha256 "a55c1e7360216bc70258b16fe6abd026ffeaaf20544a33e35f8762a5f3b19a9e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.499.0/aoscompose-linux-amd64"
        sha256 "a55c1e7360216bc70258b16fe6abd026ffeaaf20544a33e35f8762a5f3b19a9e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.499.0/aosguard-linux-amd64"
        sha256 "ad5d9a70ddaf5e44a34e3910aa1927cb8849e1551d2b5934d7408e4c420888ff"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.499.0/aterm-linux-amd64"
        sha256 "1a6974af83ea402036916a4ef38c03038067a951e9d69679a929f1a6f502dbed"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.499.0/aos-linux-arm64"
      sha256 "808499b8c78485dbf31156c79154db9a781c3b9ba7e15144b720f69d109824be"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.499.0/aoscompose-linux-arm64"
        sha256 "808499b8c78485dbf31156c79154db9a781c3b9ba7e15144b720f69d109824be"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.499.0/aosguard-linux-arm64"
        sha256 "1956a8da58395e93496de44bca1d9b1ebd87987bdfc493527b7f9698c3694eae"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.499.0/aterm-linux-arm64"
        sha256 "c18d941dc2c64abe1cf09c11dce61f504bc64eb785874b8a481591af674d9e09"
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
