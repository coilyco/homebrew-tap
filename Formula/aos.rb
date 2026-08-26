class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.240.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aos-darwin-arm64"
      sha256 "2ae93e1f3ace5282815950efa1b9f267dee7547e4ba870094b6e1e9af87aebc5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aoscompose-darwin-arm64"
        sha256 "2ae93e1f3ace5282815950efa1b9f267dee7547e4ba870094b6e1e9af87aebc5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aosward-darwin-arm64"
        sha256 "2ae93e1f3ace5282815950efa1b9f267dee7547e4ba870094b6e1e9af87aebc5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aosguard-darwin-arm64"
        sha256 "db2fcc55230bed1bae4e2e8c7f779b7dc3c4d93600b79ca774b59021e38b909d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aterm-darwin-arm64"
        sha256 "1740fafc052dd8a956fda7cf03faf5bc8ce34961c274ae82c2869199df1cef98"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aos-linux-amd64"
      sha256 "450c2d2fe45d1c20bd0c30179ab94a3ce9aa3db611f09f44124ae7bcddfa02ad"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aoscompose-linux-amd64"
        sha256 "450c2d2fe45d1c20bd0c30179ab94a3ce9aa3db611f09f44124ae7bcddfa02ad"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aosward-linux-amd64"
        sha256 "450c2d2fe45d1c20bd0c30179ab94a3ce9aa3db611f09f44124ae7bcddfa02ad"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aosguard-linux-amd64"
        sha256 "4e504f9d289d82dd1ea8f8a8ee44df19d04414150eeb85476a7b5669a88dfa62"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aterm-linux-amd64"
        sha256 "59c14aa22d19c1078b3c410e4872da58c1e2d6bd817cccce7589e9cb303cb612"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aos-linux-arm64"
      sha256 "ce52c5698f47d402a19e6d3ee6dcc69210b1d3f6a788ae1daf0921f12181e8d3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aoscompose-linux-arm64"
        sha256 "ce52c5698f47d402a19e6d3ee6dcc69210b1d3f6a788ae1daf0921f12181e8d3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aosward-linux-arm64"
        sha256 "ce52c5698f47d402a19e6d3ee6dcc69210b1d3f6a788ae1daf0921f12181e8d3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aosguard-linux-arm64"
        sha256 "9e8463c9e0271a4b4496610358ffcacc6907d9aca9b54b51ee67274ce163a13f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.240.0/aterm-linux-arm64"
        sha256 "20ecb4bb8799f205c65615ea60226660fdd2becb4a7c58f44bcd355260f43bb0"
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
