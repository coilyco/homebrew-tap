class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.480.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.480.0/aos-darwin-arm64"
      sha256 "25ccfefc76052a7772e485bbd6492d32b86b710a7c8a48459d192647e65bb22e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.480.0/aoscompose-darwin-arm64"
        sha256 "25ccfefc76052a7772e485bbd6492d32b86b710a7c8a48459d192647e65bb22e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.480.0/aosguard-darwin-arm64"
        sha256 "61fcc15b7db2be43caf0a227a90a150ea728b9b4b9bae3f7f64cd6b780d4814a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.480.0/aterm-darwin-arm64"
        sha256 "051601868c914b5122a862c378374d29f7823ea3ff3b590bf71b18f15acb2bcb"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.480.0/aos-linux-amd64"
      sha256 "fbce886ef49c94e69276f6e6796733f7f7fa98be9064b2c907be366c35f4a8d2"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.480.0/aoscompose-linux-amd64"
        sha256 "fbce886ef49c94e69276f6e6796733f7f7fa98be9064b2c907be366c35f4a8d2"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.480.0/aosguard-linux-amd64"
        sha256 "fce89532c1048109dd4ef72c6fccdd93f8bc4bc4d3c4f07e159d304fe2266af1"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.480.0/aterm-linux-amd64"
        sha256 "8e5521079552af957b70baeb1f917c08189c5eacc02f1faa292db142825a58a4"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.480.0/aos-linux-arm64"
      sha256 "74dcc2e5ad4de930176cf29a746a29bceedeacc4441b91fd6fcc9a1ec018fc75"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.480.0/aoscompose-linux-arm64"
        sha256 "74dcc2e5ad4de930176cf29a746a29bceedeacc4441b91fd6fcc9a1ec018fc75"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.480.0/aosguard-linux-arm64"
        sha256 "b4615110a198dd344604762b36edc85bb35d19e17da2814bf4810d4fa1126b79"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.480.0/aterm-linux-arm64"
        sha256 "589a6680122c85797159d22b2f83e3c24bc108283cdb71a68c1087175ea689a3"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
