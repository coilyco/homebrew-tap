class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.267.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aos-darwin-arm64"
      sha256 "30bc63b8e543c153154fb87c370d473e243310d4ea7e246059ea910b658257fa"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aoscompose-darwin-arm64"
        sha256 "30bc63b8e543c153154fb87c370d473e243310d4ea7e246059ea910b658257fa"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aosward-darwin-arm64"
        sha256 "30bc63b8e543c153154fb87c370d473e243310d4ea7e246059ea910b658257fa"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aosguard-darwin-arm64"
        sha256 "53d7f65e067e9514f6f0c7cbf36bac9a3eb65684f0989532bd73d4b44c9801c3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aterm-darwin-arm64"
        sha256 "ac19ad4bf6c19dac94a0507b8b5c66ab597b545f3ba0ba834ce104d895588f0d"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aos-linux-amd64"
      sha256 "9b7fb0667208734fbe386b5e30e030631618d1a248873dba57f717bec5b7c683"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aoscompose-linux-amd64"
        sha256 "9b7fb0667208734fbe386b5e30e030631618d1a248873dba57f717bec5b7c683"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aosward-linux-amd64"
        sha256 "9b7fb0667208734fbe386b5e30e030631618d1a248873dba57f717bec5b7c683"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aosguard-linux-amd64"
        sha256 "7713f82005e93102896dda816b5632294488f055f2f3a24d35de4fad81196817"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aterm-linux-amd64"
        sha256 "8843af029e0cb14418c4696a5b2fd2a8ce27d673f90d850e52ee17a764cf272a"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aos-linux-arm64"
      sha256 "b21850cbb8f1631d7406e5a8ddefa79979d7d132a26356dd9b5aa7cb59477bdb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aoscompose-linux-arm64"
        sha256 "b21850cbb8f1631d7406e5a8ddefa79979d7d132a26356dd9b5aa7cb59477bdb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aosward-linux-arm64"
        sha256 "b21850cbb8f1631d7406e5a8ddefa79979d7d132a26356dd9b5aa7cb59477bdb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aosguard-linux-arm64"
        sha256 "c4ff12444a7fcbe6725f581dc76f541c9668c72db41e792846c18b43684e0c38"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.267.0/aterm-linux-arm64"
        sha256 "f475d4a2063938c302e5fbc5d913ee190b91eae44d2d69ee1e0979f777eaf864"
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
