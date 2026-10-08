class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.445.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aos-darwin-arm64"
      sha256 "f33fb0a90397923c2ae7ad4bd0318ce2572d46e0aaab2ba2d4bb1558eb3c3ee7"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aoscompose-darwin-arm64"
        sha256 "f33fb0a90397923c2ae7ad4bd0318ce2572d46e0aaab2ba2d4bb1558eb3c3ee7"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aosward-darwin-arm64"
        sha256 "f33fb0a90397923c2ae7ad4bd0318ce2572d46e0aaab2ba2d4bb1558eb3c3ee7"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aosguard-darwin-arm64"
        sha256 "15a2a5f8a6368f10e758b7887f30e5a49238c76263610fbddeb528df8881b9ab"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aterm-darwin-arm64"
        sha256 "f0fffbc7fd5393759d9dccb93a51029ed082fc449d8db6951f19a44e8d50e1dd"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aos-linux-amd64"
      sha256 "dded4806e9df090ce4c135b156976a7bb6e1ec0c16e8bd3e5bcbe60526b54c9d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aoscompose-linux-amd64"
        sha256 "dded4806e9df090ce4c135b156976a7bb6e1ec0c16e8bd3e5bcbe60526b54c9d"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aosward-linux-amd64"
        sha256 "dded4806e9df090ce4c135b156976a7bb6e1ec0c16e8bd3e5bcbe60526b54c9d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aosguard-linux-amd64"
        sha256 "81410be3f6162d2e9186089465c4cf43dd3880d59e0db41adc6b1a1920eac370"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aterm-linux-amd64"
        sha256 "a017fe7fce0e4f952822800f11cd782437e90ab47b93afd6b52bd01a26e01f79"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aos-linux-arm64"
      sha256 "7b9d1bcf8dc4cf78569b10b7dbaf4bd4d1b339be5c759cc5647e4d18b2573fb3"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aoscompose-linux-arm64"
        sha256 "7b9d1bcf8dc4cf78569b10b7dbaf4bd4d1b339be5c759cc5647e4d18b2573fb3"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aosward-linux-arm64"
        sha256 "7b9d1bcf8dc4cf78569b10b7dbaf4bd4d1b339be5c759cc5647e4d18b2573fb3"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aosguard-linux-arm64"
        sha256 "3b70e4a4526768f2547b41f1f6c60214248ba8d7b7757f6a9d42b22b2be5aaff"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.445.0/aterm-linux-arm64"
        sha256 "321194e316e7b28ac8b54b4444c14bac57d9ac7e05610f3bbca1d6ee28e126e4"
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
