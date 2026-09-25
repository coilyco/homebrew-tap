class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.392.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aos-darwin-arm64"
      sha256 "dc22c840acfdf065f7cf89430f0c17e607922ce2cac03ce6509b4ba1ba3501d8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aoscompose-darwin-arm64"
        sha256 "dc22c840acfdf065f7cf89430f0c17e607922ce2cac03ce6509b4ba1ba3501d8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aosward-darwin-arm64"
        sha256 "dc22c840acfdf065f7cf89430f0c17e607922ce2cac03ce6509b4ba1ba3501d8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aosguard-darwin-arm64"
        sha256 "9c28a6df59c3b7eb1f51cdde15910f7ca1929bb35f929e219b5d41720bf4a7c5"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aterm-darwin-arm64"
        sha256 "76b2894cf61fc1c22c67e070588b183350870fab54c0b7818430be4d58b674d0"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aos-linux-amd64"
      sha256 "5ed05545df15cfd348988e50ccf46bbb822da21f336bf965c94922aac350d536"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aoscompose-linux-amd64"
        sha256 "5ed05545df15cfd348988e50ccf46bbb822da21f336bf965c94922aac350d536"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aosward-linux-amd64"
        sha256 "5ed05545df15cfd348988e50ccf46bbb822da21f336bf965c94922aac350d536"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aosguard-linux-amd64"
        sha256 "28ad83c48fcc51dbec0ddac662fdf6c3deb8f69f3ab7a82e54bf84ad96d5af7b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aterm-linux-amd64"
        sha256 "17d0e0a0ab04059390007adf417f9edd30aea0bb05d8ae01d3f57068f197f331"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aos-linux-arm64"
      sha256 "9b89e2cde6898b6e3872023c7119b92151c3a50472c99bd47c427ef650c9c232"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aoscompose-linux-arm64"
        sha256 "9b89e2cde6898b6e3872023c7119b92151c3a50472c99bd47c427ef650c9c232"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aosward-linux-arm64"
        sha256 "9b89e2cde6898b6e3872023c7119b92151c3a50472c99bd47c427ef650c9c232"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aosguard-linux-arm64"
        sha256 "4a0cc3089c4e2e9f49f12b5d21a2c35b6a24c854a598f3e2577b1cb23b1d72a3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.392.0/aterm-linux-arm64"
        sha256 "13fd8c64e8314215e154492b39b8e800027d6efa2c3e89000afba89894c2107a"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
