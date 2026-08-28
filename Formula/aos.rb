class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.262.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aos-darwin-arm64"
      sha256 "0d5917df76f4dd4d4b6bcace6c86e84c03f9dc32112b6a1546a503bad2033a90"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aoscompose-darwin-arm64"
        sha256 "0d5917df76f4dd4d4b6bcace6c86e84c03f9dc32112b6a1546a503bad2033a90"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aosward-darwin-arm64"
        sha256 "0d5917df76f4dd4d4b6bcace6c86e84c03f9dc32112b6a1546a503bad2033a90"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aosguard-darwin-arm64"
        sha256 "7cf59ab7de6d2ff9fab8d2dbb9e12707e50e984b2300cf5ca3a026966535c574"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aterm-darwin-arm64"
        sha256 "7ffbd06d865959953828e715817e204335892bfbb8eb550a6c289f0ce1c21b42"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aos-linux-amd64"
      sha256 "010b26f599c02098644fdf5930b64ccf925df91a7533508d993ff785cb092265"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aoscompose-linux-amd64"
        sha256 "010b26f599c02098644fdf5930b64ccf925df91a7533508d993ff785cb092265"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aosward-linux-amd64"
        sha256 "010b26f599c02098644fdf5930b64ccf925df91a7533508d993ff785cb092265"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aosguard-linux-amd64"
        sha256 "52bd5f3d8c2b6beb3dbc25d7fc085b3da336853530d9de5b322bfbeae74ebfe3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aterm-linux-amd64"
        sha256 "61eef0e68629222af2d5c314b28b588d081d16a721610f911d1bab9760f459df"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aos-linux-arm64"
      sha256 "5149e4d157ef435068f070941c114881605baa0ee7668722a39649ef756e3427"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aoscompose-linux-arm64"
        sha256 "5149e4d157ef435068f070941c114881605baa0ee7668722a39649ef756e3427"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aosward-linux-arm64"
        sha256 "5149e4d157ef435068f070941c114881605baa0ee7668722a39649ef756e3427"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aosguard-linux-arm64"
        sha256 "2f0794857b99a064a868683527f9c2c1fbb05942b5bc8e91b26a6bce5ab5c39b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.262.0/aterm-linux-arm64"
        sha256 "8a913d2063ad156c8f03f3dec03b774d43043f0b0e972f205f0ae267d3c0434c"
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
