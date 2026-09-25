class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.372.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aos-darwin-arm64"
      sha256 "bed39ad270dea5f6706171f95cf22b476d7b77e10032e964f7f5b84ae4f187c0"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aoscompose-darwin-arm64"
        sha256 "bed39ad270dea5f6706171f95cf22b476d7b77e10032e964f7f5b84ae4f187c0"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aosward-darwin-arm64"
        sha256 "bed39ad270dea5f6706171f95cf22b476d7b77e10032e964f7f5b84ae4f187c0"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aosguard-darwin-arm64"
        sha256 "f7b8063edf0272722272fb1bf45a2c819b543394110d4487c484cd55e147888a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aterm-darwin-arm64"
        sha256 "20566583a8e8111f84add96cbe8844d463fa0eb41400be3660f4375111788006"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aos-linux-amd64"
      sha256 "d0d1bf6b2aea6a5390ff61a2415ce862595066acae37c2d2e5c2256bedd951cf"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aoscompose-linux-amd64"
        sha256 "d0d1bf6b2aea6a5390ff61a2415ce862595066acae37c2d2e5c2256bedd951cf"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aosward-linux-amd64"
        sha256 "d0d1bf6b2aea6a5390ff61a2415ce862595066acae37c2d2e5c2256bedd951cf"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aosguard-linux-amd64"
        sha256 "4da451f7f8f5fe679f2dcd40abd9bc05b9522b1c714dc7bc7b111430288b6811"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aterm-linux-amd64"
        sha256 "0a9cce5b1981cc279eb1600d40a673f2484793160c52ebe43b98eeb4be3a0873"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aos-linux-arm64"
      sha256 "3abeb9248040fd8ca62a5d8eb98915630ef89ff61f828f38b5bc8da4df10bd31"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aoscompose-linux-arm64"
        sha256 "3abeb9248040fd8ca62a5d8eb98915630ef89ff61f828f38b5bc8da4df10bd31"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aosward-linux-arm64"
        sha256 "3abeb9248040fd8ca62a5d8eb98915630ef89ff61f828f38b5bc8da4df10bd31"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aosguard-linux-arm64"
        sha256 "e2a79cb097734f8cecc2ead0b0ed88af6a78f3f9a11f1bbfae515447c37b2602"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.372.0/aterm-linux-arm64"
        sha256 "42b4a5a6988aeddf5d1d4dc0ae944e448b0e62e37052e6bf33ae403602ddb162"
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
