class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.366.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aos-darwin-arm64"
      sha256 "9cddd65f1a66ccc566a1c947f9e2b8ef81b6bb7f22e728b1e8ef7cf3edbd6469"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aoscompose-darwin-arm64"
        sha256 "9cddd65f1a66ccc566a1c947f9e2b8ef81b6bb7f22e728b1e8ef7cf3edbd6469"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aosward-darwin-arm64"
        sha256 "9cddd65f1a66ccc566a1c947f9e2b8ef81b6bb7f22e728b1e8ef7cf3edbd6469"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aosguard-darwin-arm64"
        sha256 "4bf0eade12407aa110ab80a789e05d342774da691c4a946982ca890063fc0973"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aterm-darwin-arm64"
        sha256 "4453212ed90bc320197aa5d6a7f9fc80248a818266eafc9fad9ea377cd65d156"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aos-linux-amd64"
      sha256 "a2132b12f9ab6ffaf502219cc6298d272273bb236761b1c98a738d2c6dcd8e16"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aoscompose-linux-amd64"
        sha256 "a2132b12f9ab6ffaf502219cc6298d272273bb236761b1c98a738d2c6dcd8e16"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aosward-linux-amd64"
        sha256 "a2132b12f9ab6ffaf502219cc6298d272273bb236761b1c98a738d2c6dcd8e16"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aosguard-linux-amd64"
        sha256 "26c32a8adf0d262483636f14d71048227039961cf27f58e9b217d705ff0a724f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aterm-linux-amd64"
        sha256 "67c6144f676665f2d11dbc0daacd904608276c68c34911628afd7139a3362a85"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aos-linux-arm64"
      sha256 "c9815f365976677704fb21336986ba08daa05441a1fd69d1dbc3d155861274fe"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aoscompose-linux-arm64"
        sha256 "c9815f365976677704fb21336986ba08daa05441a1fd69d1dbc3d155861274fe"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aosward-linux-arm64"
        sha256 "c9815f365976677704fb21336986ba08daa05441a1fd69d1dbc3d155861274fe"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aosguard-linux-arm64"
        sha256 "d3ba3e3a52924e51036ca8629b7adfb652ada6cf03114a20a64767c87aa4b84b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.366.0/aterm-linux-arm64"
        sha256 "37d894179e1e65a98e0aba244664ad0e6c4eec02ec2de7241ffea6829e08e364"
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
