class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.580.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.580.0/aos-darwin-arm64"
    sha256 "3af16d8cdb3bb53c6656ce2bc65860e0e1c34ba73365edfc12cb4e44c139dfe1"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.580.0/aoscompose-darwin-arm64"
      sha256 "3af16d8cdb3bb53c6656ce2bc65860e0e1c34ba73365edfc12cb4e44c139dfe1"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.580.0/aosguard-darwin-arm64"
      sha256 "2627b22e8aaeeed8e1f07717c32ab8643426588d8d32d95ede2d7ab3b33ab83e"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.580.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "d099e609e6d9f8a90d84b89e7064285e42a944a7150d53331458b32b3779aea7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.580.0/aos-linux-amd64"
      sha256 "54519b05235e41b2113f8530deaad880dc505ffdfcaec5287ea4d7a59f22ead3"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.580.0/aoscompose-linux-amd64"
        sha256 "54519b05235e41b2113f8530deaad880dc505ffdfcaec5287ea4d7a59f22ead3"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.580.0/aosguard-linux-amd64"
        sha256 "1628962474f2b92b680e47a9cc7227cd6c4d56dad1619686f6c308e5d33541bc"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.580.0/aterm-linux-amd64"
        sha256 "b40d4859af8921a990c9ace51dc8e314afebcd22e5cb391dad4a3cc85563f83f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.580.0/aos-linux-arm64"
      sha256 "130b9c3a2f8ecee29aa02d3c6e979ae41db99fc0a59160bfa8d8c5543431edc7"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.580.0/aoscompose-linux-arm64"
        sha256 "130b9c3a2f8ecee29aa02d3c6e979ae41db99fc0a59160bfa8d8c5543431edc7"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.580.0/aosguard-linux-arm64"
        sha256 "6421b23ae6e6a340479bf4bb8c334e115b83fea356c75e4d906d675ec75c3e65"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.580.0/aterm-linux-arm64"
        sha256 "a4a99efdeb2ca0545ebab0b5c37aba77948f65eed6727999bc9b3723f0d46426"
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
