class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.458.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aos-darwin-arm64"
      sha256 "cbffdd03bed045109a0fd741bee9b9ee42421b47a373263cddcb7cb0c52f107b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aoscompose-darwin-arm64"
        sha256 "cbffdd03bed045109a0fd741bee9b9ee42421b47a373263cddcb7cb0c52f107b"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aosward-darwin-arm64"
        sha256 "cbffdd03bed045109a0fd741bee9b9ee42421b47a373263cddcb7cb0c52f107b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aosguard-darwin-arm64"
        sha256 "595fb16afcaf6382c9045fc26647caa232238621314b6c3e8952dbef4fea1163"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aterm-darwin-arm64"
        sha256 "bfdf654631dabc0e11d100e837bca874a514949668fca380899d94aefc34f036"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aos-linux-amd64"
      sha256 "418d87fd41051bf28842ad308916ff0de222b31217304ed9a5632d7bb4a2600f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aoscompose-linux-amd64"
        sha256 "418d87fd41051bf28842ad308916ff0de222b31217304ed9a5632d7bb4a2600f"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aosward-linux-amd64"
        sha256 "418d87fd41051bf28842ad308916ff0de222b31217304ed9a5632d7bb4a2600f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aosguard-linux-amd64"
        sha256 "ca679a87f72d692ac2236c5d25ce6943d9e4b9dda84254c152e470ecde59f697"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aterm-linux-amd64"
        sha256 "75418395c72ccc16e4e1388972e5956dfa9297e5f35fafaa7b6a6fe6ca7d93bb"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aos-linux-arm64"
      sha256 "53ff2a6380b4f3a3b6d3f856754a5ad440a4ff8aa2576963298358a3b180d546"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aoscompose-linux-arm64"
        sha256 "53ff2a6380b4f3a3b6d3f856754a5ad440a4ff8aa2576963298358a3b180d546"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aosward-linux-arm64"
        sha256 "53ff2a6380b4f3a3b6d3f856754a5ad440a4ff8aa2576963298358a3b180d546"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aosguard-linux-arm64"
        sha256 "10078f4c00e378a70d2b6c796fff1c6a57f53790d3a52cecb6fe48eb87a066d2"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.458.0/aterm-linux-arm64"
        sha256 "5d3aa661613449849ca9d4dcdf3a3fad4186b587244941eb52fe8269ee97b294"
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
