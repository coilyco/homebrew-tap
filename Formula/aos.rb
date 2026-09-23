class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.353.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aos-darwin-arm64"
      sha256 "802992615d994070e612f71bba9206a4de1989fc32b56c11e22d96794b9e1f10"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aoscompose-darwin-arm64"
        sha256 "802992615d994070e612f71bba9206a4de1989fc32b56c11e22d96794b9e1f10"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aosward-darwin-arm64"
        sha256 "802992615d994070e612f71bba9206a4de1989fc32b56c11e22d96794b9e1f10"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aosguard-darwin-arm64"
        sha256 "ef5bf6d8a8b101bb73caf766e3e39803d96f55addc6b87c1b3d61505e5b772f3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aterm-darwin-arm64"
        sha256 "2e1aca301f0832452570166bfdf406488d30b7cd18b3f38e588ea7b4abff4194"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aos-linux-amd64"
      sha256 "313171a0f7c783e306f98cb2917627a11f3475bc500d78b147c05fe00511d546"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aoscompose-linux-amd64"
        sha256 "313171a0f7c783e306f98cb2917627a11f3475bc500d78b147c05fe00511d546"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aosward-linux-amd64"
        sha256 "313171a0f7c783e306f98cb2917627a11f3475bc500d78b147c05fe00511d546"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aosguard-linux-amd64"
        sha256 "84b671bb2811e16c3286a3a89f0f8b48e8ce6a851ec1f4f487be2b595ac04f37"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aterm-linux-amd64"
        sha256 "f1e9a31300813a7472f82381c249a392b3f612a52ad89ba109f25d7f6afbd2f8"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aos-linux-arm64"
      sha256 "9e4f7a88f9ce976d47ba450e4ab85bdcfd906431e2082478f56920e653462ec1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aoscompose-linux-arm64"
        sha256 "9e4f7a88f9ce976d47ba450e4ab85bdcfd906431e2082478f56920e653462ec1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aosward-linux-arm64"
        sha256 "9e4f7a88f9ce976d47ba450e4ab85bdcfd906431e2082478f56920e653462ec1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aosguard-linux-arm64"
        sha256 "3eb2891157b8ad6427d59e4ee8fae3faa446fe85216cb7e78852c702610029a7"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.353.0/aterm-linux-arm64"
        sha256 "c58928764e06dd98c65b756129c6d856ea52e9732f80bf556fd2b5440f8c3f7a"
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
