class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.512.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.512.0/aos-darwin-arm64"
    sha256 "3b92a60879208cdbb71dc4bcbbe129e610f355f32a66662be972fc6a762cf045"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.512.0/aoscompose-darwin-arm64"
      sha256 "3b92a60879208cdbb71dc4bcbbe129e610f355f32a66662be972fc6a762cf045"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.512.0/aosguard-darwin-arm64"
      sha256 "9b30937c13ab8eeeade42f0e2765bf575169be53d602e247c4a7832c774c0d5d"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.512.0/aterm-darwin-arm64"
      sha256 "aa7134a23641b1d7b23faaa247f49f01a24ad5420627a4ce4176773c2e18c79a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.512.0/aos-linux-amd64"
      sha256 "841f4c9419d08c8770299cfbd160a039db3dc84291e48aaf5c61289f3a3e2912"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.512.0/aoscompose-linux-amd64"
        sha256 "841f4c9419d08c8770299cfbd160a039db3dc84291e48aaf5c61289f3a3e2912"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.512.0/aosguard-linux-amd64"
        sha256 "485d3609b6ddc90f6e4bdc53ce0cc87b3b482322649a8223aaff73708a02285d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.512.0/aterm-linux-amd64"
        sha256 "caab673022219d37b4c060ad9b179b1d3017607575d5b2aa7f8aee253bfa99a9"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.512.0/aos-linux-arm64"
      sha256 "1afdb263183eedd137b68c9aaa19ce477028e99d55a0c3700b45162ca313780d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.512.0/aoscompose-linux-arm64"
        sha256 "1afdb263183eedd137b68c9aaa19ce477028e99d55a0c3700b45162ca313780d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.512.0/aosguard-linux-arm64"
        sha256 "3503ec8c65394a7c472e16ed44b2eb9399adaf6fdf7235bfd365cb6804f4e6a0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.512.0/aterm-linux-arm64"
        sha256 "2c75a4d985e71f59cf9ab0b357bc7027ebcc576a73dc422ea8ca9e2378d74aad"
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
