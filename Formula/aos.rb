class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.474.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.474.0/aos-darwin-arm64"
      sha256 "bca811e6fec7120edec31c6c82b131214dcdfaa0a1c0edd73cf3f82e9551d004"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.474.0/aoscompose-darwin-arm64"
        sha256 "bca811e6fec7120edec31c6c82b131214dcdfaa0a1c0edd73cf3f82e9551d004"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.474.0/aosguard-darwin-arm64"
        sha256 "b30ecc45072ac91c8d8ce38960430bd2d83918b09331f55d451a54ee044e89f1"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.474.0/aterm-darwin-arm64"
        sha256 "17d39d65ae459eefbd3627d040db8093b92a4a8b540d35c6ba0e7e025904435b"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.474.0/aos-linux-amd64"
      sha256 "d1a187c95378fed31e262be072759f6bb19ad483d82e17bf9f822c6962b673d6"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.474.0/aoscompose-linux-amd64"
        sha256 "d1a187c95378fed31e262be072759f6bb19ad483d82e17bf9f822c6962b673d6"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.474.0/aosguard-linux-amd64"
        sha256 "198761a8d650ec6aad8515a9dcb5f339d47111e17f31cec321215dbe0f903ec0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.474.0/aterm-linux-amd64"
        sha256 "40a5a063d5da794fdd2757570f86238de3e6baab857cebc473db658d587ee01f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.474.0/aos-linux-arm64"
      sha256 "b8fc47ebbe20d1757433e223582d7a58c7e0c30bf2d8b72aa0af819fb2fdb678"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.474.0/aoscompose-linux-arm64"
        sha256 "b8fc47ebbe20d1757433e223582d7a58c7e0c30bf2d8b72aa0af819fb2fdb678"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.474.0/aosguard-linux-arm64"
        sha256 "d50f12c3e178a65950cf5af437944d04540b64a899b9efb64ebe06dd1f1d63e6"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.474.0/aterm-linux-arm64"
        sha256 "4aa57f7f5439a6f1758d37b90e7bede0a2a6b68236fb9638a8845c33880f55bf"
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
