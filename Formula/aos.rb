class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.255.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aos-darwin-arm64"
      sha256 "3f0f49533730fa04b364b0c667d17053771811a70aa9ced8369e71996ae51b41"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aoscompose-darwin-arm64"
        sha256 "3f0f49533730fa04b364b0c667d17053771811a70aa9ced8369e71996ae51b41"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aosward-darwin-arm64"
        sha256 "3f0f49533730fa04b364b0c667d17053771811a70aa9ced8369e71996ae51b41"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aosguard-darwin-arm64"
        sha256 "b62c2ddb3b78458688733695e2abb4d863e8bc2d03778332546fc2a05456f90f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aterm-darwin-arm64"
        sha256 "40120411060ae525a1889d15c280e3f2892c0014496fc79fbc95b48cd1f26794"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aos-linux-amd64"
      sha256 "8408c56575876146d9adb9178533a918af56ac87c8923c60aed24330ad5a0132"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aoscompose-linux-amd64"
        sha256 "8408c56575876146d9adb9178533a918af56ac87c8923c60aed24330ad5a0132"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aosward-linux-amd64"
        sha256 "8408c56575876146d9adb9178533a918af56ac87c8923c60aed24330ad5a0132"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aosguard-linux-amd64"
        sha256 "57fc51c8e699304a952dcc9feae3b658d3a87d35ff440f42cd7e2dbba68a0bc8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aterm-linux-amd64"
        sha256 "cbd2878af48d0e13cbdef1e6b6eeeafd202c6be3a57043e55423a40c03cacbbb"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aos-linux-arm64"
      sha256 "29b8b2f9a15487b1f8ab08d3e18a51156a9279823a3804b03edd90b31142137d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aoscompose-linux-arm64"
        sha256 "29b8b2f9a15487b1f8ab08d3e18a51156a9279823a3804b03edd90b31142137d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aosward-linux-arm64"
        sha256 "29b8b2f9a15487b1f8ab08d3e18a51156a9279823a3804b03edd90b31142137d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aosguard-linux-arm64"
        sha256 "42e5109d24876d0f2f52c63fc442e9077777a6093845b9f6bf016953ede0e920"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.255.0/aterm-linux-arm64"
        sha256 "0faeb0ac6ccc2b33782a39575b57586e967fd566b0b230afcdbf77d2adf4d66e"
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
