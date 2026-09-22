class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.350.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aos-darwin-arm64"
      sha256 "50a2e868853609f9c86d49b95554c3fdb90248017c97ad53985ac1bbbfb4ac58"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aoscompose-darwin-arm64"
        sha256 "50a2e868853609f9c86d49b95554c3fdb90248017c97ad53985ac1bbbfb4ac58"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aosward-darwin-arm64"
        sha256 "50a2e868853609f9c86d49b95554c3fdb90248017c97ad53985ac1bbbfb4ac58"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aosguard-darwin-arm64"
        sha256 "ada72c117d41ad1b21be1f70bf0c5b404a6e756616a5c86d37225a3a47379c14"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aterm-darwin-arm64"
        sha256 "d3956d8cdb0856741a83316649d5aaac5f72185e2c86b9a467b6b0dfe312bede"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aos-linux-amd64"
      sha256 "dc595cb7ac6130d956ad6ca3317ce94a1b6c8674dcd3d3a6a195b5518b40f759"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aoscompose-linux-amd64"
        sha256 "dc595cb7ac6130d956ad6ca3317ce94a1b6c8674dcd3d3a6a195b5518b40f759"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aosward-linux-amd64"
        sha256 "dc595cb7ac6130d956ad6ca3317ce94a1b6c8674dcd3d3a6a195b5518b40f759"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aosguard-linux-amd64"
        sha256 "c8f5b5a50ab750577da48688a80dab875a2ef3f63e6afb37fbaadbdb920cbae7"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aterm-linux-amd64"
        sha256 "f4768cc6514b7deafc578df16d988408d68de67ff62667abdb7ee0e1cbaa49ac"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aos-linux-arm64"
      sha256 "2c7108d81222c9d89461cb37c748aee28eb30a431fe5beaa29b175ad9cf2ac2f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aoscompose-linux-arm64"
        sha256 "2c7108d81222c9d89461cb37c748aee28eb30a431fe5beaa29b175ad9cf2ac2f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aosward-linux-arm64"
        sha256 "2c7108d81222c9d89461cb37c748aee28eb30a431fe5beaa29b175ad9cf2ac2f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aosguard-linux-arm64"
        sha256 "435cf422ef4c912fb8c6d3248426dca26c5d16d15db890d9fcd29c0b4755e116"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.350.0/aterm-linux-arm64"
        sha256 "5bf690b7b9964f3b9aba8a6471d50e69004d0b96eba1a41b55db4df58d9c1239"
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
