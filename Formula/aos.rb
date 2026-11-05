class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.535.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.535.0/aos-darwin-arm64"
    sha256 "a7005229c6be818eb0de623f90c60d24b970428e8e8941f2e35488370c768087"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.535.0/aoscompose-darwin-arm64"
      sha256 "a7005229c6be818eb0de623f90c60d24b970428e8e8941f2e35488370c768087"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.535.0/aosguard-darwin-arm64"
      sha256 "8df9eb42a5204c22b140cb28e157adf61e3f39abefd3016ca91b48ebdc85e888"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.535.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "44be65d2bc6dd10332962830868852ff20022d26a75565df421d5040dbaf580e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.535.0/aos-linux-amd64"
      sha256 "7c942d4fa04b9a26bd961c0189fa9fc6cdb97da540e65f74ce6f101ee89cad54"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.535.0/aoscompose-linux-amd64"
        sha256 "7c942d4fa04b9a26bd961c0189fa9fc6cdb97da540e65f74ce6f101ee89cad54"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.535.0/aosguard-linux-amd64"
        sha256 "85ac1d7694de48d47d301111524ffb3bee61d2414a77f198a9636ecc5f41e49f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.535.0/aterm-linux-amd64"
        sha256 "ddd4c92e368a4acb4adf63cca230e98aac19cb920042c6e250ebd671983ea17e"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.535.0/aos-linux-arm64"
      sha256 "c54e1f5b244b6832928baf6225d2f444549d252bc2dde0e1ce1cdf0ade360481"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.535.0/aoscompose-linux-arm64"
        sha256 "c54e1f5b244b6832928baf6225d2f444549d252bc2dde0e1ce1cdf0ade360481"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.535.0/aosguard-linux-arm64"
        sha256 "9827efaf57afe32d8850acc3d9da63efc1def0ddb99f8108c76e1512c24d913b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.535.0/aterm-linux-arm64"
        sha256 "2af8fd338721e5a25641f1f890d3db3d710e27a4682f725d35fcbb43b236bbb4"
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
