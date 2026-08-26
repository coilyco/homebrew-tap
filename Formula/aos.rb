class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.229.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aos-darwin-arm64"
      sha256 "fd2159733fb3cfbfcbe08d3304f1632a7aa7e7b3992d25517d31bd854fc95131"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aoscompose-darwin-arm64"
        sha256 "fd2159733fb3cfbfcbe08d3304f1632a7aa7e7b3992d25517d31bd854fc95131"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aosward-darwin-arm64"
        sha256 "fd2159733fb3cfbfcbe08d3304f1632a7aa7e7b3992d25517d31bd854fc95131"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aosguard-darwin-arm64"
        sha256 "9d848f1549e8d05d4b201f5b184f1912c4c7697c575a959a4200602444b7f74e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aterm-darwin-arm64"
        sha256 "8d491a909e293500d6d21bbdd7d901e29f9df73165c44029d5d3b834ca745533"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aos-linux-amd64"
      sha256 "b76b36a6eb932151343f6c5a58351419507a6078139f3f7d34bf893ca3cf9a21"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aoscompose-linux-amd64"
        sha256 "b76b36a6eb932151343f6c5a58351419507a6078139f3f7d34bf893ca3cf9a21"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aosward-linux-amd64"
        sha256 "b76b36a6eb932151343f6c5a58351419507a6078139f3f7d34bf893ca3cf9a21"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aosguard-linux-amd64"
        sha256 "df40440fe595934ba08c7810d9f5e0c19c1dd02de1d03948c4508f202c8a08bf"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aterm-linux-amd64"
        sha256 "5e645ae12573dd63fa74b592ba8b2a8df2641db1e78ded7e6ccbbf6cf57b70bf"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aos-linux-arm64"
      sha256 "cf1c2fc4176133a02075b8916789cd3e9392a35318fca046dd45dac6c9316c12"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aoscompose-linux-arm64"
        sha256 "cf1c2fc4176133a02075b8916789cd3e9392a35318fca046dd45dac6c9316c12"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aosward-linux-arm64"
        sha256 "cf1c2fc4176133a02075b8916789cd3e9392a35318fca046dd45dac6c9316c12"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aosguard-linux-arm64"
        sha256 "0af020607b89d5b5c849bc85426069f21cb557822b18bcc42d287630d12a1a7f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.229.0/aterm-linux-arm64"
        sha256 "b92be47411a8453daeb7eef007805514e134cbbb9640119021d1f99f1b19795a"
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
