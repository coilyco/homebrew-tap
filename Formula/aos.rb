class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.547.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.547.0/aos-darwin-arm64"
    sha256 "04071ac6588818ddea4fecd5ecc054b022d8e06476c92660b4f4cd979cd3b44a"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.547.0/aoscompose-darwin-arm64"
      sha256 "04071ac6588818ddea4fecd5ecc054b022d8e06476c92660b4f4cd979cd3b44a"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.547.0/aosguard-darwin-arm64"
      sha256 "ddaffe5df759964aeb6e150f72e1eb097cf76714879778b2efd8dd6a6e8cb152"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.547.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "de6d6c89a78b7011d13b758026a9d546107c14cdc5c864e4ce8669e2e3c14f67"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.547.0/aos-linux-amd64"
      sha256 "982533824f6ab67cb51df97fe07b8c07c982afeefd43d7b4a3eba86c2bf48ac7"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.547.0/aoscompose-linux-amd64"
        sha256 "982533824f6ab67cb51df97fe07b8c07c982afeefd43d7b4a3eba86c2bf48ac7"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.547.0/aosguard-linux-amd64"
        sha256 "2d931bfd8ae15b58b9dbc2871e3fa7f2f1958d52cc4d29074532ed701fc77f77"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.547.0/aterm-linux-amd64"
        sha256 "eff9f7181d938687c811f670fca399a733d6833c710de7ab15c6911053ad3474"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.547.0/aos-linux-arm64"
      sha256 "1d855994fe9222aa2916b8ca31f349695ca32f569953491bf43644001920c5cd"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.547.0/aoscompose-linux-arm64"
        sha256 "1d855994fe9222aa2916b8ca31f349695ca32f569953491bf43644001920c5cd"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.547.0/aosguard-linux-arm64"
        sha256 "6e11aa6c1b9a1c9353c5cfc9dc31087c1cdb368725901b5f0b88220142b08436"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.547.0/aterm-linux-arm64"
        sha256 "431ddc2730f7cb5b374f1891c058fa2a8750e57bd95198336608f031c838cb50"
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
