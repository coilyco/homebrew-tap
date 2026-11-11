class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.591.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.591.0/aos-darwin-arm64"
    sha256 "3f56121a3cb170bebf0b30049f032aea87ba08a5b2ae28c6d4fe1acc51ee3c32"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.591.0/aoscompose-darwin-arm64"
      sha256 "3f56121a3cb170bebf0b30049f032aea87ba08a5b2ae28c6d4fe1acc51ee3c32"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.591.0/aosguard-darwin-arm64"
      sha256 "d2f0d680acb34466d88a385aa1e216232dc96f2faacd788411c0a07fb2ac6937"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.591.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "566f7f0eae05155846612bc1a1ca06d7002e7521ffb37a34ad1d0a09a7fb7610"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.591.0/aos-linux-amd64"
      sha256 "e34f42cd2faf3c84d768f0fa54f25dd920534b9a4167e027a4f31c363e99fa94"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.591.0/aoscompose-linux-amd64"
        sha256 "e34f42cd2faf3c84d768f0fa54f25dd920534b9a4167e027a4f31c363e99fa94"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.591.0/aosguard-linux-amd64"
        sha256 "564c4f1b2baf0d36c47e8aae57555eb98dd3d4397c572c9bb246fcda496b74df"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.591.0/aterm-linux-amd64"
        sha256 "fb3cf3d11ab7beee89e1c20e7cb81166b2a51fc4993733b3cb9268d9ea1d493b"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.591.0/aos-linux-arm64"
      sha256 "3d0d068b44fe413b4f11389f5448237c5d0a490161840100c00aae1fae96d094"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.591.0/aoscompose-linux-arm64"
        sha256 "3d0d068b44fe413b4f11389f5448237c5d0a490161840100c00aae1fae96d094"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.591.0/aosguard-linux-arm64"
        sha256 "58d774f5534fb8bbe3c55ef4da5db4c2bdb2d48279d785aedbe595eb2102f4ec"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.591.0/aterm-linux-arm64"
        sha256 "cf79170c4524e4e8baa642d01742cd3c32ffd58c7eed3756329e885b17d04c5a"
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
