class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.553.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.553.0/aos-darwin-arm64"
    sha256 "6c17e99fcf5b1a6dfc80d6d83328a8d2fbb01c0ec437412e25f961552522b638"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.553.0/aoscompose-darwin-arm64"
      sha256 "6c17e99fcf5b1a6dfc80d6d83328a8d2fbb01c0ec437412e25f961552522b638"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.553.0/aosguard-darwin-arm64"
      sha256 "57bbcb24d354d7006dd1b2cb261d4c3f2925d96ab63637cfd9c3bb0fbff87907"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.553.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "1b6168f7adbd449a826d2800c7e81fac97700493a4436fd1241f1b3edd1752f5"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.553.0/aos-linux-amd64"
      sha256 "62e7b463f8e44125b0f0b7b06fc46090d59880e30fb6cb77574fd9f3afe028aa"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.553.0/aoscompose-linux-amd64"
        sha256 "62e7b463f8e44125b0f0b7b06fc46090d59880e30fb6cb77574fd9f3afe028aa"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.553.0/aosguard-linux-amd64"
        sha256 "8cd87535bb09b1f9ecbb257e8eb82ef3a7ca3a615e492d28b768212622d9ea96"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.553.0/aterm-linux-amd64"
        sha256 "4477cefae3a723a934b40289a2b60b52e18d50f77ac6abab4e9c4ef85daf657c"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.553.0/aos-linux-arm64"
      sha256 "ef824f794ca3986917f41900d15e15a4953be0e8a0fcf6d8ae9a28d2e57d7f25"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.553.0/aoscompose-linux-arm64"
        sha256 "ef824f794ca3986917f41900d15e15a4953be0e8a0fcf6d8ae9a28d2e57d7f25"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.553.0/aosguard-linux-arm64"
        sha256 "39598af5ca377ed3d9dbe099829ca31d66803aa551000fd099e3954ca12f9b90"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.553.0/aterm-linux-arm64"
        sha256 "b60cf2709309afa47f96998bb18b18c1303162afee2f033023e013b38640ac18"
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
