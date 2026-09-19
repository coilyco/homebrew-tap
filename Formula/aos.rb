class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.341.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aos-darwin-arm64"
      sha256 "281d525db64b0f639a0f3d68a9caf5579ae50c732a26da8388161a0b5bfbaa0d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aoscompose-darwin-arm64"
        sha256 "281d525db64b0f639a0f3d68a9caf5579ae50c732a26da8388161a0b5bfbaa0d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aosward-darwin-arm64"
        sha256 "281d525db64b0f639a0f3d68a9caf5579ae50c732a26da8388161a0b5bfbaa0d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aosguard-darwin-arm64"
        sha256 "7a976ab44acedee8e11cca84124786fac4b981a7514f6ea3d4d28defd7ef96fd"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aterm-darwin-arm64"
        sha256 "fa98da423293f5572162f3ff2542ebf969502bde85d3d81aa20c6e5fd0262d58"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aos-linux-amd64"
      sha256 "0bee610361bd620db4598e8bacdd71a21887fab826c7fe2bb5fa983c70610227"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aoscompose-linux-amd64"
        sha256 "0bee610361bd620db4598e8bacdd71a21887fab826c7fe2bb5fa983c70610227"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aosward-linux-amd64"
        sha256 "0bee610361bd620db4598e8bacdd71a21887fab826c7fe2bb5fa983c70610227"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aosguard-linux-amd64"
        sha256 "632a8f8c5a0c3e347b9cee0cab94bd2eb819693353c9028a80cd6bf2260b93ca"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aterm-linux-amd64"
        sha256 "b1ce70f0fc0fd92457eb0ddc4dc5fa9ab31f0dfe651a09d9b64f3d705eb4455b"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aos-linux-arm64"
      sha256 "37d496d74c47a44ad578d368e51ac5cc5ad521fa0cc39dcb89bbd9f0820b4209"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aoscompose-linux-arm64"
        sha256 "37d496d74c47a44ad578d368e51ac5cc5ad521fa0cc39dcb89bbd9f0820b4209"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aosward-linux-arm64"
        sha256 "37d496d74c47a44ad578d368e51ac5cc5ad521fa0cc39dcb89bbd9f0820b4209"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aosguard-linux-arm64"
        sha256 "3e95f3c8141f760e8716e8e37d6c08ee2e2a6afa92e1b897b58492449212bc21"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.341.0/aterm-linux-arm64"
        sha256 "a5b075ab4206a2d41a7bd6b4b47fdc894c1587887c578a22bd290b8c34db31ab"
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
