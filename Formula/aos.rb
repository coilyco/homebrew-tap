class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.279.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aos-darwin-arm64"
      sha256 "9ad78f6db4d1c8eb1c1e4f433710dfe999d4b1a180b25700f2928d0dd523c8fe"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aoscompose-darwin-arm64"
        sha256 "9ad78f6db4d1c8eb1c1e4f433710dfe999d4b1a180b25700f2928d0dd523c8fe"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aosward-darwin-arm64"
        sha256 "9ad78f6db4d1c8eb1c1e4f433710dfe999d4b1a180b25700f2928d0dd523c8fe"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aosguard-darwin-arm64"
        sha256 "a063c9db5e9c20b2a44cd89be683f86e837a1cfe57077856cc3106ac50aa5a7a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aterm-darwin-arm64"
        sha256 "8460d6976b538530651e841d4815f46b10edb0f75b2197e4ed3489629c254dbc"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aos-linux-amd64"
      sha256 "a471ade1fad85e5dbab0d988267da9e703ae1086e464c996850a28f1412258fe"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aoscompose-linux-amd64"
        sha256 "a471ade1fad85e5dbab0d988267da9e703ae1086e464c996850a28f1412258fe"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aosward-linux-amd64"
        sha256 "a471ade1fad85e5dbab0d988267da9e703ae1086e464c996850a28f1412258fe"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aosguard-linux-amd64"
        sha256 "f6f7f20023f7ab2d8e765299774b2a9a3984160b3f56307b48616728b3df6752"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aterm-linux-amd64"
        sha256 "38acb7f21417c81ba85b85ffcec73643b02ba464296bb78e7bfd2acb45a273cb"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aos-linux-arm64"
      sha256 "506fcb1abc788c55bb2eec9fabdc0dc01149dfe7fb444879f14bc43276bccd3b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aoscompose-linux-arm64"
        sha256 "506fcb1abc788c55bb2eec9fabdc0dc01149dfe7fb444879f14bc43276bccd3b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aosward-linux-arm64"
        sha256 "506fcb1abc788c55bb2eec9fabdc0dc01149dfe7fb444879f14bc43276bccd3b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aosguard-linux-arm64"
        sha256 "6e3ce73918c56a88f42aab42ab7071295d5030ff52b6e53751d5ae38e2c8cdbc"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.279.0/aterm-linux-arm64"
        sha256 "faaff10811551892e4bf68c04bda68087713f052c5f6c478ad0724850e802576"
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
