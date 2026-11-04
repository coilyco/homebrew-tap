class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.513.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.513.0/aos-darwin-arm64"
    sha256 "22e3d985491006e2ad20ff3384a8fc48a9036f4e1392e35998c0b929daea70ed"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.513.0/aoscompose-darwin-arm64"
      sha256 "22e3d985491006e2ad20ff3384a8fc48a9036f4e1392e35998c0b929daea70ed"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.513.0/aosguard-darwin-arm64"
      sha256 "2f572fbe9ac9b711836c52ff2d4ab4915ec079bffe21f9779154f88b83d0d266"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.513.0/aterm-darwin-arm64"
      sha256 "009ad381da73eafd2ae6e14e00e94cc4401cbc70d9750805c5af5c3a83c39fd4"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.513.0/aos-linux-amd64"
      sha256 "c19f9f0a10354ccd4b0a2722b3ee755bae093c1a16c51e17b19168057b784308"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.513.0/aoscompose-linux-amd64"
        sha256 "c19f9f0a10354ccd4b0a2722b3ee755bae093c1a16c51e17b19168057b784308"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.513.0/aosguard-linux-amd64"
        sha256 "a3eb60e534ee264f561a5814d0b69173a30bc437744eac173ca6397e7070bb28"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.513.0/aterm-linux-amd64"
        sha256 "b8c6f6d2d54bebda04b93e2e0cad20b26a451c5ce6d565e47cad9c3f6178b300"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.513.0/aos-linux-arm64"
      sha256 "cb1e10e3dcc91261d3447871ba75718af8bc5f4e977bff761f8e92d21f85aaca"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.513.0/aoscompose-linux-arm64"
        sha256 "cb1e10e3dcc91261d3447871ba75718af8bc5f4e977bff761f8e92d21f85aaca"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.513.0/aosguard-linux-arm64"
        sha256 "a369f52cdddb55e3326ebca5f921366ab2edc85437737117dd8d7c2f0f83f180"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.513.0/aterm-linux-arm64"
        sha256 "8cd41e652fbe4fdcc6f3fc68712f79156526a740f3229b3c47d582363dcea211"
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
