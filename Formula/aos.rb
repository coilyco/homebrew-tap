class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.457.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aos-darwin-arm64"
      sha256 "05db74d93a13534fde296fc656c68bb1a33a02e588b3d261899bc6b72041a260"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aoscompose-darwin-arm64"
        sha256 "05db74d93a13534fde296fc656c68bb1a33a02e588b3d261899bc6b72041a260"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aosward-darwin-arm64"
        sha256 "05db74d93a13534fde296fc656c68bb1a33a02e588b3d261899bc6b72041a260"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aosguard-darwin-arm64"
        sha256 "b37b06fc030323e291f9fbe860d2cce4839ca8dcc144e22245cf9901eace71a2"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aterm-darwin-arm64"
        sha256 "bdea2db185b3013f1ad50b3b6ad8c93f19dfca4f1a9bdaa31084860ae0df5a17"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aos-linux-amd64"
      sha256 "c43879c37133da051e37a8ab75406a5c56d661e612f0df3a29fb35cb0a6861ad"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aoscompose-linux-amd64"
        sha256 "c43879c37133da051e37a8ab75406a5c56d661e612f0df3a29fb35cb0a6861ad"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aosward-linux-amd64"
        sha256 "c43879c37133da051e37a8ab75406a5c56d661e612f0df3a29fb35cb0a6861ad"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aosguard-linux-amd64"
        sha256 "8f8ed3f96ab057129734d2fa56c3e98812775412fb9f4d1978ca9f51fcc3ff76"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aterm-linux-amd64"
        sha256 "c0810956922cbf06f2c18e07b30d5ee48ac6374a935de801b5cf5c90321dc1ad"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aos-linux-arm64"
      sha256 "93b53a9b6efed13e6e450feccf8752887bfcd03e85fa651d3467ef60fde69d51"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aoscompose-linux-arm64"
        sha256 "93b53a9b6efed13e6e450feccf8752887bfcd03e85fa651d3467ef60fde69d51"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aosward-linux-arm64"
        sha256 "93b53a9b6efed13e6e450feccf8752887bfcd03e85fa651d3467ef60fde69d51"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aosguard-linux-arm64"
        sha256 "0e98d9bc4af5a4998574018b85f76e7e97cd504db4d37749fbe8f7dfe76e9635"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.457.0/aterm-linux-arm64"
        sha256 "328d4440e498f1d3972e2badb80eedd8490f8a937317a29aa00fea12fba738b8"
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
