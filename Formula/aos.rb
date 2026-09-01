class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.288.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aos-darwin-arm64"
      sha256 "eeb1d665cdff44cc4223b5ea5d23f6ea9a2c8d91979d177aab56fe32d7e8fdc3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aoscompose-darwin-arm64"
        sha256 "eeb1d665cdff44cc4223b5ea5d23f6ea9a2c8d91979d177aab56fe32d7e8fdc3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aosward-darwin-arm64"
        sha256 "eeb1d665cdff44cc4223b5ea5d23f6ea9a2c8d91979d177aab56fe32d7e8fdc3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aosguard-darwin-arm64"
        sha256 "5a283527c090d4e1d4add305bbb363840a12794663f90607a4442c78cfe4565b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aterm-darwin-arm64"
        sha256 "1c6c8f6e5f3e83f41565cd7629e63c5718a3faaf00bd0992fac61b48ec7848d7"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aos-linux-amd64"
      sha256 "98934b0f9bf48da1d44bf55be22fa3ec8f0b0e34cedecf88cba366bb6989ff47"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aoscompose-linux-amd64"
        sha256 "98934b0f9bf48da1d44bf55be22fa3ec8f0b0e34cedecf88cba366bb6989ff47"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aosward-linux-amd64"
        sha256 "98934b0f9bf48da1d44bf55be22fa3ec8f0b0e34cedecf88cba366bb6989ff47"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aosguard-linux-amd64"
        sha256 "a8dac26f8c9b2f18fbb721259b3cf966b5d6670166fdce4a970ba5c4823a4754"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aterm-linux-amd64"
        sha256 "493b58880f9e65ffcc342a843bd4e0bbc035fa487905f9fa125d38edf695056c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aos-linux-arm64"
      sha256 "047472e9c7ede683ec954d3dee0f4ae784544d19e9f96773e6509e1c3537880c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aoscompose-linux-arm64"
        sha256 "047472e9c7ede683ec954d3dee0f4ae784544d19e9f96773e6509e1c3537880c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aosward-linux-arm64"
        sha256 "047472e9c7ede683ec954d3dee0f4ae784544d19e9f96773e6509e1c3537880c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aosguard-linux-arm64"
        sha256 "e48c82d791bd74c0de45bd6e72b501b5b191b9d587f08a28064346dc7ae79fd1"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.288.0/aterm-linux-arm64"
        sha256 "439f628f65750eddf74916a557bcfcf42913b92922d591af951ebc243e5a0fcf"
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
