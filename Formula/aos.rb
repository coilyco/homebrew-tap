class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.567.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.567.0/aos-darwin-arm64"
    sha256 "8ff467c78e1ae912cc73c3c967ec5caeab5ab1356857a880d9ed94cc376d5ec2"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.567.0/aoscompose-darwin-arm64"
      sha256 "8ff467c78e1ae912cc73c3c967ec5caeab5ab1356857a880d9ed94cc376d5ec2"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.567.0/aosguard-darwin-arm64"
      sha256 "1a8743e106b96464d9de054b47df681a76a729000c2b82542e3de1ba7a70eab6"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.567.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "7fa03a7617902c7002818638213e303841beb3c39623dcd6ff33b3a87c72a6ca"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.567.0/aos-linux-amd64"
      sha256 "8111ade82255aa9514b4f1d5ff2bf70364814b70adc6873dde46b72b37c7a828"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.567.0/aoscompose-linux-amd64"
        sha256 "8111ade82255aa9514b4f1d5ff2bf70364814b70adc6873dde46b72b37c7a828"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.567.0/aosguard-linux-amd64"
        sha256 "4b66a1c86558d87cd8a38e1f46ce3f434e48b3b90d335e46251a9344c8e7a555"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.567.0/aterm-linux-amd64"
        sha256 "bf63c5d3ff24aaef10edfec48552caf2f470db416d577a6eee4e9693c3923efa"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.567.0/aos-linux-arm64"
      sha256 "e904b84feb921e2f9272d1c295143010d5260205e65e850f0d1e1203502c784c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.567.0/aoscompose-linux-arm64"
        sha256 "e904b84feb921e2f9272d1c295143010d5260205e65e850f0d1e1203502c784c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.567.0/aosguard-linux-arm64"
        sha256 "91aacab754254938db2ec23ab13f5a8247ff81e0ccee0c848d90d6c8b04244aa"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.567.0/aterm-linux-arm64"
        sha256 "e29441352c90aca26106883029e3b2108c406423f97070fd4b46cd8fefec41e9"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    # macOS installs the signed bundle, whole (:nounzip) because a stage would
    # step into it, and links bin/aterm to its executable. See docs/aos-cli.md.
    if OS.mac?
      resource("aterm").stage do
        system "tar", "-xzf", Dir["*.tar.gz"].first, "-C", prefix
      end
      bin.install_symlink prefix/"Treehouse.app/Contents/MacOS/aterm"
    else
      resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
