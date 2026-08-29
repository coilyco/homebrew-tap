class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.272.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aos-darwin-arm64"
      sha256 "37dc11116b5c4388b1cb2621f1900a5269229c1480ecaef50a5e58f6906f396f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aoscompose-darwin-arm64"
        sha256 "37dc11116b5c4388b1cb2621f1900a5269229c1480ecaef50a5e58f6906f396f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aosward-darwin-arm64"
        sha256 "37dc11116b5c4388b1cb2621f1900a5269229c1480ecaef50a5e58f6906f396f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aosguard-darwin-arm64"
        sha256 "f8481fef52cb1bd05655f32be5356cb46a159667e3361d186e2cc124e1b725c4"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aterm-darwin-arm64"
        sha256 "500311ec9a2be123b5f39654388d272c83ca060447122015c08c62fb504bd04c"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aos-linux-amd64"
      sha256 "62cff7fa023357349b91dccbfc9f4013d084529af17333db7268f00a83ff89eb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aoscompose-linux-amd64"
        sha256 "62cff7fa023357349b91dccbfc9f4013d084529af17333db7268f00a83ff89eb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aosward-linux-amd64"
        sha256 "62cff7fa023357349b91dccbfc9f4013d084529af17333db7268f00a83ff89eb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aosguard-linux-amd64"
        sha256 "209875955b31918645397539845de1c3e661215c5818da11e598d46f9bd647fd"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aterm-linux-amd64"
        sha256 "7556b85e813c5a20802adf5c897a51b4423886bd9cda191c403d6260e7dca857"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aos-linux-arm64"
      sha256 "54f2e583ef4d07351d3ee92037c8b6bd34d1859cae4328e6be26f080592be5d1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aoscompose-linux-arm64"
        sha256 "54f2e583ef4d07351d3ee92037c8b6bd34d1859cae4328e6be26f080592be5d1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aosward-linux-arm64"
        sha256 "54f2e583ef4d07351d3ee92037c8b6bd34d1859cae4328e6be26f080592be5d1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aosguard-linux-arm64"
        sha256 "3726589e6d3c416e798c0a2b453ddf8aaaa233e488d6d2fd54fe19e720a21ba3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.272.0/aterm-linux-arm64"
        sha256 "42ae957db5beb4f0ec2b5e2dba642f78bfff60aca4de7764c29718317210a604"
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
