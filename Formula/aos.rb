class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.494.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.494.0/aos-darwin-arm64"
    sha256 "3fbd0e1dc10ea9eea0966175e3a5c4bbd753ee68fa2f38405a6b999d2200cffa"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.494.0/aoscompose-darwin-arm64"
      sha256 "3fbd0e1dc10ea9eea0966175e3a5c4bbd753ee68fa2f38405a6b999d2200cffa"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.494.0/aosguard-darwin-arm64"
      sha256 "1e209deaba7e87f31d3f4e14cb610e42c5613dd0d8d254037a49ac9462c27cda"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.494.0/aterm-darwin-arm64"
      sha256 "421dd688fc2281530196fe1e164f3d2acf4b201ad47cd8eef12d8a802d0d9841"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.494.0/aos-linux-amd64"
      sha256 "1f67edc5c114432cb4ca0d7114e7b8e6b905392dcf9a0789d2dda83b2c74935f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.494.0/aoscompose-linux-amd64"
        sha256 "1f67edc5c114432cb4ca0d7114e7b8e6b905392dcf9a0789d2dda83b2c74935f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.494.0/aosguard-linux-amd64"
        sha256 "95d220106b756ac247006a41c0cf79ed77c406ee098a8ddd2dc59d33e8396556"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.494.0/aterm-linux-amd64"
        sha256 "7963cf4fbc5fb54de0a63a4f2ce0ab1e240678acdb7a506d5628a2b11f72cc15"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.494.0/aos-linux-arm64"
      sha256 "18dddb873fbb4054c23544b765d66b562671fc3e4fef354fa6609c78be0061ae"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.494.0/aoscompose-linux-arm64"
        sha256 "18dddb873fbb4054c23544b765d66b562671fc3e4fef354fa6609c78be0061ae"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.494.0/aosguard-linux-arm64"
        sha256 "05464437042f0e08ee2255b82dfa35020df5860525b948acd1ab6604e0b06a36"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.494.0/aterm-linux-arm64"
        sha256 "eedf9587b859b829b2c2209a0e3084a5e364a1fb56d65d06dcf5aaf4f17ba14c"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
