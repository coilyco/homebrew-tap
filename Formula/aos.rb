class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.389.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aos-darwin-arm64"
      sha256 "e6e8794dd388aee0171c448fae54e7ae5473bb85709bd808a7b86dc5eb20d8e1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aoscompose-darwin-arm64"
        sha256 "e6e8794dd388aee0171c448fae54e7ae5473bb85709bd808a7b86dc5eb20d8e1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aosward-darwin-arm64"
        sha256 "e6e8794dd388aee0171c448fae54e7ae5473bb85709bd808a7b86dc5eb20d8e1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aosguard-darwin-arm64"
        sha256 "662ffe8d13642794161fa2fe8c8ee79da47bc9a21a4c4e875a4aca01e093b305"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aterm-darwin-arm64"
        sha256 "73fe97f5a7d3bf02529e3e35666281e6967f08ff2d77e17e84d8f70893793a2f"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aos-linux-amd64"
      sha256 "b2b9cea395ea4ab5a5ba604fe845537fad5a82d775794399558a8bb78d6f61a0"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aoscompose-linux-amd64"
        sha256 "b2b9cea395ea4ab5a5ba604fe845537fad5a82d775794399558a8bb78d6f61a0"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aosward-linux-amd64"
        sha256 "b2b9cea395ea4ab5a5ba604fe845537fad5a82d775794399558a8bb78d6f61a0"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aosguard-linux-amd64"
        sha256 "f3bba8d80bcf0f8429ea80421635af064007530a398f64c6230f66c87ec48dc7"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aterm-linux-amd64"
        sha256 "6992f4fb2744b8e00c76d06b96c849bc6f5fd37226d9583880615ecf6582cd55"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aos-linux-arm64"
      sha256 "e4d405987da96bba71c5166656e211a8aa83b7f6dad2e82f53503da4604915a6"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aoscompose-linux-arm64"
        sha256 "e4d405987da96bba71c5166656e211a8aa83b7f6dad2e82f53503da4604915a6"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aosward-linux-arm64"
        sha256 "e4d405987da96bba71c5166656e211a8aa83b7f6dad2e82f53503da4604915a6"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aosguard-linux-arm64"
        sha256 "ef9f5f75dd3c90b9a4fe20da2a4168305b492eccd8730750f31bcdf0b026fcfe"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.389.0/aterm-linux-arm64"
        sha256 "4be5d010dd1e5e4354db68e574d7411cc37c930a2ecadbbd2590bc5ec2071d20"
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
