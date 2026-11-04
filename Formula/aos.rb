class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.507.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.507.0/aos-darwin-arm64"
    sha256 "8b23710a071b26efa20e58cb44244ed0d8dc67caa011bdff048e04cc4dfa8cc5"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.507.0/aoscompose-darwin-arm64"
      sha256 "8b23710a071b26efa20e58cb44244ed0d8dc67caa011bdff048e04cc4dfa8cc5"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.507.0/aosguard-darwin-arm64"
      sha256 "3c90313afe0da9d271ffdb409059c2add1c1c5bc4ba67236d4c6e2e4b6121445"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.507.0/aterm-darwin-arm64"
      sha256 "0b14f03111be3e5d0e6aa08c39c5af7d0787298d73a79ce4887008d1ba86361e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.507.0/aos-linux-amd64"
      sha256 "2e3220d2379a34b5a10ebe335c7b9cad3e0d14eddcd50cc8c7f0937d61d15a53"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.507.0/aoscompose-linux-amd64"
        sha256 "2e3220d2379a34b5a10ebe335c7b9cad3e0d14eddcd50cc8c7f0937d61d15a53"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.507.0/aosguard-linux-amd64"
        sha256 "e32a15373792c44166fb26afc1c32ce6eab7c9e7c54d54ed9cb7b8867758c623"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.507.0/aterm-linux-amd64"
        sha256 "49eff064008097e949caab2ebcce2f88d6e61879117c4642adc067cfa36ab12b"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.507.0/aos-linux-arm64"
      sha256 "5404ebc15540f0595790ace88f5a89179b3cd0111c79ffe1059df17f0e9af6e8"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.507.0/aoscompose-linux-arm64"
        sha256 "5404ebc15540f0595790ace88f5a89179b3cd0111c79ffe1059df17f0e9af6e8"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.507.0/aosguard-linux-arm64"
        sha256 "957b24d5c8d7b889077d316e886a8ea2a198887e448fa2dd86fe0e9ce59f5534"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.507.0/aterm-linux-arm64"
        sha256 "877d4c248dbaf74bed974ddb8195d939c41f795f66563d32c1ee37ea743cdfde"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
