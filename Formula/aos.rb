class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.622.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.622.0/aos-darwin-arm64"
    sha256 "a7f8222e6de3d71709e331f36ee4f535b4c334766f3dde7898ed07ca081f5b47"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.622.0/aoscompose-darwin-arm64"
      sha256 "a7f8222e6de3d71709e331f36ee4f535b4c334766f3dde7898ed07ca081f5b47"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.622.0/aosguard-darwin-arm64"
      sha256 "f49adde9566f85c05b0a0748bbb52ad417b74f1fa744feffdd81452c8181c3ac"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.622.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "f54ce8a4e0955fc0ff482c0867ba08ce16af9f25eb74adb3a2b5578d30a450ce"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.622.0/aos-linux-amd64"
      sha256 "500eb9db8beae12a5205c1755efae8cb440de9f5486cf3e8f057b680db102cb4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.622.0/aoscompose-linux-amd64"
        sha256 "500eb9db8beae12a5205c1755efae8cb440de9f5486cf3e8f057b680db102cb4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.622.0/aosguard-linux-amd64"
        sha256 "a1d499016c85c6a69ab59a5fdb63f2c800caf4635fc43d9dd209f98e5ae31650"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.622.0/aterm-linux-amd64"
        sha256 "3e3dec4dcce5216a55883a6c48058014b3d7e8defb9841b68b27bb437320b9ba"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.622.0/aos-linux-arm64"
      sha256 "25e247d6d2835f934043c19973b24afefc584ae2987b8ae2cb49a2b689a04467"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.622.0/aoscompose-linux-arm64"
        sha256 "25e247d6d2835f934043c19973b24afefc584ae2987b8ae2cb49a2b689a04467"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.622.0/aosguard-linux-arm64"
        sha256 "2106c2ff5537cfdee463ad37260334874b05157be1c35a37851556c5d818e18b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.622.0/aterm-linux-arm64"
        sha256 "54bac0778bf2d45ebd2ec2c5a1596f862fd2c1f58ebc606526df08443a90b21f"
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
