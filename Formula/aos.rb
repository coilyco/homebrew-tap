class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.405.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aos-darwin-arm64"
      sha256 "08b7d7cbbd851d431dbb39c9c0b5ad438dfd882fdd43f3cdd6b324224a8aa72e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aoscompose-darwin-arm64"
        sha256 "08b7d7cbbd851d431dbb39c9c0b5ad438dfd882fdd43f3cdd6b324224a8aa72e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aosward-darwin-arm64"
        sha256 "08b7d7cbbd851d431dbb39c9c0b5ad438dfd882fdd43f3cdd6b324224a8aa72e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aosguard-darwin-arm64"
        sha256 "4dfa816e65b690747a94f1da9bc5a51ca903bcbce1013e69093c806b2f2e3a03"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aterm-darwin-arm64"
        sha256 "c3ac1302239f3be198927626f69688cd635388e3ee0fa3f915bbd9de8c86a9d9"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aos-linux-amd64"
      sha256 "ca3ebcd235721fabe2fc50e9d9e60ab51e38b72b651274f039955d9a411b6f71"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aoscompose-linux-amd64"
        sha256 "ca3ebcd235721fabe2fc50e9d9e60ab51e38b72b651274f039955d9a411b6f71"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aosward-linux-amd64"
        sha256 "ca3ebcd235721fabe2fc50e9d9e60ab51e38b72b651274f039955d9a411b6f71"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aosguard-linux-amd64"
        sha256 "e2a7caeb5438013913c1e018b1b09594e0f3771cb05f2e810a73421baeb564b1"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aterm-linux-amd64"
        sha256 "39dd09990decaf54b28f14180c44c56e5629d76e6ff9b8c526f009a1b37f1331"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aos-linux-arm64"
      sha256 "8b9a030c5a39f45a3783442d6c175c0a790602125214223e6e312e11f453d348"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aoscompose-linux-arm64"
        sha256 "8b9a030c5a39f45a3783442d6c175c0a790602125214223e6e312e11f453d348"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aosward-linux-arm64"
        sha256 "8b9a030c5a39f45a3783442d6c175c0a790602125214223e6e312e11f453d348"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aosguard-linux-arm64"
        sha256 "4e0f323eccc9b61a73a4535053836f0a0ddc4db83fb9430d2aaca696381475b4"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.405.0/aterm-linux-arm64"
        sha256 "951b808e58beb8d1f7d999e2326798365ddf3ff17deb9d8f22753622599caa77"
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
