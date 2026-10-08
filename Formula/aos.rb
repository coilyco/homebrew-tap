class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.447.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aos-darwin-arm64"
      sha256 "945d174fd70eb6ac20485f22392609aaa6715e40c68ed99713d0ce5ff92062f4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aoscompose-darwin-arm64"
        sha256 "945d174fd70eb6ac20485f22392609aaa6715e40c68ed99713d0ce5ff92062f4"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aosward-darwin-arm64"
        sha256 "945d174fd70eb6ac20485f22392609aaa6715e40c68ed99713d0ce5ff92062f4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aosguard-darwin-arm64"
        sha256 "1e0b931a0614ac35458dd0d269fe630ff2d10aec08c1204a342fdaef2377ae06"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aterm-darwin-arm64"
        sha256 "71b03cb65ed7923bb5be6863cba1429f1bf846a379caecf5fac40cbca4d93965"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aos-linux-amd64"
      sha256 "b49d030d268b16e881fe95d2f3725ec786327e5ea91577163741d144cc58249e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aoscompose-linux-amd64"
        sha256 "b49d030d268b16e881fe95d2f3725ec786327e5ea91577163741d144cc58249e"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aosward-linux-amd64"
        sha256 "b49d030d268b16e881fe95d2f3725ec786327e5ea91577163741d144cc58249e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aosguard-linux-amd64"
        sha256 "f3612352f18c148a70e36df07d5ff37179e395a332d645236f189f9d6aa23211"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aterm-linux-amd64"
        sha256 "cd05407c4fa47f729677836799f12c5f0da2ba8ccf9bf22db1e5ecddada2f637"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aos-linux-arm64"
      sha256 "02fdd1ecfe7992c99263cb82ffee19c43c5da2008deb08f52b635cf68cfd1d67"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aoscompose-linux-arm64"
        sha256 "02fdd1ecfe7992c99263cb82ffee19c43c5da2008deb08f52b635cf68cfd1d67"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aosward-linux-arm64"
        sha256 "02fdd1ecfe7992c99263cb82ffee19c43c5da2008deb08f52b635cf68cfd1d67"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aosguard-linux-arm64"
        sha256 "08ba707ca5dbca0dd75e1282c55a432824cb8088eaef27dd6aad9f131a915edb"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.447.0/aterm-linux-arm64"
        sha256 "9f5b36321f4066353c272d4ecb22fa5140ddec27b5940fb75092aefc4ccb9bf1"
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
