class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.293.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aos-darwin-arm64"
      sha256 "2190d6a329728881a22d461501105b203f7221d517d83fe8f78926b3d4d27dda"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aoscompose-darwin-arm64"
        sha256 "2190d6a329728881a22d461501105b203f7221d517d83fe8f78926b3d4d27dda"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aosward-darwin-arm64"
        sha256 "2190d6a329728881a22d461501105b203f7221d517d83fe8f78926b3d4d27dda"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aosguard-darwin-arm64"
        sha256 "93af65ef04ba72598057ac023a59b71000c37ddbdc7539600227eb99e9aee6a8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aterm-darwin-arm64"
        sha256 "d71f088466ea452e698b9dbfe368ebf94241362857917a162871d91891a45df2"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aos-linux-amd64"
      sha256 "e3af555f065dd06cd45ed779aa6dc603842ab57fdf79544ae1913d53bb9bf004"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aoscompose-linux-amd64"
        sha256 "e3af555f065dd06cd45ed779aa6dc603842ab57fdf79544ae1913d53bb9bf004"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aosward-linux-amd64"
        sha256 "e3af555f065dd06cd45ed779aa6dc603842ab57fdf79544ae1913d53bb9bf004"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aosguard-linux-amd64"
        sha256 "8cd96ee2651fb841877cd6790e6419eff1024515c6f4260dde04aaeffdbf8413"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aterm-linux-amd64"
        sha256 "1eea1c1e8dfa900b85f1d4bfb1ebe9ab311de3f7a8c6ea7ea06d024be6b9c30f"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aos-linux-arm64"
      sha256 "d9afc23a757e48e11ce605abe546f4e36e84b9c46d7f28f03ee75d241be23cc0"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aoscompose-linux-arm64"
        sha256 "d9afc23a757e48e11ce605abe546f4e36e84b9c46d7f28f03ee75d241be23cc0"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aosward-linux-arm64"
        sha256 "d9afc23a757e48e11ce605abe546f4e36e84b9c46d7f28f03ee75d241be23cc0"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aosguard-linux-arm64"
        sha256 "1f4d11c282707734dfd3c646639c87208c27225bca024b7737beee06d1522a8d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.293.0/aterm-linux-arm64"
        sha256 "feb85c9492b19a6b47b967da59c7db48753184eee271918b546ceffaa6480de4"
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
