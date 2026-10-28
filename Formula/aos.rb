class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.485.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.485.0/aos-darwin-arm64"
    sha256 "61d1c22d6adc2b24a28bfa2e53723f3bffd1f960a93973e881bb7b3ab303273b"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.485.0/aoscompose-darwin-arm64"
      sha256 "61d1c22d6adc2b24a28bfa2e53723f3bffd1f960a93973e881bb7b3ab303273b"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.485.0/aosguard-darwin-arm64"
      sha256 "d26b4f9d1a990f323bad1d96d38afc1f4226d3eb5c40a75d5ca95b2c84721f7a"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.485.0/aterm-darwin-arm64"
      sha256 "2e58650a26214b7acf1be72cf4c51e7a33fe7f181c8d6c4e4ad104bee6152973"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.485.0/aos-linux-amd64"
      sha256 "d3f3490b4b59c50beb07372290ce0655a5fbf9746e8a2c3f52fad592506e5a14"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.485.0/aoscompose-linux-amd64"
        sha256 "d3f3490b4b59c50beb07372290ce0655a5fbf9746e8a2c3f52fad592506e5a14"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.485.0/aosguard-linux-amd64"
        sha256 "28e9a507cf57cda16b78bd5f469ebe2dbdc76625b48d8016953a8b5fb73233bb"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.485.0/aterm-linux-amd64"
        sha256 "2ed85f7a454f09a8cdc17ceb8bc4ab20ad3fd2d32f7613250b423f304d8b1f3a"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.485.0/aos-linux-arm64"
      sha256 "1f92a43c63627a5287ae762fd5f05f7e569100c65d4924ea7d520611bdfa89ec"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.485.0/aoscompose-linux-arm64"
        sha256 "1f92a43c63627a5287ae762fd5f05f7e569100c65d4924ea7d520611bdfa89ec"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.485.0/aosguard-linux-arm64"
        sha256 "5786d3d4d4892aefe6ce590cf8fcaec86db79c8c05a2b3add2bdaeca9cf3487e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.485.0/aterm-linux-arm64"
        sha256 "3b82fee66da31557b6724ae0230c60fa797548a0b62abe7b33b58fbf876c1e7d"
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
