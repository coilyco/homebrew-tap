class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.306.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aos-darwin-arm64"
      sha256 "9def4ecfba3200cb003111aff736eb98b21f6ed3f5d188958a7391f743db3b9e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aoscompose-darwin-arm64"
        sha256 "9def4ecfba3200cb003111aff736eb98b21f6ed3f5d188958a7391f743db3b9e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aosward-darwin-arm64"
        sha256 "9def4ecfba3200cb003111aff736eb98b21f6ed3f5d188958a7391f743db3b9e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aosguard-darwin-arm64"
        sha256 "32fe88eb7f3732bde957f85571d729b359357957d2071a7df0772d8f5bc9471b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aterm-darwin-arm64"
        sha256 "865775fcc180bad9111ec6e60ce584c124c557ff5f6a5cc804fe12f231a4ba96"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aos-linux-amd64"
      sha256 "10975da36f2027223bace2bf72dd78ee9afc90397fed2ef4321700167819bc85"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aoscompose-linux-amd64"
        sha256 "10975da36f2027223bace2bf72dd78ee9afc90397fed2ef4321700167819bc85"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aosward-linux-amd64"
        sha256 "10975da36f2027223bace2bf72dd78ee9afc90397fed2ef4321700167819bc85"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aosguard-linux-amd64"
        sha256 "909503eb659a95f92f606aa6e64d14e5b8d821f7c9e8d57bbb7068fec9b3a61b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aterm-linux-amd64"
        sha256 "1045378865700c2df38164513883354876f8155416bb7274c89b524bba437003"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aos-linux-arm64"
      sha256 "2683a4a97326ae298c4b8a23ee49339e4ce14b9f9a2bceed752f4778e0e70497"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aoscompose-linux-arm64"
        sha256 "2683a4a97326ae298c4b8a23ee49339e4ce14b9f9a2bceed752f4778e0e70497"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aosward-linux-arm64"
        sha256 "2683a4a97326ae298c4b8a23ee49339e4ce14b9f9a2bceed752f4778e0e70497"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aosguard-linux-arm64"
        sha256 "107e788bbad7a3dc950c9686cff2ba5d1d7986b6fe038a73936134c4d7b684d2"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.306.0/aterm-linux-arm64"
        sha256 "0443314999875bc3679729a36155a5b206c71e78249f7344411ed13b91f00e47"
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
