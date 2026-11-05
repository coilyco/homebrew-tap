class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.517.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.517.0/aos-darwin-arm64"
    sha256 "c189406e9b7ab1af4921197aeeef2f909a294240621a890a3bfee8f5c342e117"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.517.0/aoscompose-darwin-arm64"
      sha256 "c189406e9b7ab1af4921197aeeef2f909a294240621a890a3bfee8f5c342e117"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.517.0/aosguard-darwin-arm64"
      sha256 "a98322980a2a7150dfbe5750993b05ef37ff889ab621140e2b9226abd1ac9ec2"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.517.0/aterm-darwin-arm64"
      sha256 "5b40c96bed9a2dabc82000e4eb5574f71c564ede38665d30e9cf48df48baaf3b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.517.0/aos-linux-amd64"
      sha256 "bc6210ebe926faf7158db223fc3e835a4942102d8e10a5a4329a57926027d793"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.517.0/aoscompose-linux-amd64"
        sha256 "bc6210ebe926faf7158db223fc3e835a4942102d8e10a5a4329a57926027d793"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.517.0/aosguard-linux-amd64"
        sha256 "4f3a27887f6887e65ebf5f06470c98c19805ca81fcfb2f7464d04a4fce065c54"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.517.0/aterm-linux-amd64"
        sha256 "8da99a92f7b5d05aff1170e6170bdd737ba4327123ef78a2833fe4c62b7559df"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.517.0/aos-linux-arm64"
      sha256 "ce96ba2fd1c9c025ec97eef266fafd2bc5acb06f15b692365b8fcf4ea4a618b4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.517.0/aoscompose-linux-arm64"
        sha256 "ce96ba2fd1c9c025ec97eef266fafd2bc5acb06f15b692365b8fcf4ea4a618b4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.517.0/aosguard-linux-arm64"
        sha256 "8cc3abf4eee6f28f5060ef3c80575b921d2a04cf22e689a2537ba73626edcc8a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.517.0/aterm-linux-arm64"
        sha256 "c54eafb7253cf05f8eac29d3bb59f29a67e07a6cc71b66414c8d0116c1ab3471"
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
