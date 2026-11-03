class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.489.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.489.0/aos-darwin-arm64"
    sha256 "1869647b0bddf7151d8c74f6358b61f0d4cb92c664a1882863e846dbde2ccaed"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.489.0/aoscompose-darwin-arm64"
      sha256 "1869647b0bddf7151d8c74f6358b61f0d4cb92c664a1882863e846dbde2ccaed"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.489.0/aosguard-darwin-arm64"
      sha256 "e0514e022474a1a4ef1a12e8bb5ebe83bc4979d40bfb40347bab77418d45690f"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.489.0/aterm-darwin-arm64"
      sha256 "b0c03c00488ba16440cd82fbc7d8ece2c949d7c1d7f1264684e49203ed42a741"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.489.0/aos-linux-amd64"
      sha256 "4b984b61b14ffc4868f2b365c9bce2b7629130505104d8fb525f299e1bde96f6"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.489.0/aoscompose-linux-amd64"
        sha256 "4b984b61b14ffc4868f2b365c9bce2b7629130505104d8fb525f299e1bde96f6"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.489.0/aosguard-linux-amd64"
        sha256 "6c6f210900e46ec7a640b5c604d3d3e6795d98cdc8b17c718a876f2c8447757b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.489.0/aterm-linux-amd64"
        sha256 "cdf279f7f48f7c0823cd560f23e49fb91cc31e0d9125ba313dd805611a85f32e"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.489.0/aos-linux-arm64"
      sha256 "bd69341de290e441667b84e28b79cd75805e1af18b5935ec55cd7787cfd64696"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.489.0/aoscompose-linux-arm64"
        sha256 "bd69341de290e441667b84e28b79cd75805e1af18b5935ec55cd7787cfd64696"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.489.0/aosguard-linux-arm64"
        sha256 "0a3992887d6332c0f5c2ef5ee15eb5454b9f52223c5450fd0507b10af4c3ffeb"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.489.0/aterm-linux-arm64"
        sha256 "aceb8035f0628feed5126c8c91f9c4f974cbae48dd191420f9e3962507b6be30"
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
