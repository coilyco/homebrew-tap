class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.358.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aos-darwin-arm64"
      sha256 "e3b09af7b0b9d3dce1b5ebbda0584ed0d9a3992347d5e11a85a9fb14ba21aa7d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aoscompose-darwin-arm64"
        sha256 "e3b09af7b0b9d3dce1b5ebbda0584ed0d9a3992347d5e11a85a9fb14ba21aa7d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aosward-darwin-arm64"
        sha256 "e3b09af7b0b9d3dce1b5ebbda0584ed0d9a3992347d5e11a85a9fb14ba21aa7d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aosguard-darwin-arm64"
        sha256 "e5db6a25390b3d07c0e887d36971c8a456b37e355756194110202f6b43a2d308"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aterm-darwin-arm64"
        sha256 "923dbc4a25ce4eb6ae0d58e5cd9e902081437182ab2963fd8643cba3f61b75e4"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aos-linux-amd64"
      sha256 "aaf160843c240c757ce8cccb589e6439bc6b2b067c88a5639ec793106376af8c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aoscompose-linux-amd64"
        sha256 "aaf160843c240c757ce8cccb589e6439bc6b2b067c88a5639ec793106376af8c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aosward-linux-amd64"
        sha256 "aaf160843c240c757ce8cccb589e6439bc6b2b067c88a5639ec793106376af8c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aosguard-linux-amd64"
        sha256 "d60830b98c211c191477d66301851d603b6a37964cb9579c661bcebf85cfb4ea"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aterm-linux-amd64"
        sha256 "a20e59b385d388d03e4da27fade0158b97aaeabb10567b8f83917ccf17c6e264"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aos-linux-arm64"
      sha256 "ac22ef807ac0d1755460c170eaa7388ed35a63e5b5f66a9ef1403602ba36c7aa"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aoscompose-linux-arm64"
        sha256 "ac22ef807ac0d1755460c170eaa7388ed35a63e5b5f66a9ef1403602ba36c7aa"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aosward-linux-arm64"
        sha256 "ac22ef807ac0d1755460c170eaa7388ed35a63e5b5f66a9ef1403602ba36c7aa"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aosguard-linux-arm64"
        sha256 "5cc12c7ce9f0f5553302d8e5b0454e9457d76fee9620f34dbeea344b27c5bdc4"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.358.0/aterm-linux-arm64"
        sha256 "8ecfa1e6f3a1e10a7749074eb606ddecafe4b94e8bc2f219cac78b7bae5d2f07"
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
