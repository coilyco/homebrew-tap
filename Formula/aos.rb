class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.377.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aos-darwin-arm64"
      sha256 "c1b15bba89f5aed8bfa13348d71250fa797b68eb003b25898c8372ec0a5e24b8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aoscompose-darwin-arm64"
        sha256 "c1b15bba89f5aed8bfa13348d71250fa797b68eb003b25898c8372ec0a5e24b8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aosward-darwin-arm64"
        sha256 "c1b15bba89f5aed8bfa13348d71250fa797b68eb003b25898c8372ec0a5e24b8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aosguard-darwin-arm64"
        sha256 "12db573a633f0f07e410a42f3fd0569b50c8ca6dde7c85bf496a0ea884a1aaa3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aterm-darwin-arm64"
        sha256 "03a0ea1dc24851f7c7c053a76ee03c7ad4ed350fa6b51d86bb0b9a9e1cb0014f"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aos-linux-amd64"
      sha256 "3286a39f6399480e41896b6f223a87d194f0b17c3b59a06c1010d697c647f0cc"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aoscompose-linux-amd64"
        sha256 "3286a39f6399480e41896b6f223a87d194f0b17c3b59a06c1010d697c647f0cc"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aosward-linux-amd64"
        sha256 "3286a39f6399480e41896b6f223a87d194f0b17c3b59a06c1010d697c647f0cc"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aosguard-linux-amd64"
        sha256 "a7a38dee9a60b9293b70678ec6cbb71a014b3ec059378508712c4bf5425b7c5c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aterm-linux-amd64"
        sha256 "480e786fefda624ded44aa3910ec7243bfb0bce631cf3b279dae3aeaba955d3f"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aos-linux-arm64"
      sha256 "5460b757f8514d68c41c8a6c826f7c66f7afaac830ea3d28f6b4fb4724267dd3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aoscompose-linux-arm64"
        sha256 "5460b757f8514d68c41c8a6c826f7c66f7afaac830ea3d28f6b4fb4724267dd3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aosward-linux-arm64"
        sha256 "5460b757f8514d68c41c8a6c826f7c66f7afaac830ea3d28f6b4fb4724267dd3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aosguard-linux-arm64"
        sha256 "a302ba026535b879e1e6d29acb39b23060e8ce78ae21ff6d2cfc14791bcb4d47"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.377.0/aterm-linux-arm64"
        sha256 "530f898502d2aa739bb54843c5ac26d90e7e937e43f15361cff1fda20973f66e"
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
