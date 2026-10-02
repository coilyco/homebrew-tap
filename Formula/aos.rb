class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.417.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aos-darwin-arm64"
      sha256 "28539d0e0ee4b043c1622249e001fc83faacf95dc3757e79f09f2b4e76e1a04c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aoscompose-darwin-arm64"
        sha256 "28539d0e0ee4b043c1622249e001fc83faacf95dc3757e79f09f2b4e76e1a04c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aosward-darwin-arm64"
        sha256 "28539d0e0ee4b043c1622249e001fc83faacf95dc3757e79f09f2b4e76e1a04c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aosguard-darwin-arm64"
        sha256 "877c9ced0ed0b0d536b41e86b088fb11a556eee7596104db8e9fb969b5f17409"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aterm-darwin-arm64"
        sha256 "344a1e14c902d7861b91e3a6d4b4870094adeb9578ea5db8f12dd49397c7be18"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aos-linux-amd64"
      sha256 "c2b0ef545266c8d8593066294c5dc04d73b6159fd5007c2830ef214ce0392419"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aoscompose-linux-amd64"
        sha256 "c2b0ef545266c8d8593066294c5dc04d73b6159fd5007c2830ef214ce0392419"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aosward-linux-amd64"
        sha256 "c2b0ef545266c8d8593066294c5dc04d73b6159fd5007c2830ef214ce0392419"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aosguard-linux-amd64"
        sha256 "1013154a3184793c1ae6fb4315170b6dd9d972fc7b14947b7d7464cc25faedfa"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aterm-linux-amd64"
        sha256 "ca7d98cc11123322fd255eb6c5081062dab65f96633e13a85226d9316239320a"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aos-linux-arm64"
      sha256 "3d2ae45cdd21354fc4fdff1c8dc4a2ef505ba5bf5a721cf12586f76e3d889bba"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aoscompose-linux-arm64"
        sha256 "3d2ae45cdd21354fc4fdff1c8dc4a2ef505ba5bf5a721cf12586f76e3d889bba"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aosward-linux-arm64"
        sha256 "3d2ae45cdd21354fc4fdff1c8dc4a2ef505ba5bf5a721cf12586f76e3d889bba"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aosguard-linux-arm64"
        sha256 "07081da53cdcc5d8143f90829526b69073bf3e431adaa81c06615111b68ad78f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.417.0/aterm-linux-arm64"
        sha256 "47f7ffa9d60dbb5e24926793e6bce074be7f61b62f057831609d907939ed578c"
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
