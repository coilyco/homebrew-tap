class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.409.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aos-darwin-arm64"
      sha256 "f4c05f8bd0e2b6cabf009a0b128b771ab3a73f2d5bf32f03fe20661fc1647153"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aoscompose-darwin-arm64"
        sha256 "f4c05f8bd0e2b6cabf009a0b128b771ab3a73f2d5bf32f03fe20661fc1647153"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aosward-darwin-arm64"
        sha256 "f4c05f8bd0e2b6cabf009a0b128b771ab3a73f2d5bf32f03fe20661fc1647153"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aosguard-darwin-arm64"
        sha256 "908a9388224b564b9ebae5df3963230c3212794552794913bfd83188ec650f24"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aterm-darwin-arm64"
        sha256 "cc696fa58cc8a1dc287cd02a4196cb6e01964d09d7b6fe13a09a8f76c73cc36d"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aos-linux-amd64"
      sha256 "10bb3bed7e0f5e7abeb69f97550b2d4316d37df5c3fffa6c6a4ce8d03a50d504"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aoscompose-linux-amd64"
        sha256 "10bb3bed7e0f5e7abeb69f97550b2d4316d37df5c3fffa6c6a4ce8d03a50d504"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aosward-linux-amd64"
        sha256 "10bb3bed7e0f5e7abeb69f97550b2d4316d37df5c3fffa6c6a4ce8d03a50d504"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aosguard-linux-amd64"
        sha256 "c764a9ea4358f01840163dd6f26d6c06791a0e5f4abe0517f4f6ef51f16b1df4"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aterm-linux-amd64"
        sha256 "dd59aaa99fe3f9e19f565c0bc40b20befa7da13d45269464659cd96a2ca2e3ec"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aos-linux-arm64"
      sha256 "004520137636c70185063917f35f61541562e47041e44b51a6efcf57470eb156"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aoscompose-linux-arm64"
        sha256 "004520137636c70185063917f35f61541562e47041e44b51a6efcf57470eb156"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aosward-linux-arm64"
        sha256 "004520137636c70185063917f35f61541562e47041e44b51a6efcf57470eb156"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aosguard-linux-arm64"
        sha256 "42c413f4185f565a4cd514158c1d8606bd9765406311515016a93b71260606ff"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.409.0/aterm-linux-arm64"
        sha256 "ff412ec8126121ae0e006eb3d50744b0d9f69594c0bae70804466de7c6e255bd"
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
