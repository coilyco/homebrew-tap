class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.388.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aos-darwin-arm64"
      sha256 "450115d78e12d91f78dd165ceb173bdc843e2011f9593cd768ca8287ab7b3c62"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aoscompose-darwin-arm64"
        sha256 "450115d78e12d91f78dd165ceb173bdc843e2011f9593cd768ca8287ab7b3c62"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aosward-darwin-arm64"
        sha256 "450115d78e12d91f78dd165ceb173bdc843e2011f9593cd768ca8287ab7b3c62"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aosguard-darwin-arm64"
        sha256 "74a409fc96a535e661ab1a1166899b8110aa466ed0e72156c6eb7ba7a3529d9c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aterm-darwin-arm64"
        sha256 "a9cecc87e4176352755494f94fdbd1a39ca645da4d914b5159ab372c853fb2a1"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aos-linux-amd64"
      sha256 "f34b377eb95c0931d991fba8ff7109ef6fe0ce39e33ae575b128642d6e6ebc34"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aoscompose-linux-amd64"
        sha256 "f34b377eb95c0931d991fba8ff7109ef6fe0ce39e33ae575b128642d6e6ebc34"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aosward-linux-amd64"
        sha256 "f34b377eb95c0931d991fba8ff7109ef6fe0ce39e33ae575b128642d6e6ebc34"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aosguard-linux-amd64"
        sha256 "e1a6bc5547d78913d07f7124dd42dc3899bedfdea70fd7ebc93e85374b8ff85b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aterm-linux-amd64"
        sha256 "e0b30960ae5666848d4f17cccf069ca53740729e22de0fdcd33d1e7d2e65f5f6"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aos-linux-arm64"
      sha256 "6a56fe377fd161f5c2943985c6c003e9ab84d28daaaa928b13e8dadb083a9f27"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aoscompose-linux-arm64"
        sha256 "6a56fe377fd161f5c2943985c6c003e9ab84d28daaaa928b13e8dadb083a9f27"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aosward-linux-arm64"
        sha256 "6a56fe377fd161f5c2943985c6c003e9ab84d28daaaa928b13e8dadb083a9f27"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aosguard-linux-arm64"
        sha256 "b7b9c1c9e16228c6a72892fa1dbb783e765be5dad9bb3884e2e025a61769a6cc"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.388.0/aterm-linux-arm64"
        sha256 "551ad8d633b25912d2ca634373d5a760062b5d0d8b3e9dfbe359781c32683fdf"
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
