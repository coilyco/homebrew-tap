class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.429.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aos-darwin-arm64"
      sha256 "4eebc4926e899e29f639c5834a3fc9746d1266dd7a7007f159ac46132b9e6f32"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aoscompose-darwin-arm64"
        sha256 "4eebc4926e899e29f639c5834a3fc9746d1266dd7a7007f159ac46132b9e6f32"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aosward-darwin-arm64"
        sha256 "4eebc4926e899e29f639c5834a3fc9746d1266dd7a7007f159ac46132b9e6f32"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aosguard-darwin-arm64"
        sha256 "c672561aa8f2d693068fcc2b904b6f9a23480fd744123cb3df3054f3e01ab731"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aterm-darwin-arm64"
        sha256 "5429edaf110e9f0b9f47d011036fec7555314addbab2024cdf9e93529d19338a"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aos-linux-amd64"
      sha256 "2bd015de05bd14cad7c8fa9935c58b37eeee3f590acbf45aa1a29306dfa73962"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aoscompose-linux-amd64"
        sha256 "2bd015de05bd14cad7c8fa9935c58b37eeee3f590acbf45aa1a29306dfa73962"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aosward-linux-amd64"
        sha256 "2bd015de05bd14cad7c8fa9935c58b37eeee3f590acbf45aa1a29306dfa73962"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aosguard-linux-amd64"
        sha256 "c4653d6db96ccd4116d504338873955c3a03c184eda08865c5df8dfe3e4323f8"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aterm-linux-amd64"
        sha256 "f154ab1247f66950845cdbb3412c9c03da76c1c8eaa402bb6d08c07ef220e609"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aos-linux-arm64"
      sha256 "538f6388c35b6abe4bcd03aff1d961582fe9b7357f92fbebea8c97a2b9d36602"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aoscompose-linux-arm64"
        sha256 "538f6388c35b6abe4bcd03aff1d961582fe9b7357f92fbebea8c97a2b9d36602"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aosward-linux-arm64"
        sha256 "538f6388c35b6abe4bcd03aff1d961582fe9b7357f92fbebea8c97a2b9d36602"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aosguard-linux-arm64"
        sha256 "3b3547294e3c2286e6f46c7b995b23d45fe70c7ae8bc14b3d41aad6b6a7bd4ce"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.429.0/aterm-linux-arm64"
        sha256 "029e90571a6e9baae8481ad6a1b73e7bcb22baa26c8d7cd3f85e83f6f5927669"
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
