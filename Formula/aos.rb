class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.265.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aos-darwin-arm64"
      sha256 "10393a0589d7550165e0e6ee90f47915fb61330f8c4b9f1a76b8983a48b2929f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aoscompose-darwin-arm64"
        sha256 "10393a0589d7550165e0e6ee90f47915fb61330f8c4b9f1a76b8983a48b2929f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aosward-darwin-arm64"
        sha256 "10393a0589d7550165e0e6ee90f47915fb61330f8c4b9f1a76b8983a48b2929f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aosguard-darwin-arm64"
        sha256 "27fd6d48ee3283ca37bba1f3411445af1f90042a9996bf79ac38bedd2898f410"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aterm-darwin-arm64"
        sha256 "faf3d1929bc0d95bc059a0bd482ce2be976cb7f06796e567cd480826aa879ddf"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aos-linux-amd64"
      sha256 "bba3ce9cff3a9857851495e40392427dd74454f1c62610ed261c25b205b1c570"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aoscompose-linux-amd64"
        sha256 "bba3ce9cff3a9857851495e40392427dd74454f1c62610ed261c25b205b1c570"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aosward-linux-amd64"
        sha256 "bba3ce9cff3a9857851495e40392427dd74454f1c62610ed261c25b205b1c570"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aosguard-linux-amd64"
        sha256 "1351ac4e2428c660c56afd61c519e87ce429281b414dfb858120b30bd368e5d8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aterm-linux-amd64"
        sha256 "ea622f973eb7e81103adf9609ac710f454b9bba0b74bf79f491d51bbdd5150a9"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aos-linux-arm64"
      sha256 "f78770266649b5d40a7f8c08eb6827f5adf6be1cef1e6ed8bb18c43824368d5c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aoscompose-linux-arm64"
        sha256 "f78770266649b5d40a7f8c08eb6827f5adf6be1cef1e6ed8bb18c43824368d5c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aosward-linux-arm64"
        sha256 "f78770266649b5d40a7f8c08eb6827f5adf6be1cef1e6ed8bb18c43824368d5c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aosguard-linux-arm64"
        sha256 "77040100251f3b708af5f6a74e7af0ccb116353a8f9f4eaa79ff198a3734f06d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.265.0/aterm-linux-arm64"
        sha256 "21f23d5df4c5640037ef4b2bb3a9c1e4ab518b64b729c455bd0fb4caf5dc2977"
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
