class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.381.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aos-darwin-arm64"
      sha256 "79d25371131ef2e5c2c327db33435ab862fd97f8b605fc5150c925a37c8b4f11"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aoscompose-darwin-arm64"
        sha256 "79d25371131ef2e5c2c327db33435ab862fd97f8b605fc5150c925a37c8b4f11"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aosward-darwin-arm64"
        sha256 "79d25371131ef2e5c2c327db33435ab862fd97f8b605fc5150c925a37c8b4f11"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aosguard-darwin-arm64"
        sha256 "228f62006d24a52976c3778cc483fc7a096aeb832d7c3a977a7e098c658fa623"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aterm-darwin-arm64"
        sha256 "b5f5b34e3bd00d6988af66fbd9f1cac04849bad3607136884483e3032e1dc5e0"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aos-linux-amd64"
      sha256 "328f1fffc395ae2701251a02ecb0e4c9987a9c3f49161b020b23c421aae7f568"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aoscompose-linux-amd64"
        sha256 "328f1fffc395ae2701251a02ecb0e4c9987a9c3f49161b020b23c421aae7f568"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aosward-linux-amd64"
        sha256 "328f1fffc395ae2701251a02ecb0e4c9987a9c3f49161b020b23c421aae7f568"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aosguard-linux-amd64"
        sha256 "6cb1acde39c18edf69b9d55f694ad1275f618a8b76cdce775d48a6c0207ac588"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aterm-linux-amd64"
        sha256 "d78f6a8abd710f851eae5fd34293535f4f4ce5afc07ae4a03c9e90665828e6a3"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aos-linux-arm64"
      sha256 "e3bf9c508e95977468d626e3b88fecf611856b322aadae19d51208d4f4acfd79"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aoscompose-linux-arm64"
        sha256 "e3bf9c508e95977468d626e3b88fecf611856b322aadae19d51208d4f4acfd79"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aosward-linux-arm64"
        sha256 "e3bf9c508e95977468d626e3b88fecf611856b322aadae19d51208d4f4acfd79"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aosguard-linux-arm64"
        sha256 "2e1108f4b7092c81f0af165a714334374da89e376b02b6d5d024494a62fe684b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.381.0/aterm-linux-arm64"
        sha256 "dcbbd3f5540a3f904c27487f96408f5fcaadc6aa1fef1097e46db167357bfd76"
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
