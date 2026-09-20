class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.348.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aos-darwin-arm64"
      sha256 "1ad110635e134dd5c0982c372babee267b9623adb8307e8d01567d5a30aa732b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aoscompose-darwin-arm64"
        sha256 "1ad110635e134dd5c0982c372babee267b9623adb8307e8d01567d5a30aa732b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aosward-darwin-arm64"
        sha256 "1ad110635e134dd5c0982c372babee267b9623adb8307e8d01567d5a30aa732b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aosguard-darwin-arm64"
        sha256 "8bc0cea123d69c09f45c7ef793a864d40e663378563e321293c0a6572781c8a2"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aterm-darwin-arm64"
        sha256 "2ea7ba50a468bd8150ef173cf700ecec536bc79707150c1006d47f5bd90cac3c"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aos-linux-amd64"
      sha256 "eb7f689f7c5d3427a52fd3fc25e4aa6f282cba23e47f90ea3b2f31cb5ca37202"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aoscompose-linux-amd64"
        sha256 "eb7f689f7c5d3427a52fd3fc25e4aa6f282cba23e47f90ea3b2f31cb5ca37202"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aosward-linux-amd64"
        sha256 "eb7f689f7c5d3427a52fd3fc25e4aa6f282cba23e47f90ea3b2f31cb5ca37202"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aosguard-linux-amd64"
        sha256 "931e501dee7de76a2f426ac98d67096192d5ac54c073f6b336524141806ba4de"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aterm-linux-amd64"
        sha256 "324f9b55f0ec451afe107e82b9e69078abd508e17c12b24a79a824c241bed9fc"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aos-linux-arm64"
      sha256 "9aeedb6ac5d6d50fc91929c05962d8de5b76a84de25b7978ac313b377361f7a8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aoscompose-linux-arm64"
        sha256 "9aeedb6ac5d6d50fc91929c05962d8de5b76a84de25b7978ac313b377361f7a8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aosward-linux-arm64"
        sha256 "9aeedb6ac5d6d50fc91929c05962d8de5b76a84de25b7978ac313b377361f7a8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aosguard-linux-arm64"
        sha256 "c28b37ccdc8fe57dee4cb8fabd608d6b1f150670e93d4803e3dd75b39c81c0db"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.348.0/aterm-linux-arm64"
        sha256 "518d5fe75ea15c5876bc59c287a3389394c304ab6e922cc0ba59ddc3a7338684"
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
