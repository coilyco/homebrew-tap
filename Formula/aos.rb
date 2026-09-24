class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.356.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aos-darwin-arm64"
      sha256 "29dba9cf1eb45155f005f7eae131c2ca65add227d9d0f330f76bf189ccea8baf"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aoscompose-darwin-arm64"
        sha256 "29dba9cf1eb45155f005f7eae131c2ca65add227d9d0f330f76bf189ccea8baf"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aosward-darwin-arm64"
        sha256 "29dba9cf1eb45155f005f7eae131c2ca65add227d9d0f330f76bf189ccea8baf"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aosguard-darwin-arm64"
        sha256 "ce492f0b660f57a50700ea36156568347b81c8bef3b1aac8db1f4788bad18924"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aterm-darwin-arm64"
        sha256 "82d71ffe7035f6a92e2e451ae968124e480ec6292b4b1b1c5af4158421eb17c0"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aos-linux-amd64"
      sha256 "bb7332cd220cc03cddb713480058f94bdb2cb154ea9b8e08438442e138b58c5a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aoscompose-linux-amd64"
        sha256 "bb7332cd220cc03cddb713480058f94bdb2cb154ea9b8e08438442e138b58c5a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aosward-linux-amd64"
        sha256 "bb7332cd220cc03cddb713480058f94bdb2cb154ea9b8e08438442e138b58c5a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aosguard-linux-amd64"
        sha256 "1c9378b76203d1296f2a7bb787de596bad08fa1d503760fac784666762089db3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aterm-linux-amd64"
        sha256 "b4ff060ea6d48223486100eb1ffd2fc4e3d6b4d10d5836cfa56e33ec0bf77c20"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aos-linux-arm64"
      sha256 "9c078886b0851a0090f5806fe8848a879d0a4563d7a1240572a3a0693545864a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aoscompose-linux-arm64"
        sha256 "9c078886b0851a0090f5806fe8848a879d0a4563d7a1240572a3a0693545864a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aosward-linux-arm64"
        sha256 "9c078886b0851a0090f5806fe8848a879d0a4563d7a1240572a3a0693545864a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aosguard-linux-arm64"
        sha256 "711302dade5faaef895bdaec6c76df5e44fa52e08f71737c08acecdbbb4a369c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.356.0/aterm-linux-arm64"
        sha256 "37e0c1888e67eb195d2d549fef757df4ff10f4771b8285b33328b0f62070c46a"
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
