class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.263.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aos-darwin-arm64"
      sha256 "5f77e16aad5d57d26e8aa137f261e50eac5ecb030faa7c5a255afa605926a831"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aoscompose-darwin-arm64"
        sha256 "5f77e16aad5d57d26e8aa137f261e50eac5ecb030faa7c5a255afa605926a831"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aosward-darwin-arm64"
        sha256 "5f77e16aad5d57d26e8aa137f261e50eac5ecb030faa7c5a255afa605926a831"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aosguard-darwin-arm64"
        sha256 "cf14c408280322b16bddb3c430f6f87fd035c2d4ecad6d6dbe1af627c4220987"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aterm-darwin-arm64"
        sha256 "72d5325c4c49a9a34a30a82c97f7d2a7a3eef6a0e8b38c3b6f6f47fba3694d53"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aos-linux-amd64"
      sha256 "f3d48386e5ef0495b6fbd9e3bd58f54f9c47aa421e7fdb310b423d43ebc5d153"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aoscompose-linux-amd64"
        sha256 "f3d48386e5ef0495b6fbd9e3bd58f54f9c47aa421e7fdb310b423d43ebc5d153"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aosward-linux-amd64"
        sha256 "f3d48386e5ef0495b6fbd9e3bd58f54f9c47aa421e7fdb310b423d43ebc5d153"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aosguard-linux-amd64"
        sha256 "7c66b06bfef8836a783990ba7b0c18b74972d056679120a4f0bfb5fefe085cea"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aterm-linux-amd64"
        sha256 "f52eda367628c20663964cb512c1630bdd3f0af05aac3f1d5833af1e5be5c0af"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aos-linux-arm64"
      sha256 "8344c656c88748ead96eb3cfd6c617cb0109b187c5df0c1422081274b461b47c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aoscompose-linux-arm64"
        sha256 "8344c656c88748ead96eb3cfd6c617cb0109b187c5df0c1422081274b461b47c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aosward-linux-arm64"
        sha256 "8344c656c88748ead96eb3cfd6c617cb0109b187c5df0c1422081274b461b47c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aosguard-linux-arm64"
        sha256 "352e9b63e79733dbf4d9b668dde7586b6454a630615cadce1287627880c57d84"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.263.0/aterm-linux-arm64"
        sha256 "2c51087d49580faa4c1bc373f746559308d90b8931b31b7207369cf024b1dddf"
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
