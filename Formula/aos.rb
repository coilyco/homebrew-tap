class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.385.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aos-darwin-arm64"
      sha256 "42eeaff79d7c82bfc8b1c5fdb43bebf8d85909569f2810cc98a43c328b732500"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aoscompose-darwin-arm64"
        sha256 "42eeaff79d7c82bfc8b1c5fdb43bebf8d85909569f2810cc98a43c328b732500"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aosward-darwin-arm64"
        sha256 "42eeaff79d7c82bfc8b1c5fdb43bebf8d85909569f2810cc98a43c328b732500"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aosguard-darwin-arm64"
        sha256 "377a7d4edded39550b932fe87d66edf72478273e568b3408af2481564dd0c1b3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aterm-darwin-arm64"
        sha256 "47672875bcd7633b7d08d519b96ba8de591bd6e43272419532a30a1a702cf4f9"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aos-linux-amd64"
      sha256 "18b7ce0a0d2e707cb30119e79ad70c1e1b1902c0c36dd792f40b7bfdf6f75837"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aoscompose-linux-amd64"
        sha256 "18b7ce0a0d2e707cb30119e79ad70c1e1b1902c0c36dd792f40b7bfdf6f75837"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aosward-linux-amd64"
        sha256 "18b7ce0a0d2e707cb30119e79ad70c1e1b1902c0c36dd792f40b7bfdf6f75837"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aosguard-linux-amd64"
        sha256 "aa69c0be95866c05a89ccc5212c1e78c9f7aaf70e68857d2be15c3c598875cb8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aterm-linux-amd64"
        sha256 "c9162dd301bb33bb273ae4e830e1cd00c8fd821398c76076b01276d9c426105c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aos-linux-arm64"
      sha256 "73f511e3d4d288279e3f966ff78de81047aa723e31a7945e25c7803f814e127b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aoscompose-linux-arm64"
        sha256 "73f511e3d4d288279e3f966ff78de81047aa723e31a7945e25c7803f814e127b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aosward-linux-arm64"
        sha256 "73f511e3d4d288279e3f966ff78de81047aa723e31a7945e25c7803f814e127b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aosguard-linux-arm64"
        sha256 "4cd527921b68255d7d9f5d59a8363505016fe6d55cc15d74088d72140f431f56"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.385.0/aterm-linux-arm64"
        sha256 "4269305e8a5d982374f673b9c5a65c83004c4167da26d72352a6cbbfba8f404f"
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
