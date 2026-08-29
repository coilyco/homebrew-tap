class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.268.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aos-darwin-arm64"
      sha256 "1aa88afdddf0619c6ab5b051297613dfc213ff03632519eab497008c3ea8b40b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aoscompose-darwin-arm64"
        sha256 "1aa88afdddf0619c6ab5b051297613dfc213ff03632519eab497008c3ea8b40b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aosward-darwin-arm64"
        sha256 "1aa88afdddf0619c6ab5b051297613dfc213ff03632519eab497008c3ea8b40b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aosguard-darwin-arm64"
        sha256 "bd133782c6086c2031471349ef30543fd85162cdf0fd33a641ecc3d96503d0ad"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aterm-darwin-arm64"
        sha256 "231174f1619043d5a8bc3ead66433efe39fda77d4942a0af17306a2b66129802"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aos-linux-amd64"
      sha256 "096e2cf5f119f0177397bf5157c26fd3f41fb655f8116ab586d0b4f56b25d84e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aoscompose-linux-amd64"
        sha256 "096e2cf5f119f0177397bf5157c26fd3f41fb655f8116ab586d0b4f56b25d84e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aosward-linux-amd64"
        sha256 "096e2cf5f119f0177397bf5157c26fd3f41fb655f8116ab586d0b4f56b25d84e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aosguard-linux-amd64"
        sha256 "ee1bf7882bb6a640b50cf66e3c116d993952cec08de2f1af86220bf20e32d80d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aterm-linux-amd64"
        sha256 "036c2396ec4d5b6b25956ec17adfe97afc0dd90a84d38d35d3537419a3e926bc"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aos-linux-arm64"
      sha256 "21161abd2d4452fbe3a96b4fec661567ed9e0b4bbb92d694e64ec78ee41ab983"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aoscompose-linux-arm64"
        sha256 "21161abd2d4452fbe3a96b4fec661567ed9e0b4bbb92d694e64ec78ee41ab983"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aosward-linux-arm64"
        sha256 "21161abd2d4452fbe3a96b4fec661567ed9e0b4bbb92d694e64ec78ee41ab983"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aosguard-linux-arm64"
        sha256 "e56ff95b9530e5fb58a60061c023ab779209050e77383a1073eb7ff541d0b7ce"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.268.0/aterm-linux-arm64"
        sha256 "83c92aaf2fc6773bbc0d144aa63168d5adc770169c97d9b5aa742b1c7dbb10b1"
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
