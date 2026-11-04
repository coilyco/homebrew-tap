class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.496.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.496.0/aos-darwin-arm64"
    sha256 "ea813a33358341bd08ef63f2d50ae92665bceb209b42e839a9b5272d90791b86"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.496.0/aoscompose-darwin-arm64"
      sha256 "ea813a33358341bd08ef63f2d50ae92665bceb209b42e839a9b5272d90791b86"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.496.0/aosguard-darwin-arm64"
      sha256 "65f482be75569b7b86d82c7fe9d445f23805269885292f3171aee2dcb74862ec"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.496.0/aterm-darwin-arm64"
      sha256 "9ecde9a685838fd9e53c7fa12a41c589da7714ee46d498ae131b226320a56759"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.496.0/aos-linux-amd64"
      sha256 "432b9e176af87bd24812add30a97ea33401091c75efb4950039d6fc06a3d436a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.496.0/aoscompose-linux-amd64"
        sha256 "432b9e176af87bd24812add30a97ea33401091c75efb4950039d6fc06a3d436a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.496.0/aosguard-linux-amd64"
        sha256 "c5ad87589d32676409f87f2dd9b260a481a70bfabe59eb60d55be7c470c4724b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.496.0/aterm-linux-amd64"
        sha256 "01cace722296ae9b3e56e96af37ef7fda3cc475d25a454246b531a0d2ad5b526"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.496.0/aos-linux-arm64"
      sha256 "44d8bcdaa709376be4d666139764a30d2ee6a774a880259378618f08c0f7321f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.496.0/aoscompose-linux-arm64"
        sha256 "44d8bcdaa709376be4d666139764a30d2ee6a774a880259378618f08c0f7321f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.496.0/aosguard-linux-arm64"
        sha256 "5efd1a67ee1a192338d0f0123e6400f7c5a7a4f1319f1e8967e642f5bd9ab553"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.496.0/aterm-linux-arm64"
        sha256 "aadd0970e4eadbd0ae6945f8b25f9ed64b60330fbb4b0d732717276ad44524d9"
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
