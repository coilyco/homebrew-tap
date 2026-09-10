class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.321.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aos-darwin-arm64"
      sha256 "89b9965f23958f435f0d28d2d9a5cf5c20aecbb51beb0e3260e2a203d5f4ef1e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aoscompose-darwin-arm64"
        sha256 "89b9965f23958f435f0d28d2d9a5cf5c20aecbb51beb0e3260e2a203d5f4ef1e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aosward-darwin-arm64"
        sha256 "89b9965f23958f435f0d28d2d9a5cf5c20aecbb51beb0e3260e2a203d5f4ef1e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aosguard-darwin-arm64"
        sha256 "094b8fb1075259508dbae62d84d7e36e7ed6f32c14c59aa77244e10a39b50440"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aterm-darwin-arm64"
        sha256 "aa347b0db2c92428918c2f9fbb315adb9a1cf3e0d9c8ca3b96e869a543091df1"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aos-linux-amd64"
      sha256 "1b14f874bcace87be311f982a194f603c082406be2f438d30f6da5b948ae0622"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aoscompose-linux-amd64"
        sha256 "1b14f874bcace87be311f982a194f603c082406be2f438d30f6da5b948ae0622"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aosward-linux-amd64"
        sha256 "1b14f874bcace87be311f982a194f603c082406be2f438d30f6da5b948ae0622"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aosguard-linux-amd64"
        sha256 "ef4c80c8f8641f33adb4f5e143a7eee3798bf3586efea28cbf4095af0c37fe3d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aterm-linux-amd64"
        sha256 "c2732848afabfa5a423f85d5a1e9fd84a9bc22a891579f15faa451e56a15d77f"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aos-linux-arm64"
      sha256 "4b1b75c6fc6c577c0410fe2446e538835aa6e7ffce81788e4c2e54fdb0defc1d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aoscompose-linux-arm64"
        sha256 "4b1b75c6fc6c577c0410fe2446e538835aa6e7ffce81788e4c2e54fdb0defc1d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aosward-linux-arm64"
        sha256 "4b1b75c6fc6c577c0410fe2446e538835aa6e7ffce81788e4c2e54fdb0defc1d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aosguard-linux-arm64"
        sha256 "5019367539b04111317355e0f50be88951ac70797f872795b5c3f8f7cc7b17ec"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.321.0/aterm-linux-arm64"
        sha256 "10a81ce7c6a00d975e698fcc865e72baf32e4535545b98ba36889b9971060bcc"
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
