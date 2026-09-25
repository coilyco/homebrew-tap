class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.393.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aos-darwin-arm64"
      sha256 "e4c44e4efe3eb5db712bb46562aa8477008846048c8ea3cf1504150a8ce86101"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aoscompose-darwin-arm64"
        sha256 "e4c44e4efe3eb5db712bb46562aa8477008846048c8ea3cf1504150a8ce86101"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aosward-darwin-arm64"
        sha256 "e4c44e4efe3eb5db712bb46562aa8477008846048c8ea3cf1504150a8ce86101"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aosguard-darwin-arm64"
        sha256 "aeef3311dbe86fa411233dfd0fabe01a42418b540aeac7b1833299fba97339f5"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aterm-darwin-arm64"
        sha256 "d4dd4fb8d31c38b26b071598672f388ba19c9c6ace62b7e57f76e4d16aa0e377"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aos-linux-amd64"
      sha256 "a8de4b8d4b9a99734b42ff2810385849d5b704bc92cb9fc6c7bdc411ef1ddd34"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aoscompose-linux-amd64"
        sha256 "a8de4b8d4b9a99734b42ff2810385849d5b704bc92cb9fc6c7bdc411ef1ddd34"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aosward-linux-amd64"
        sha256 "a8de4b8d4b9a99734b42ff2810385849d5b704bc92cb9fc6c7bdc411ef1ddd34"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aosguard-linux-amd64"
        sha256 "11cd9d0db3e05976bf8b24e97a9a5b13e88897a63534be190bea342976887d18"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aterm-linux-amd64"
        sha256 "176209a9301c1eaf452f851a6b7ed52c8e2c73741cc9b5ca499599dcf767f059"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aos-linux-arm64"
      sha256 "7a0a7ad9db9434e12f58a50cec1e5c91c29a97dca10b40eaaa760c30c98bad17"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aoscompose-linux-arm64"
        sha256 "7a0a7ad9db9434e12f58a50cec1e5c91c29a97dca10b40eaaa760c30c98bad17"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aosward-linux-arm64"
        sha256 "7a0a7ad9db9434e12f58a50cec1e5c91c29a97dca10b40eaaa760c30c98bad17"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aosguard-linux-arm64"
        sha256 "255e31169f615a23d693467716b121055675e4d452af9c96e84d90ee7991266e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.393.0/aterm-linux-arm64"
        sha256 "3bf9b89b1d588fafad8e439242cb079238b8a65daefa6e59ba17c0a09ce488d5"
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
