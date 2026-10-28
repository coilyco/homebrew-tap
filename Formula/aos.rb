class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.484.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.484.0/aos-darwin-arm64"
      sha256 "0f09dfe46305351d564c0e857ae60758775923c53cd9db34c80c455022faaccf"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.484.0/aoscompose-darwin-arm64"
        sha256 "0f09dfe46305351d564c0e857ae60758775923c53cd9db34c80c455022faaccf"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.484.0/aosguard-darwin-arm64"
        sha256 "bcf51b3ef3851068d65f54f8e8f5af2547732bb6482eefe5762491c48c53e03f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.484.0/aterm-darwin-arm64"
        sha256 "b6da51948098d96e448c685865f0d9c6cf1d3816b29549ca9560fac9839a5eea"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.484.0/aos-linux-amd64"
      sha256 "2d6adbc9396aa7309dae3feffc9933fe484c3aa7379c6eefedef53c63f93cdc8"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.484.0/aoscompose-linux-amd64"
        sha256 "2d6adbc9396aa7309dae3feffc9933fe484c3aa7379c6eefedef53c63f93cdc8"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.484.0/aosguard-linux-amd64"
        sha256 "38e760101ecaeedf35080bbdedcf7724c788c477504cece10bff1694d72b6e9d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.484.0/aterm-linux-amd64"
        sha256 "605de2f75906dd6b981db95765b27f4bb53b72d568ff7c0272f8a0b642ad191d"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.484.0/aos-linux-arm64"
      sha256 "1f7a91484184e61dfeeac42173d9320d4bd2a661003214fdaa56977da5b511ab"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.484.0/aoscompose-linux-arm64"
        sha256 "1f7a91484184e61dfeeac42173d9320d4bd2a661003214fdaa56977da5b511ab"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.484.0/aosguard-linux-arm64"
        sha256 "688401b768debf27d2bbc75e10cfcc47c7f9abb543d828d1908c1d70dfc026c0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.484.0/aterm-linux-arm64"
        sha256 "4a288d58a975a36679d46899739268320ca5a167b8bd092cc8853d20175abb15"
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
