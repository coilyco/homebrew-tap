class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.237.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aos-darwin-arm64"
      sha256 "4afaa687558f2289d5f29eec64c173bb11dc632c8187cd3d548e274c7bc0d91c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aoscompose-darwin-arm64"
        sha256 "4afaa687558f2289d5f29eec64c173bb11dc632c8187cd3d548e274c7bc0d91c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aosward-darwin-arm64"
        sha256 "4afaa687558f2289d5f29eec64c173bb11dc632c8187cd3d548e274c7bc0d91c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aosguard-darwin-arm64"
        sha256 "a10b56a9e67d8a78ad9a9444819d8f157e66dcfc78ddfa96946e5dd49c280ebe"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aterm-darwin-arm64"
        sha256 "03eecac60882c3d8ec1c0e9a74137e65c9b34f84aa24b07164daca48c8336015"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aos-linux-amd64"
      sha256 "87400b718c90f3fcd8ef6a32970275f1fd4e41d746ef29859319ce8d8121d296"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aoscompose-linux-amd64"
        sha256 "87400b718c90f3fcd8ef6a32970275f1fd4e41d746ef29859319ce8d8121d296"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aosward-linux-amd64"
        sha256 "87400b718c90f3fcd8ef6a32970275f1fd4e41d746ef29859319ce8d8121d296"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aosguard-linux-amd64"
        sha256 "6f6e31aa344af2e194d32196674643e86ca3ec70d51eb3312aa977d743add444"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aterm-linux-amd64"
        sha256 "d3ad8ceba51b226a19a7baa02e370182fa341cced491fc3881af707dc056f8e0"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aos-linux-arm64"
      sha256 "4b5787f3f0428fe8e152e95e571e790968e4ca980c06a469f909850da5cf0443"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aoscompose-linux-arm64"
        sha256 "4b5787f3f0428fe8e152e95e571e790968e4ca980c06a469f909850da5cf0443"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aosward-linux-arm64"
        sha256 "4b5787f3f0428fe8e152e95e571e790968e4ca980c06a469f909850da5cf0443"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aosguard-linux-arm64"
        sha256 "4c794a380b2c7337e5f515746f5be8c1897b796f08a89adbde7371749f4a9352"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.237.0/aterm-linux-arm64"
        sha256 "7696e07ec1fb9c52be93b13ba8ad030a9b8b51828ef02257e3a105382423e6a0"
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
