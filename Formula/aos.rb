class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.478.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.478.0/aos-darwin-arm64"
      sha256 "0ba0dbdb994f29e1c380707e6822548ac0f5ae8ea586fbc63206a8f268a2e94c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.478.0/aoscompose-darwin-arm64"
        sha256 "0ba0dbdb994f29e1c380707e6822548ac0f5ae8ea586fbc63206a8f268a2e94c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.478.0/aosguard-darwin-arm64"
        sha256 "ab0c7b147258f61f8e3eaaa9a9a088dc905e2dc8a31f31e7123185a63c891cc9"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.478.0/aterm-darwin-arm64"
        sha256 "a4f04b7bbade7d64bdeaa4d52aa9835d9163523428b394cf8bba93dab8471dda"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.478.0/aos-linux-amd64"
      sha256 "06504a3f2001d5216bc8a1f6a37a26f2b51b7050fb062a4785742668861e6f35"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.478.0/aoscompose-linux-amd64"
        sha256 "06504a3f2001d5216bc8a1f6a37a26f2b51b7050fb062a4785742668861e6f35"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.478.0/aosguard-linux-amd64"
        sha256 "6fc056868d981e456fc8ddbf296d90799f50eddd752e30f217832a81380411bd"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.478.0/aterm-linux-amd64"
        sha256 "b3744a859462b3017bb72e895d97295bceaeb527116bb10a2e71927f67198b60"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.478.0/aos-linux-arm64"
      sha256 "d56c258ea37082dcedda4285efdfd51df7d331a7c9f45f1861ba48354e71b9a7"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.478.0/aoscompose-linux-arm64"
        sha256 "d56c258ea37082dcedda4285efdfd51df7d331a7c9f45f1861ba48354e71b9a7"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.478.0/aosguard-linux-arm64"
        sha256 "bfb9de9a8af6dc1284ed78f925c7df6ae4f7c18c540206170233db743376f1b3"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.478.0/aterm-linux-arm64"
        sha256 "07c2c4b08a70a8e7b5eb86b117fb8fd7e0b660459d853101da283be143275111"
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
