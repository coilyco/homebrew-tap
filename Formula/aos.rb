class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.403.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aos-darwin-arm64"
      sha256 "dd93914a872728c1715b7b4efd55cdd4943fae0230db17a105fb7ed5da18e9cc"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aoscompose-darwin-arm64"
        sha256 "dd93914a872728c1715b7b4efd55cdd4943fae0230db17a105fb7ed5da18e9cc"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aosward-darwin-arm64"
        sha256 "dd93914a872728c1715b7b4efd55cdd4943fae0230db17a105fb7ed5da18e9cc"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aosguard-darwin-arm64"
        sha256 "71ca8d6fa55f2f2368c70db4f4ac2e9d2c810548657eb7185b3263a74add5355"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aterm-darwin-arm64"
        sha256 "4cb0b99bedb3871e6101a72d19c2a273b5bf02b2e506b144f505656265ae6459"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aos-linux-amd64"
      sha256 "ac90ee9f42c00768852a1d7e0c3df41f75ed824e28f446ab3930df4f403213e7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aoscompose-linux-amd64"
        sha256 "ac90ee9f42c00768852a1d7e0c3df41f75ed824e28f446ab3930df4f403213e7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aosward-linux-amd64"
        sha256 "ac90ee9f42c00768852a1d7e0c3df41f75ed824e28f446ab3930df4f403213e7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aosguard-linux-amd64"
        sha256 "31943cae9fd6b830ba7a2018512e2685257b02dc83640bb3eb9e9edf756de271"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aterm-linux-amd64"
        sha256 "1d5919a2c265826b1642b0e0dbc96266f7184794538d7e555f1e0b9df70220a8"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aos-linux-arm64"
      sha256 "10cae9d246fefe590bcea20297225c763d3d25e61fe43b7c93f618621ec0187b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aoscompose-linux-arm64"
        sha256 "10cae9d246fefe590bcea20297225c763d3d25e61fe43b7c93f618621ec0187b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aosward-linux-arm64"
        sha256 "10cae9d246fefe590bcea20297225c763d3d25e61fe43b7c93f618621ec0187b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aosguard-linux-arm64"
        sha256 "1da00245736d6aebd9e3e404c8ffb60c4c1bf6ded0c6815d1929ed9fb0400f27"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.403.0/aterm-linux-arm64"
        sha256 "87377951f888a956175c6912434820d93966ed1838c58373da02937fc1a56a7b"
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
