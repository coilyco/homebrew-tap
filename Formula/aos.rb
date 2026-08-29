class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.278.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aos-darwin-arm64"
      sha256 "b9ec55723a78c82b29d3a494b9d567c9febe981f1439326ff93bce698fae8af0"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aoscompose-darwin-arm64"
        sha256 "b9ec55723a78c82b29d3a494b9d567c9febe981f1439326ff93bce698fae8af0"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aosward-darwin-arm64"
        sha256 "b9ec55723a78c82b29d3a494b9d567c9febe981f1439326ff93bce698fae8af0"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aosguard-darwin-arm64"
        sha256 "df7fa7d7f131c29219f562ec7e5d48454ad0dcd6e34c1e6d2c66ed50c2307240"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aterm-darwin-arm64"
        sha256 "91011230bee2c4301d40f372ca062bfb1ea8a8d2aa3525582b8cedc812959a21"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aos-linux-amd64"
      sha256 "c016fa57ab4e73fefa641ab2958403203812e88aa8892e6386d8d4aed6c67375"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aoscompose-linux-amd64"
        sha256 "c016fa57ab4e73fefa641ab2958403203812e88aa8892e6386d8d4aed6c67375"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aosward-linux-amd64"
        sha256 "c016fa57ab4e73fefa641ab2958403203812e88aa8892e6386d8d4aed6c67375"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aosguard-linux-amd64"
        sha256 "61a43526e6aed1dc1c2fa5487e068c9dd7025d9d7ad5a96ab53a93227341da99"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aterm-linux-amd64"
        sha256 "cae2cb65bb12ebc1a096be697d9dc49ec120ab90de2a942e954c29ee045f7e07"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aos-linux-arm64"
      sha256 "c6671419f074fa9b4df22b3a0bdd36ee27ed6a2abb8fe1ba192e0286b86664e7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aoscompose-linux-arm64"
        sha256 "c6671419f074fa9b4df22b3a0bdd36ee27ed6a2abb8fe1ba192e0286b86664e7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aosward-linux-arm64"
        sha256 "c6671419f074fa9b4df22b3a0bdd36ee27ed6a2abb8fe1ba192e0286b86664e7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aosguard-linux-arm64"
        sha256 "891b9b23f12deb78f53b024c4f9a82e171e2c519dbe40a34f2d478c8ed0d2d54"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.278.0/aterm-linux-arm64"
        sha256 "f970afee86d208da68a1b14f5215ac4ae633db739abff9f4418bf041dfc5ee4f"
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
