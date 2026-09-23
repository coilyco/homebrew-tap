class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.355.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aos-darwin-arm64"
      sha256 "44aa43d20efa302669f5c206a947ceb7ef3e9dc82d5315985f82255412cac01c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aoscompose-darwin-arm64"
        sha256 "44aa43d20efa302669f5c206a947ceb7ef3e9dc82d5315985f82255412cac01c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aosward-darwin-arm64"
        sha256 "44aa43d20efa302669f5c206a947ceb7ef3e9dc82d5315985f82255412cac01c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aosguard-darwin-arm64"
        sha256 "c0da080800bbec5ed1c76fad40d87e6715d4b5702e8e7764a37d02ac3cfef323"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aterm-darwin-arm64"
        sha256 "6eee3586d7cc4db62d237bb6a7e9da7175ddeed15f04f9bcbe75bf83b68a1ad9"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aos-linux-amd64"
      sha256 "9ed29c1f4a5923448a03c2a6b568cac29c7e6f63a1ac54789391d9fa738b8648"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aoscompose-linux-amd64"
        sha256 "9ed29c1f4a5923448a03c2a6b568cac29c7e6f63a1ac54789391d9fa738b8648"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aosward-linux-amd64"
        sha256 "9ed29c1f4a5923448a03c2a6b568cac29c7e6f63a1ac54789391d9fa738b8648"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aosguard-linux-amd64"
        sha256 "54d27fdaae7c7eade7c8352baec7c093d55a3af95ecd4fa3fb10925b1028a047"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aterm-linux-amd64"
        sha256 "5eb4989fa378e6637288cbb0459358524ea05d09630bb4065960fd123e01f5d6"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aos-linux-arm64"
      sha256 "556427c68ea88aa303486a024a32a8e50d8f9514d87faf9971f8eff1eb7ae08b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aoscompose-linux-arm64"
        sha256 "556427c68ea88aa303486a024a32a8e50d8f9514d87faf9971f8eff1eb7ae08b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aosward-linux-arm64"
        sha256 "556427c68ea88aa303486a024a32a8e50d8f9514d87faf9971f8eff1eb7ae08b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aosguard-linux-arm64"
        sha256 "a2bb8bdd6e148ec2bd8e151d99b48fe43d39ed18145e60f3d26420ebbe92f6ba"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.355.0/aterm-linux-arm64"
        sha256 "e95fe6a7350891d42f751295d5c6bdda8eb984d484f889016bd0a3df94ae1cb9"
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
