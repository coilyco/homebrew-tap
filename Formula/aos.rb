class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.413.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aos-darwin-arm64"
      sha256 "2fe6e8fe627e7ab80de57804715a2b2e3df1fccae237c82a5aad95cea27f74c4"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aoscompose-darwin-arm64"
        sha256 "2fe6e8fe627e7ab80de57804715a2b2e3df1fccae237c82a5aad95cea27f74c4"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aosward-darwin-arm64"
        sha256 "2fe6e8fe627e7ab80de57804715a2b2e3df1fccae237c82a5aad95cea27f74c4"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aosguard-darwin-arm64"
        sha256 "a85455c34cbcf97bd4805a6c2f80710dbc19603b9a693c78be3cc51717465abb"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aterm-darwin-arm64"
        sha256 "12a0a0082019ae57fdbd7a79a244d62b5ec0a1e5f9e66a162e1404734469cb92"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aos-linux-amd64"
      sha256 "198bcd537037519df5c370c3fcc6f4f5fab7611db55427550264464ecd884ca9"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aoscompose-linux-amd64"
        sha256 "198bcd537037519df5c370c3fcc6f4f5fab7611db55427550264464ecd884ca9"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aosward-linux-amd64"
        sha256 "198bcd537037519df5c370c3fcc6f4f5fab7611db55427550264464ecd884ca9"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aosguard-linux-amd64"
        sha256 "fbddbe59ebfddd0fef7ac9a2b69edf1fd4f80f00fc39e9700dbedb9db3e8bf40"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aterm-linux-amd64"
        sha256 "d9d003eef847aeec25ba966a6cb4146d0a7a43671eb9bb551e83a81e2e3a80b9"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aos-linux-arm64"
      sha256 "278561f64f5e2d4830f82c9e7108f530789a10a236c727e7f93598d54dc41aa9"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aoscompose-linux-arm64"
        sha256 "278561f64f5e2d4830f82c9e7108f530789a10a236c727e7f93598d54dc41aa9"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aosward-linux-arm64"
        sha256 "278561f64f5e2d4830f82c9e7108f530789a10a236c727e7f93598d54dc41aa9"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aosguard-linux-arm64"
        sha256 "12ee458a26b577f6a1a33f8a0f07beefea1a99693cad2657542beda25819aac2"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.413.0/aterm-linux-arm64"
        sha256 "30b7a81add25997064c3a386123d5ddd028ab78bce2915c10772b8387be70298"
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
