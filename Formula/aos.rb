class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.319.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aos-darwin-arm64"
      sha256 "b54b48195a8dace087156f18bed930a27651bcdb9eada3e96c822608a691dcdd"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aoscompose-darwin-arm64"
        sha256 "b54b48195a8dace087156f18bed930a27651bcdb9eada3e96c822608a691dcdd"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aosward-darwin-arm64"
        sha256 "b54b48195a8dace087156f18bed930a27651bcdb9eada3e96c822608a691dcdd"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aosguard-darwin-arm64"
        sha256 "faa5332b480600fb9e94dab346f4c6d670abfcc086e973174c9d6f10eeb21511"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aterm-darwin-arm64"
        sha256 "5777f2bf596d8767fe9a7315b336ad2a8c78ee5e95eb8e464a9319b93e7db05c"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aos-linux-amd64"
      sha256 "0812ae56e06cd488133d45cfec415337902fc11b83853f95d3e53031b5bef2b8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aoscompose-linux-amd64"
        sha256 "0812ae56e06cd488133d45cfec415337902fc11b83853f95d3e53031b5bef2b8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aosward-linux-amd64"
        sha256 "0812ae56e06cd488133d45cfec415337902fc11b83853f95d3e53031b5bef2b8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aosguard-linux-amd64"
        sha256 "ef185bd37e5a58f70aa899dc20dac09320e7ce0eba89a50c52c8556c0e6c64b4"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aterm-linux-amd64"
        sha256 "ee84601814015370e0da10763adc8c0e02c4274ca93468914947894a05c8b8f6"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aos-linux-arm64"
      sha256 "f3317d39236abaed84ecb6bc72d639e97e11d3261a8f2f5f0367ef06e399c303"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aoscompose-linux-arm64"
        sha256 "f3317d39236abaed84ecb6bc72d639e97e11d3261a8f2f5f0367ef06e399c303"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aosward-linux-arm64"
        sha256 "f3317d39236abaed84ecb6bc72d639e97e11d3261a8f2f5f0367ef06e399c303"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aosguard-linux-arm64"
        sha256 "0e99bc7680c3d40be18c3b2ec3db6c0823d8f166b9c04f7dbb54d491512f144e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.319.0/aterm-linux-arm64"
        sha256 "2dd2da85d1437593bae6e193d1edd1acbcf99279e0c6bd0471a327f0cd716767"
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
