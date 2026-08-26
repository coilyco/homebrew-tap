class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.247.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aos-darwin-arm64"
      sha256 "66682fa9d3d941733604a9e04278f313c85ebdb2863fd200af4f7c801e8c3b69"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aoscompose-darwin-arm64"
        sha256 "66682fa9d3d941733604a9e04278f313c85ebdb2863fd200af4f7c801e8c3b69"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aosward-darwin-arm64"
        sha256 "66682fa9d3d941733604a9e04278f313c85ebdb2863fd200af4f7c801e8c3b69"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aosguard-darwin-arm64"
        sha256 "ee0012977c8a1ca6013db6ff04fc03a2c6e3e3a7b203334e4f025af97f5f2e08"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aterm-darwin-arm64"
        sha256 "c109c9eca728b7cd401c4f554b6d4ea6e36e50bd522a5022b7e3803283df8380"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aos-linux-amd64"
      sha256 "20e64ddbeb5fa9fda0629d074edbb4c126a7b16b9df7f47c1a5d47dcaaa14309"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aoscompose-linux-amd64"
        sha256 "20e64ddbeb5fa9fda0629d074edbb4c126a7b16b9df7f47c1a5d47dcaaa14309"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aosward-linux-amd64"
        sha256 "20e64ddbeb5fa9fda0629d074edbb4c126a7b16b9df7f47c1a5d47dcaaa14309"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aosguard-linux-amd64"
        sha256 "141fa888b31e069a0200981976257001686839e92945fc87512057b3c92de1e8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aterm-linux-amd64"
        sha256 "a326f8ffe14d4f3dc6ae4b0f8f11f3a2796a963c308461454400af5577f62dd0"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aos-linux-arm64"
      sha256 "c895bbea31b78f566d56930cad5d15ec03b33e4096ebc1b79b2ba7490e496ad7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aoscompose-linux-arm64"
        sha256 "c895bbea31b78f566d56930cad5d15ec03b33e4096ebc1b79b2ba7490e496ad7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aosward-linux-arm64"
        sha256 "c895bbea31b78f566d56930cad5d15ec03b33e4096ebc1b79b2ba7490e496ad7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aosguard-linux-arm64"
        sha256 "b364a6e382b3a3bb6184aa4ee82335ee36b4d1d8ae4591ff5fab9428bf22f292"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.247.0/aterm-linux-arm64"
        sha256 "d69bf4606f9708ea3f97a6809de3a0cf1e2e1c929cb1e8f0f63a2683a2afef19"
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
