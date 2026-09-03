class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.301.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aos-darwin-arm64"
      sha256 "3216ff02d33f80253d62aba0c65299716c47cd6870a724ef8a46484c6838cb55"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aoscompose-darwin-arm64"
        sha256 "3216ff02d33f80253d62aba0c65299716c47cd6870a724ef8a46484c6838cb55"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aosward-darwin-arm64"
        sha256 "3216ff02d33f80253d62aba0c65299716c47cd6870a724ef8a46484c6838cb55"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aosguard-darwin-arm64"
        sha256 "14a7e61958aab84d88057748fb1b22dcf884194844105afc29c947eeefc87a7d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aterm-darwin-arm64"
        sha256 "aeed3ec402c13991508651bee07c9ec090a590e15a5074bd1724bf79ae642aac"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aos-linux-amd64"
      sha256 "d7c55534ca02402a483652402a3acdfe42599c8fa2e0266fd24ddd4f27d6df71"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aoscompose-linux-amd64"
        sha256 "d7c55534ca02402a483652402a3acdfe42599c8fa2e0266fd24ddd4f27d6df71"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aosward-linux-amd64"
        sha256 "d7c55534ca02402a483652402a3acdfe42599c8fa2e0266fd24ddd4f27d6df71"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aosguard-linux-amd64"
        sha256 "552e669c7a00e4cc45467bd4846ebc3c35ccf7ccb6583ff18b34bcb370618910"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aterm-linux-amd64"
        sha256 "17b37a7006eb42358c6deeb1f625ae42ddb3d8a33ce5f3a9d5f46a3aee9cd6d2"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aos-linux-arm64"
      sha256 "7014b90fdcbd3b732ff676e5132fc5eb9b5b93b64951e641f8747f610351b29d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aoscompose-linux-arm64"
        sha256 "7014b90fdcbd3b732ff676e5132fc5eb9b5b93b64951e641f8747f610351b29d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aosward-linux-arm64"
        sha256 "7014b90fdcbd3b732ff676e5132fc5eb9b5b93b64951e641f8747f610351b29d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aosguard-linux-arm64"
        sha256 "f70f3b0fe41c816c9c59c213b3811a567c2e0acc05322a2b844aa43a9bf6e52e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.301.0/aterm-linux-arm64"
        sha256 "26de0b9aeab8748ee7e6b4935414c2174fe18f756caa422cb623ec12d6478b96"
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
