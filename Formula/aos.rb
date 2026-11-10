class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.565.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.565.0/aos-darwin-arm64"
    sha256 "c9b000588a9e635dd551da7495fc4344d83a5c85f34c9bc7178d343fa946c64b"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.565.0/aoscompose-darwin-arm64"
      sha256 "c9b000588a9e635dd551da7495fc4344d83a5c85f34c9bc7178d343fa946c64b"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.565.0/aosguard-darwin-arm64"
      sha256 "436f5d008eb23d40731ec3923e452c785ba6a61163219b4f061e997b43d09b1a"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.565.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "e0f7aff8653033edd5813e1656011e990949a16cc58b580d39326a5151d5f95c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.565.0/aos-linux-amd64"
      sha256 "5e6b59b025c3fcef8bbc19d63344b69d905c45cd8a6eaed7a0e94a83d6866831"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.565.0/aoscompose-linux-amd64"
        sha256 "5e6b59b025c3fcef8bbc19d63344b69d905c45cd8a6eaed7a0e94a83d6866831"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.565.0/aosguard-linux-amd64"
        sha256 "eb4ee3e5c5b177f8ec5c573db8985676ac12b14ef009a375c68b89b4272e14e1"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.565.0/aterm-linux-amd64"
        sha256 "56d1ca75b35e55d867723ccefeb8168fe7e78d4624c422d93e98726fbf6aba88"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.565.0/aos-linux-arm64"
      sha256 "a7330fc9b69cfe586594ccaccbf2f96c16f745bb1b0556a48cc30a300b0bd5fc"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.565.0/aoscompose-linux-arm64"
        sha256 "a7330fc9b69cfe586594ccaccbf2f96c16f745bb1b0556a48cc30a300b0bd5fc"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.565.0/aosguard-linux-arm64"
        sha256 "69f108e7c6c3bf09cba871696a7e690b20fc384e418f98aec1c79c263ccbdb25"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.565.0/aterm-linux-arm64"
        sha256 "6a78781d1082af15716f5f9817127635e134bc73b0cb646ad630b2eb04c1cac6"
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
