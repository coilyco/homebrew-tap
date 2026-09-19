class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.342.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aos-darwin-arm64"
      sha256 "21a45ccf0477d5987dc4572e337a84d22b1f10d26b369b6231285f856098e4c0"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aoscompose-darwin-arm64"
        sha256 "21a45ccf0477d5987dc4572e337a84d22b1f10d26b369b6231285f856098e4c0"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aosward-darwin-arm64"
        sha256 "21a45ccf0477d5987dc4572e337a84d22b1f10d26b369b6231285f856098e4c0"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aosguard-darwin-arm64"
        sha256 "6d0f852013e41bf6c17c830782bb2b2462eb3e3dc2fc35752ecea7b64f686151"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aterm-darwin-arm64"
        sha256 "349d97566665aa0c3e0e731369e2b453a7574b4514345723f107d9ea672eafa7"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aos-linux-amd64"
      sha256 "3fca5810d1a554e2103d4f29e4111ae2cb5598a885bdd859a9203a8d01162ded"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aoscompose-linux-amd64"
        sha256 "3fca5810d1a554e2103d4f29e4111ae2cb5598a885bdd859a9203a8d01162ded"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aosward-linux-amd64"
        sha256 "3fca5810d1a554e2103d4f29e4111ae2cb5598a885bdd859a9203a8d01162ded"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aosguard-linux-amd64"
        sha256 "cdeb0b44bcd46d5be536c2a4635408060887253ed4644ee921af086949cd3707"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aterm-linux-amd64"
        sha256 "8254dce0502f015d3fb47016395bb0a83c5dbbd042272e0caca5a3c2cc979013"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aos-linux-arm64"
      sha256 "81bb5062b9b17ea38f7f08950e63cc9ab392bf386d9ab7dff0ef2724bda9aad2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aoscompose-linux-arm64"
        sha256 "81bb5062b9b17ea38f7f08950e63cc9ab392bf386d9ab7dff0ef2724bda9aad2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aosward-linux-arm64"
        sha256 "81bb5062b9b17ea38f7f08950e63cc9ab392bf386d9ab7dff0ef2724bda9aad2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aosguard-linux-arm64"
        sha256 "efc2375a6d6149319f27c55173096920b9870c1a5d8b85ff478f24f4710c2f25"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.342.0/aterm-linux-arm64"
        sha256 "e06226c0da83cf75635d9471f4382ae8b02bb2d310e10377abd84860fe2cfad8"
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
