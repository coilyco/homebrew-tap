class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.399.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aos-darwin-arm64"
      sha256 "3e38eb1580aa118557f438de1c6a8dcf4a9d70e73e7cae02aeb1dffb2888b6fe"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aoscompose-darwin-arm64"
        sha256 "3e38eb1580aa118557f438de1c6a8dcf4a9d70e73e7cae02aeb1dffb2888b6fe"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aosward-darwin-arm64"
        sha256 "3e38eb1580aa118557f438de1c6a8dcf4a9d70e73e7cae02aeb1dffb2888b6fe"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aosguard-darwin-arm64"
        sha256 "0084d1e7f27957a81ae5eb2064b51dbf97a00ad81408acbc4a01f1cecb1674c3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aterm-darwin-arm64"
        sha256 "079e789f1ea1ed4d13119f66e93d7945b6d1f988bc674492e716e128157e13af"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aos-linux-amd64"
      sha256 "dad5c2ec2801b8313791b10759019be2fa7ba832589cd517d00fda488ad60d3c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aoscompose-linux-amd64"
        sha256 "dad5c2ec2801b8313791b10759019be2fa7ba832589cd517d00fda488ad60d3c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aosward-linux-amd64"
        sha256 "dad5c2ec2801b8313791b10759019be2fa7ba832589cd517d00fda488ad60d3c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aosguard-linux-amd64"
        sha256 "32d655df0439a6ceeab042d2a9355bdaf636d7744c512f7b65085b07f0f91047"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aterm-linux-amd64"
        sha256 "810231913537ad52933cadd165f4324deb45d6760dba4e4f26bcc3ed4299ef86"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aos-linux-arm64"
      sha256 "17f3ea8b539c7023c1f8668631aae3be4eb8167d69da96a7603edd90df24d886"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aoscompose-linux-arm64"
        sha256 "17f3ea8b539c7023c1f8668631aae3be4eb8167d69da96a7603edd90df24d886"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aosward-linux-arm64"
        sha256 "17f3ea8b539c7023c1f8668631aae3be4eb8167d69da96a7603edd90df24d886"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aosguard-linux-arm64"
        sha256 "88eb2c4fc6693a1402b2d7564abea37fd5464d9bccbe627a759b5be985368cc2"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.399.0/aterm-linux-arm64"
        sha256 "f7bf73767d6f14d5fe67bc4406517f88ca700f8a8d6f2a4086bd7ddfd3e59225"
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
