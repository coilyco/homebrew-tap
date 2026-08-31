class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.284.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aos-darwin-arm64"
      sha256 "1f045fca9aca5a05c5ff1f41b8d14872ed054089f4e97a06dd18cf1d11434b7d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aoscompose-darwin-arm64"
        sha256 "1f045fca9aca5a05c5ff1f41b8d14872ed054089f4e97a06dd18cf1d11434b7d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aosward-darwin-arm64"
        sha256 "1f045fca9aca5a05c5ff1f41b8d14872ed054089f4e97a06dd18cf1d11434b7d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aosguard-darwin-arm64"
        sha256 "181497470d5781b06df3408e27769c805fcfc0efd11b6d2311116fcc475701de"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aterm-darwin-arm64"
        sha256 "7a44acb87073190812616d9741ddc8484869b39d70d5644f03081ad89a47dd29"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aos-linux-amd64"
      sha256 "5fe38afdd4dab79a386915019a99508c47293d8f9f6e828e03847dbe24ca8919"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aoscompose-linux-amd64"
        sha256 "5fe38afdd4dab79a386915019a99508c47293d8f9f6e828e03847dbe24ca8919"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aosward-linux-amd64"
        sha256 "5fe38afdd4dab79a386915019a99508c47293d8f9f6e828e03847dbe24ca8919"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aosguard-linux-amd64"
        sha256 "3e36c2518db53a78d2c47dfbc3c7d595d03e3540ae0a0100e79183233d14b649"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aterm-linux-amd64"
        sha256 "886db721a52bfcc5f19c6018181068a799d4e0c903281cb6798512c8c9c7f123"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aos-linux-arm64"
      sha256 "2856c2c3011f1356736ec99381722e823cb26ee676348a6fcb9e7936d0712e61"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aoscompose-linux-arm64"
        sha256 "2856c2c3011f1356736ec99381722e823cb26ee676348a6fcb9e7936d0712e61"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aosward-linux-arm64"
        sha256 "2856c2c3011f1356736ec99381722e823cb26ee676348a6fcb9e7936d0712e61"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aosguard-linux-arm64"
        sha256 "58f99e53c1d5199d7464cbfa22da681a1014c564f2a6db49724fc2dc8229a2aa"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.284.0/aterm-linux-arm64"
        sha256 "4ad0b8ca287d44f85d3741379cb4fd68e7bf5c5eb9cf93e087e7fe1f16032a01"
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
