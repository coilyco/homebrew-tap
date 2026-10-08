class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.454.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aos-darwin-arm64"
      sha256 "57837ea569f22cd1f36a0720caa8912f530a779f6385557c32d38856317861d5"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aoscompose-darwin-arm64"
        sha256 "57837ea569f22cd1f36a0720caa8912f530a779f6385557c32d38856317861d5"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aosward-darwin-arm64"
        sha256 "57837ea569f22cd1f36a0720caa8912f530a779f6385557c32d38856317861d5"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aosguard-darwin-arm64"
        sha256 "9ba3b8d03db1a3c4926950640f0a29d0dfb073a7cd60aa12958f61d7b450a4b2"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aterm-darwin-arm64"
        sha256 "f8ccbd12860b38f0bced388c90eca12271a8d93da4481786bcabc6736e7591c4"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aos-linux-amd64"
      sha256 "26cf9b520894a7e16e5aff698e25c480c39be6d54789ffd6012f58fad06e251e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aoscompose-linux-amd64"
        sha256 "26cf9b520894a7e16e5aff698e25c480c39be6d54789ffd6012f58fad06e251e"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aosward-linux-amd64"
        sha256 "26cf9b520894a7e16e5aff698e25c480c39be6d54789ffd6012f58fad06e251e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aosguard-linux-amd64"
        sha256 "8753703105b92f715e6c6a2b9f4ff4d4cbc84a31126989e600a017e8d1d9bc72"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aterm-linux-amd64"
        sha256 "ec691339ba3e6e589ec989d6ad68c2ecc4203380234af11e76f6fd2dd74f13af"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aos-linux-arm64"
      sha256 "d617bb5f492255c8b02c4a5a1b7c71777a0cbac17b30de0cc42fe6412f45094e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aoscompose-linux-arm64"
        sha256 "d617bb5f492255c8b02c4a5a1b7c71777a0cbac17b30de0cc42fe6412f45094e"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aosward-linux-arm64"
        sha256 "d617bb5f492255c8b02c4a5a1b7c71777a0cbac17b30de0cc42fe6412f45094e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aosguard-linux-arm64"
        sha256 "a77b26405075578d32f95e13d42bb45a54f42b299e05aeb7fa988d7148a6a3ea"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.454.0/aterm-linux-arm64"
        sha256 "8e9f53df53aa7fa9bdcd73347365f891eec5277593178251fa79684c2e336b18"
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
