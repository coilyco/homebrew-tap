class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.560.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.560.0/aos-darwin-arm64"
    sha256 "997aa4bd21e74234de600ad5a64062fcf67bc9475b98deb15e3a2fc7a1c46bc3"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.560.0/aoscompose-darwin-arm64"
      sha256 "997aa4bd21e74234de600ad5a64062fcf67bc9475b98deb15e3a2fc7a1c46bc3"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.560.0/aosguard-darwin-arm64"
      sha256 "76945e6a8083b78a379764f2503a3fd4b4ca89a789fb0c154727041e6b393172"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.560.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "d010d0cdae50867e3a9a15575fef0198b07bbd779b3eda1511344ed15b61729c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.560.0/aos-linux-amd64"
      sha256 "e2dab3acc338beaf6e4ebc383ddb47c77b9d1edb099e9e4fd5c2bf83c5eb45aa"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.560.0/aoscompose-linux-amd64"
        sha256 "e2dab3acc338beaf6e4ebc383ddb47c77b9d1edb099e9e4fd5c2bf83c5eb45aa"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.560.0/aosguard-linux-amd64"
        sha256 "515b11be6016fddb7e394f048e6d8e8ecccd17b322c203ae72287b68dd445fa0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.560.0/aterm-linux-amd64"
        sha256 "2e17b8fe7abef2c4c51c943253e401b0ea5aabf52fdd6ab165ff812adad8d478"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.560.0/aos-linux-arm64"
      sha256 "9a1dfeadbcdf7833bc911c33d68835ccab197dc42728926e7a83da2789bcb059"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.560.0/aoscompose-linux-arm64"
        sha256 "9a1dfeadbcdf7833bc911c33d68835ccab197dc42728926e7a83da2789bcb059"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.560.0/aosguard-linux-arm64"
        sha256 "571672ee6241c0b9fc8b924120256ea73b5753db61b2654d8803bf0cb03b6d7e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.560.0/aterm-linux-arm64"
        sha256 "3de4be2e290445a4b2a7767e9b6f49ac852525c3e24e179e05a7e260c2131db8"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    # macOS installs the signed bundle, whole (:nounzip) because a stage would
    # step into it, and links bin/aterm to its executable. See docs/aos-cli.md.
    if OS.mac?
      resource("aterm").stage do
        system "tar", "-xzf", Dir["*.tar.gz"].first, "-C", prefix
      end
      bin.install_symlink prefix/"Treehouse.app/Contents/MacOS/aterm"
    else
      resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
