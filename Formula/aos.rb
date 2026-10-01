class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.408.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aos-darwin-arm64"
      sha256 "401976f7ef3e27f483a7b276efde04c866f434f6afd4707348a5c74970bbc5f1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aoscompose-darwin-arm64"
        sha256 "401976f7ef3e27f483a7b276efde04c866f434f6afd4707348a5c74970bbc5f1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aosward-darwin-arm64"
        sha256 "401976f7ef3e27f483a7b276efde04c866f434f6afd4707348a5c74970bbc5f1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aosguard-darwin-arm64"
        sha256 "57319b4407e08a5a95c9bc62d281518b3377ea863b6e6a9ca753bfaf7dca248a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aterm-darwin-arm64"
        sha256 "069c65768d6e9d91b6bd1fe521ff9a9157d1b3e80cc472419c9acdb6d21e12ef"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aos-linux-amd64"
      sha256 "89428dc12a7d939be090f5cd76364a60afdb6b9d050b87d6e2ec08b9dae50429"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aoscompose-linux-amd64"
        sha256 "89428dc12a7d939be090f5cd76364a60afdb6b9d050b87d6e2ec08b9dae50429"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aosward-linux-amd64"
        sha256 "89428dc12a7d939be090f5cd76364a60afdb6b9d050b87d6e2ec08b9dae50429"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aosguard-linux-amd64"
        sha256 "2586071d00a2a90b850a5ea64a3d47884ce7d3e29757d0cd2c26e935478f13b7"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aterm-linux-amd64"
        sha256 "dd3f41f9ec5551cffe7faa0e6fb739634f68bfc2f9748fe8431011358b0093b4"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aos-linux-arm64"
      sha256 "d48bb80d0af4c332a8a29e8d7b327cc940183220d28ed6b84e45d8f6ce6243d2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aoscompose-linux-arm64"
        sha256 "d48bb80d0af4c332a8a29e8d7b327cc940183220d28ed6b84e45d8f6ce6243d2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aosward-linux-arm64"
        sha256 "d48bb80d0af4c332a8a29e8d7b327cc940183220d28ed6b84e45d8f6ce6243d2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aosguard-linux-arm64"
        sha256 "3e4ca3548ea0a51953573ab3bcf0e4cb75cb2f6bc758f6bcfeb83400a0503dc6"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.408.0/aterm-linux-arm64"
        sha256 "c0720323c7af6c9cf4a4246df515c726b768af3e2f35ee51dacfd978580a1450"
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
