class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.415.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aos-darwin-arm64"
      sha256 "1e8c5eceb31fe159fd236a833de3de094ceb3a0b384b334f43ab92c7acd911fc"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aoscompose-darwin-arm64"
        sha256 "1e8c5eceb31fe159fd236a833de3de094ceb3a0b384b334f43ab92c7acd911fc"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aosward-darwin-arm64"
        sha256 "1e8c5eceb31fe159fd236a833de3de094ceb3a0b384b334f43ab92c7acd911fc"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aosguard-darwin-arm64"
        sha256 "ca74fe977e34322f9c90cd3ecd1da2821d05abbfbf029df07d9992134d93cf83"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aterm-darwin-arm64"
        sha256 "5adc213d3ad597c75529e47b4cd4b538b85bf61e9466d6ba4b20ac527ffd9833"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aos-linux-amd64"
      sha256 "0c25232cf167e12303eb404d2e3f06f4a756cb92d68f431aa382052591a86531"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aoscompose-linux-amd64"
        sha256 "0c25232cf167e12303eb404d2e3f06f4a756cb92d68f431aa382052591a86531"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aosward-linux-amd64"
        sha256 "0c25232cf167e12303eb404d2e3f06f4a756cb92d68f431aa382052591a86531"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aosguard-linux-amd64"
        sha256 "8b1a622c25d1bd99cebeeec06eae6659755985d86430b14e04a11562aabd5b19"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aterm-linux-amd64"
        sha256 "a136be27a014f64b29aa370e2cd9c96f3d0cf2c690d2b7300a212212cbf38f9b"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aos-linux-arm64"
      sha256 "8327805fd6a2ec1955b4ee37a63ea478506e56a07c950fc6d5de6ebd4f35fff0"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aoscompose-linux-arm64"
        sha256 "8327805fd6a2ec1955b4ee37a63ea478506e56a07c950fc6d5de6ebd4f35fff0"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aosward-linux-arm64"
        sha256 "8327805fd6a2ec1955b4ee37a63ea478506e56a07c950fc6d5de6ebd4f35fff0"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aosguard-linux-arm64"
        sha256 "64e61686b65ef1147ee09020d9283eada867898a25c7f3168527c21154d0eba8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.415.0/aterm-linux-arm64"
        sha256 "700204ab92e2ab52091b5eb84179e1a9b4d81c9632afa3687eb10363aa304d91"
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
