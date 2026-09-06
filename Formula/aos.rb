class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.307.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aos-darwin-arm64"
      sha256 "5de4c29bb9156dbaa5ffc90fd81209aab1386f5bef520d0eb2be03b614af60af"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aoscompose-darwin-arm64"
        sha256 "5de4c29bb9156dbaa5ffc90fd81209aab1386f5bef520d0eb2be03b614af60af"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aosward-darwin-arm64"
        sha256 "5de4c29bb9156dbaa5ffc90fd81209aab1386f5bef520d0eb2be03b614af60af"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aosguard-darwin-arm64"
        sha256 "f170aa1d33350bc5e94d7b1467f988d6e08db59605933c4e88cac964772d4f88"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aterm-darwin-arm64"
        sha256 "4e03b7a65450c7ccf3e9c5d2781aba1ff3ba3825834f25f33a946c468c045a67"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aos-linux-amd64"
      sha256 "9d0d590d8e1b37300cda29ba9dffd4bc1ff5cfed5033892ac4a51dd00bb64d61"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aoscompose-linux-amd64"
        sha256 "9d0d590d8e1b37300cda29ba9dffd4bc1ff5cfed5033892ac4a51dd00bb64d61"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aosward-linux-amd64"
        sha256 "9d0d590d8e1b37300cda29ba9dffd4bc1ff5cfed5033892ac4a51dd00bb64d61"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aosguard-linux-amd64"
        sha256 "6e832483e81783e1b40a38428f5ca7bf7e165f72e3aab4131c771c39b0ed592d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aterm-linux-amd64"
        sha256 "77b65a0ee34cdccbd0956b5062df4fdf308288816b10be70a652ac13951d583b"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aos-linux-arm64"
      sha256 "8629c7f7f448bb70cf8441ae358941ee25f052d867a1cfc5cae08e564ae1e183"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aoscompose-linux-arm64"
        sha256 "8629c7f7f448bb70cf8441ae358941ee25f052d867a1cfc5cae08e564ae1e183"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aosward-linux-arm64"
        sha256 "8629c7f7f448bb70cf8441ae358941ee25f052d867a1cfc5cae08e564ae1e183"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aosguard-linux-arm64"
        sha256 "2b4cac53be57d51b35e639a5df6f73a2d57be716c09d4761c2019408562c7975"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.307.0/aterm-linux-arm64"
        sha256 "2477357d23bf80130923af4a461823472ffee454a73d84dc6fba9fa1c8a0ec7d"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
