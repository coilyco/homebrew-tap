class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.246.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aos-darwin-arm64"
      sha256 "01ac705082e771d01153b76786e88842ab972eddb3d81c1aaa06ba3ee47a55dd"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aoscompose-darwin-arm64"
        sha256 "01ac705082e771d01153b76786e88842ab972eddb3d81c1aaa06ba3ee47a55dd"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aosward-darwin-arm64"
        sha256 "01ac705082e771d01153b76786e88842ab972eddb3d81c1aaa06ba3ee47a55dd"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aosguard-darwin-arm64"
        sha256 "e5b3c93062e3363394e698ba3cbc358ec7c7e152830d95a57aae6bb4f4a857ef"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aterm-darwin-arm64"
        sha256 "74c774ff9dfe39460af055ae581576f89027c397dd58d6c895fcbb640b1667ca"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aos-linux-amd64"
      sha256 "75f38a23f95b34b91a82dbd89c4d3e584e184c9324ef00489cbd96e8a2dcf921"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aoscompose-linux-amd64"
        sha256 "75f38a23f95b34b91a82dbd89c4d3e584e184c9324ef00489cbd96e8a2dcf921"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aosward-linux-amd64"
        sha256 "75f38a23f95b34b91a82dbd89c4d3e584e184c9324ef00489cbd96e8a2dcf921"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aosguard-linux-amd64"
        sha256 "49b272f6b157fceda68ca0f96ffc792474123129ad79f18cff723092c49e4b88"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aterm-linux-amd64"
        sha256 "f9cd10fa1fbbc22ac2b919cce9a680577d0020d661dc756c255045aa3a48fe92"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aos-linux-arm64"
      sha256 "8caac4a2f11ba31f28baab7931a3bbf626bfe271a4918a264f9377cb94f20f7d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aoscompose-linux-arm64"
        sha256 "8caac4a2f11ba31f28baab7931a3bbf626bfe271a4918a264f9377cb94f20f7d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aosward-linux-arm64"
        sha256 "8caac4a2f11ba31f28baab7931a3bbf626bfe271a4918a264f9377cb94f20f7d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aosguard-linux-arm64"
        sha256 "87935b1f5b806922568f7f11054900cbf8b7c302064f82eece3442afea9f21d8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.246.0/aterm-linux-arm64"
        sha256 "5adc3fb87db4ed9e9677198cd472ba888aef0a66eb7751f524836f3c64be88db"
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
