class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.473.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.473.0/aos-darwin-arm64"
      sha256 "046b33e635e7410af66e185e7b2825079d36c9e2c6c718d0f58de3c4cc1b0101"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.473.0/aoscompose-darwin-arm64"
        sha256 "046b33e635e7410af66e185e7b2825079d36c9e2c6c718d0f58de3c4cc1b0101"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.473.0/aosguard-darwin-arm64"
        sha256 "cdc8571c94bbeb1bff14349a916a2df5e46365be7946f8448ae8e7c67ce46b2e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.473.0/aterm-darwin-arm64"
        sha256 "c86850cb6273999cf3e2ceb39e0c3eacb9f984bc93f2c0cac99a91fd5445b6ee"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.473.0/aos-linux-amd64"
      sha256 "6c5603d65a721ecabcd258895f7ef1c99b8b6f49c18bfa826b48a46d5c4c63a3"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.473.0/aoscompose-linux-amd64"
        sha256 "6c5603d65a721ecabcd258895f7ef1c99b8b6f49c18bfa826b48a46d5c4c63a3"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.473.0/aosguard-linux-amd64"
        sha256 "d5be8e2ae32e2f45bf629ca395bec51514af080c1897791b093ee05ad9a0cdc7"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.473.0/aterm-linux-amd64"
        sha256 "0a979e6af7641fdac5e353bf0962a92747abfa5cf1b20cf47af7324f44cfda21"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.473.0/aos-linux-arm64"
      sha256 "f91406d32a10cf9e1276243329fcb27a0f53b83fbe571fc001d7438e3c965a22"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.473.0/aoscompose-linux-arm64"
        sha256 "f91406d32a10cf9e1276243329fcb27a0f53b83fbe571fc001d7438e3c965a22"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.473.0/aosguard-linux-arm64"
        sha256 "10e6349c20635f24f551a19afe47c10d4fe5ea562440a29072074e510d26e76c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.473.0/aterm-linux-arm64"
        sha256 "4151eeebab16517b5c6ac5b464c9e2b47053826d8bc68c7ae4cfb22fd3202233"
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
