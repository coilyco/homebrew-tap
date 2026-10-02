class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.411.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aos-darwin-arm64"
      sha256 "aed2a5127aa02bbf41381b63d01ff2b325d4d187ab09b15a14f869f12a3f6b0e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aoscompose-darwin-arm64"
        sha256 "aed2a5127aa02bbf41381b63d01ff2b325d4d187ab09b15a14f869f12a3f6b0e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aosward-darwin-arm64"
        sha256 "aed2a5127aa02bbf41381b63d01ff2b325d4d187ab09b15a14f869f12a3f6b0e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aosguard-darwin-arm64"
        sha256 "824f6f6825fcfabc7d5368c55e5a6ea2bfc158051bd048dcc9b7e4b42ff7501b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aterm-darwin-arm64"
        sha256 "07f60701eab70a54a848dba406bed433015c8ad0352d8b169038d05ac4bb5ad8"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aos-linux-amd64"
      sha256 "34b3e5759ab299efdd370acb04de9a43d731a219125bb421836c82f7fce32b5f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aoscompose-linux-amd64"
        sha256 "34b3e5759ab299efdd370acb04de9a43d731a219125bb421836c82f7fce32b5f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aosward-linux-amd64"
        sha256 "34b3e5759ab299efdd370acb04de9a43d731a219125bb421836c82f7fce32b5f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aosguard-linux-amd64"
        sha256 "c654c46c9d4a87e9382c1dc590bd7b9501938449d2a474a52e8031905074da82"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aterm-linux-amd64"
        sha256 "aba38a027253253cf40ceec1bd9741b158835b6b3e126776a098fc1ad15df097"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aos-linux-arm64"
      sha256 "d5b44cac688d04a4cfa8391d6c20339d230e0236972b9a042b38301d5a3f81d2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aoscompose-linux-arm64"
        sha256 "d5b44cac688d04a4cfa8391d6c20339d230e0236972b9a042b38301d5a3f81d2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aosward-linux-arm64"
        sha256 "d5b44cac688d04a4cfa8391d6c20339d230e0236972b9a042b38301d5a3f81d2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aosguard-linux-arm64"
        sha256 "1504c708f8af0baf3000f61739b49ee9296f8b02b13a8f032c2450aa2f6a90ee"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.411.0/aterm-linux-arm64"
        sha256 "61a2026ea533c1fc2fde5b7fb25bb28ac897fbf39b6d6e695d267f4b168abfdb"
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
