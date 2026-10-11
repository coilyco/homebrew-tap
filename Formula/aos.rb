class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.472.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aos-darwin-arm64"
      sha256 "bb2fa12df7db62e3a33a76aa88b83c95995971dd08cf5170ce02374a961dffe6"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aoscompose-darwin-arm64"
        sha256 "bb2fa12df7db62e3a33a76aa88b83c95995971dd08cf5170ce02374a961dffe6"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aosward-darwin-arm64"
        sha256 "bb2fa12df7db62e3a33a76aa88b83c95995971dd08cf5170ce02374a961dffe6"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aosguard-darwin-arm64"
        sha256 "0671f9173f200c921b1c7138fc1f0f8e2efd20587658773ba1f00f95da6a9bed"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aterm-darwin-arm64"
        sha256 "0dcaddb286eabd922015d34d30fa5cff11dfe856116aa274110cbbc6d1b23548"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aos-linux-amd64"
      sha256 "ed6d48c6639a206bc59f8fc547ed8371a51bacce9afe3f053d74730cb5e4f56a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aoscompose-linux-amd64"
        sha256 "ed6d48c6639a206bc59f8fc547ed8371a51bacce9afe3f053d74730cb5e4f56a"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aosward-linux-amd64"
        sha256 "ed6d48c6639a206bc59f8fc547ed8371a51bacce9afe3f053d74730cb5e4f56a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aosguard-linux-amd64"
        sha256 "2625fbf8dc599bacb92c3cc45ea5726b5568894508118755b728100cfe679103"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aterm-linux-amd64"
        sha256 "982b09e434825f1d6947b962a0a7016738bc73990766581c600b74d28d53f831"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aos-linux-arm64"
      sha256 "80d390d3e11949c141f7b87f447ea97a2190b3f926c5d5f7ba47f1aa98e6c83e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aoscompose-linux-arm64"
        sha256 "80d390d3e11949c141f7b87f447ea97a2190b3f926c5d5f7ba47f1aa98e6c83e"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aosward-linux-arm64"
        sha256 "80d390d3e11949c141f7b87f447ea97a2190b3f926c5d5f7ba47f1aa98e6c83e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aosguard-linux-arm64"
        sha256 "46de4640e42eb74af2a0f27e762ac2b10e9094ba1ca87018128c9aab53cb2d5d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.472.0/aterm-linux-arm64"
        sha256 "f977ef052f2dcc905b237d9005d88c635067d096a01f74b284a801100088eb2e"
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
