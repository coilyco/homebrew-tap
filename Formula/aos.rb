class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.316.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aos-darwin-arm64"
      sha256 "0167d89ba45d56c579143e8bbef200df5743b5d160d8b71f1d56cdb451f18c65"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aoscompose-darwin-arm64"
        sha256 "0167d89ba45d56c579143e8bbef200df5743b5d160d8b71f1d56cdb451f18c65"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aosward-darwin-arm64"
        sha256 "0167d89ba45d56c579143e8bbef200df5743b5d160d8b71f1d56cdb451f18c65"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aosguard-darwin-arm64"
        sha256 "4d20892e5de598e8a3df0cfff1e8c9da10e7e881937074aad7b26bc659c9ace6"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aterm-darwin-arm64"
        sha256 "9cf41aeed061ac8fc8225a80595f9c39f827fa20ad5d187e7a4b4dc1a2f55763"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aos-linux-amd64"
      sha256 "82d90c81436c0031e3029c7c1c457bf9caf008aa1e17efd3cf5e07936d07a28c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aoscompose-linux-amd64"
        sha256 "82d90c81436c0031e3029c7c1c457bf9caf008aa1e17efd3cf5e07936d07a28c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aosward-linux-amd64"
        sha256 "82d90c81436c0031e3029c7c1c457bf9caf008aa1e17efd3cf5e07936d07a28c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aosguard-linux-amd64"
        sha256 "3bd5fa3411182b02426b4868178e548ef89e7a4c3f164d7f8e2437f010d48687"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aterm-linux-amd64"
        sha256 "93c95cb1b69214b3c6e201aaeb21b3b073ffd24ff55fe516d5bd7800e3ad0117"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aos-linux-arm64"
      sha256 "9f702b3c348572e42d3f2acc25e691dfa25823e1738a53418ea3b9f614401716"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aoscompose-linux-arm64"
        sha256 "9f702b3c348572e42d3f2acc25e691dfa25823e1738a53418ea3b9f614401716"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aosward-linux-arm64"
        sha256 "9f702b3c348572e42d3f2acc25e691dfa25823e1738a53418ea3b9f614401716"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aosguard-linux-arm64"
        sha256 "cafb801a428f9a2de0250de10b7c860ee45121e33e5c06562179b1f87e87a75a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.316.0/aterm-linux-arm64"
        sha256 "2cc30e8850e76d3b0a874d59363e1e23057a5b87b100175b37092171f519c4fe"
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
