class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.419.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aos-darwin-arm64"
      sha256 "2e1ad52bdbc1688e6fc7c2c4e70e22a6f4895360eee31bcd39d10b2ce7ee50fc"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aoscompose-darwin-arm64"
        sha256 "2e1ad52bdbc1688e6fc7c2c4e70e22a6f4895360eee31bcd39d10b2ce7ee50fc"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aosward-darwin-arm64"
        sha256 "2e1ad52bdbc1688e6fc7c2c4e70e22a6f4895360eee31bcd39d10b2ce7ee50fc"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aosguard-darwin-arm64"
        sha256 "77b1ae78296459605ae7c4c0a01f5a8bf45f274ed95e6e7e5d8582ed171edcb8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aterm-darwin-arm64"
        sha256 "d122be0c673b396a80dc9490149eb7e589d4b380729a1ac331300052ce3308e0"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aos-linux-amd64"
      sha256 "53fa58bd1362eb94655177f470613522353b073ba14004bb754969d3a0a1c97d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aoscompose-linux-amd64"
        sha256 "53fa58bd1362eb94655177f470613522353b073ba14004bb754969d3a0a1c97d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aosward-linux-amd64"
        sha256 "53fa58bd1362eb94655177f470613522353b073ba14004bb754969d3a0a1c97d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aosguard-linux-amd64"
        sha256 "95b6b0d74986371750507fd6dbc2269781bd60fddaad88a549d28a159e0d35e6"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aterm-linux-amd64"
        sha256 "71f3c8fc58da6fbf315d2dcef653b439cf0e6c5545e9e18299e5b4341c57e7b6"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aos-linux-arm64"
      sha256 "54755e47bceb2e6121ca36bf9a0e19c2935b1f4f924a3c5d9d667af960f3ff96"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aoscompose-linux-arm64"
        sha256 "54755e47bceb2e6121ca36bf9a0e19c2935b1f4f924a3c5d9d667af960f3ff96"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aosward-linux-arm64"
        sha256 "54755e47bceb2e6121ca36bf9a0e19c2935b1f4f924a3c5d9d667af960f3ff96"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aosguard-linux-arm64"
        sha256 "f19966f071ea5706d53279447a000f47c797af4a58c31dfb7e55deb814958816"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.419.0/aterm-linux-arm64"
        sha256 "8d28de98df74644757f231488a5bb34506294e5e762858a4637c773b9283e8c7"
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
