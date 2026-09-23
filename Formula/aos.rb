class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.354.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aos-darwin-arm64"
      sha256 "6ba852a63f09c0a5615a3418ae8d5a338f5928769310cf6fc9136633c3c155a6"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aoscompose-darwin-arm64"
        sha256 "6ba852a63f09c0a5615a3418ae8d5a338f5928769310cf6fc9136633c3c155a6"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aosward-darwin-arm64"
        sha256 "6ba852a63f09c0a5615a3418ae8d5a338f5928769310cf6fc9136633c3c155a6"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aosguard-darwin-arm64"
        sha256 "fce86edce5ec9d5e2f69f43c4781a5a601a5485e9d10e61b6032ffb4d07c9f14"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aterm-darwin-arm64"
        sha256 "50c10a80f0940e4101e366b957ef707297f27e7a3bc8b1ac0bf5a47e370fd4ce"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aos-linux-amd64"
      sha256 "565337aafbac34bb2b2da2ee5609cf241c82672bdd2d31f59cb53b38532b77b0"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aoscompose-linux-amd64"
        sha256 "565337aafbac34bb2b2da2ee5609cf241c82672bdd2d31f59cb53b38532b77b0"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aosward-linux-amd64"
        sha256 "565337aafbac34bb2b2da2ee5609cf241c82672bdd2d31f59cb53b38532b77b0"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aosguard-linux-amd64"
        sha256 "904826f9fdea553f4fd74553caa4390058a773258310ec5c4394d2c9d7768dbe"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aterm-linux-amd64"
        sha256 "6f8c56c544618f78248efed5a4af2ce6e6963d631b7c75d59dd4468062694c92"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aos-linux-arm64"
      sha256 "12e68b9a1b4ab92fe20b35c0d74c588d152adaba2287a182e747a0a85ba15c3a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aoscompose-linux-arm64"
        sha256 "12e68b9a1b4ab92fe20b35c0d74c588d152adaba2287a182e747a0a85ba15c3a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aosward-linux-arm64"
        sha256 "12e68b9a1b4ab92fe20b35c0d74c588d152adaba2287a182e747a0a85ba15c3a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aosguard-linux-arm64"
        sha256 "79a2ee9977fb87b195507347eda228e27e0459fc00a1f84e314cdcdd7030f3e8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.354.0/aterm-linux-arm64"
        sha256 "5e8db8387364340417613ea0c871b5e3456529f044eb47f91be4c917f4ac00c8"
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
