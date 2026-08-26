class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.230.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aos-darwin-arm64"
      sha256 "a7412f6e7f9f6c5ced2359706d96fd92aa9373677824ddbbef5e8658ef780bf5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aoscompose-darwin-arm64"
        sha256 "a7412f6e7f9f6c5ced2359706d96fd92aa9373677824ddbbef5e8658ef780bf5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aosward-darwin-arm64"
        sha256 "a7412f6e7f9f6c5ced2359706d96fd92aa9373677824ddbbef5e8658ef780bf5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aosguard-darwin-arm64"
        sha256 "242bf480f02322e5803d1059bc8fbe90f4bd5617bc283e3c3ceb98a1bec1954e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aterm-darwin-arm64"
        sha256 "748925dc3e95620d53fd98773ce334dc871b1a9b2de8d8fd61a42cebc3944510"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aos-linux-amd64"
      sha256 "bcfefa996e2145b28189ee683bf91522a6777828d32f27ac78692760b24071cf"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aoscompose-linux-amd64"
        sha256 "bcfefa996e2145b28189ee683bf91522a6777828d32f27ac78692760b24071cf"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aosward-linux-amd64"
        sha256 "bcfefa996e2145b28189ee683bf91522a6777828d32f27ac78692760b24071cf"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aosguard-linux-amd64"
        sha256 "d986a344cea0e3d2f1802241e7f706dee279c01615a7a306cbb59ab63394b589"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aterm-linux-amd64"
        sha256 "0dd1b96c16be6a05370b1919f62ef310ad72efe2200db63f6182cbf0161f2039"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aos-linux-arm64"
      sha256 "dab069b6141650c1b7d7af40dd0fbdb3b33b2941dfb3705201761011484697f5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aoscompose-linux-arm64"
        sha256 "dab069b6141650c1b7d7af40dd0fbdb3b33b2941dfb3705201761011484697f5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aosward-linux-arm64"
        sha256 "dab069b6141650c1b7d7af40dd0fbdb3b33b2941dfb3705201761011484697f5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aosguard-linux-arm64"
        sha256 "69a9a677b47257c78ec56f70eb2f0a4d4c4c475ef19b848535839103b8c9eaa0"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.230.0/aterm-linux-arm64"
        sha256 "aaf3acb673982286af84045fdd42504aa0268f5eaf3192caad13e61866c5e975"
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
