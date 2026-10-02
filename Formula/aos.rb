class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.412.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aos-darwin-arm64"
      sha256 "4eaaa337afdc393e32d53ef72b104afcd3339ad980ad84276069ed046150580a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aoscompose-darwin-arm64"
        sha256 "4eaaa337afdc393e32d53ef72b104afcd3339ad980ad84276069ed046150580a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aosward-darwin-arm64"
        sha256 "4eaaa337afdc393e32d53ef72b104afcd3339ad980ad84276069ed046150580a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aosguard-darwin-arm64"
        sha256 "2369f5088c2e293a79d9d0c6652b2579d8f03b65a1f49eaf8cc13aefc2fc96f2"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aterm-darwin-arm64"
        sha256 "6e52efe6b80bf0489565b0de3f0e48568703392ab0a5a6445b7161109b6bc759"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aos-linux-amd64"
      sha256 "e7af4c345ff9b23deb8af6bcba1aab2ab95297f45f96cd26a352e48a62bc3c28"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aoscompose-linux-amd64"
        sha256 "e7af4c345ff9b23deb8af6bcba1aab2ab95297f45f96cd26a352e48a62bc3c28"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aosward-linux-amd64"
        sha256 "e7af4c345ff9b23deb8af6bcba1aab2ab95297f45f96cd26a352e48a62bc3c28"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aosguard-linux-amd64"
        sha256 "38f77e1f1f0adf34ed931e0d5b1153f3a0e6666add74cd7b56478d20691869e5"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aterm-linux-amd64"
        sha256 "6bb68b9816db7d5ca9c83375c090c5e57504b8541089f2453c5e3f20375d7d15"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aos-linux-arm64"
      sha256 "314044bb5a12f3716b3c7cf1fa978307249cc092064d19a20ca8b3dc709cc543"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aoscompose-linux-arm64"
        sha256 "314044bb5a12f3716b3c7cf1fa978307249cc092064d19a20ca8b3dc709cc543"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aosward-linux-arm64"
        sha256 "314044bb5a12f3716b3c7cf1fa978307249cc092064d19a20ca8b3dc709cc543"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aosguard-linux-arm64"
        sha256 "3c3b37e8a1e2341f21fe140988287fce56c6fb1c1b72643362418a5b31bbb917"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.412.0/aterm-linux-arm64"
        sha256 "337b4abbef388473c83d3daa6e016e2950ba58aae75015a96808152c0220ed1e"
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
