class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.582.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.582.0/aos-darwin-arm64"
    sha256 "141c2ee3c5313d1347b281c1b6b807e000c574a26e678f64d18bc44edc1460f1"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.582.0/aoscompose-darwin-arm64"
      sha256 "141c2ee3c5313d1347b281c1b6b807e000c574a26e678f64d18bc44edc1460f1"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.582.0/aosguard-darwin-arm64"
      sha256 "b56fd43cfcf9012ec6c7caad17ffb3efa82254a0adf905c77fd5ed420098197b"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.582.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "3240a64575ff8c849e3a851c485c0b2f00851a10ed807f204cd88070f6fcd116"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.582.0/aos-linux-amd64"
      sha256 "6c610d0f788576a2bed5f855d479ed1e343aa1cc692f7389c39222c85f80e101"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.582.0/aoscompose-linux-amd64"
        sha256 "6c610d0f788576a2bed5f855d479ed1e343aa1cc692f7389c39222c85f80e101"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.582.0/aosguard-linux-amd64"
        sha256 "f9779086a5a164339aa315a1a6f9e8d7eef75a5a5dd03a2cfe9961762e8cf4f1"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.582.0/aterm-linux-amd64"
        sha256 "622d1ab62684b1ca1d250e06232cf7783894fcb3dd029a96aad35c197ad6db46"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.582.0/aos-linux-arm64"
      sha256 "0b30bc6886c02db267dfaddcd21e929dcc310a0e7ba754ba0dab094d122873d9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.582.0/aoscompose-linux-arm64"
        sha256 "0b30bc6886c02db267dfaddcd21e929dcc310a0e7ba754ba0dab094d122873d9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.582.0/aosguard-linux-arm64"
        sha256 "3d7d92979d1150668a653efa100e771063950882e001116a78dabd20948dffa5"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.582.0/aterm-linux-arm64"
        sha256 "a6f5b6f71c0ed6189e23367568766b3e43dbca21d1d7ef774732647e17498b77"
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
