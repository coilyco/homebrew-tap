class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.510.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.510.0/aos-darwin-arm64"
    sha256 "dec5f2d43d06b86f915962290e57ee47ee51591ad087e2182a4e40c65d3f1624"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.510.0/aoscompose-darwin-arm64"
      sha256 "dec5f2d43d06b86f915962290e57ee47ee51591ad087e2182a4e40c65d3f1624"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.510.0/aosguard-darwin-arm64"
      sha256 "9a041be02417da9d3ae0b354d840253fb33f0aaf2b91454cdd09e7d3fff43867"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.510.0/aterm-darwin-arm64"
      sha256 "cdbcbfa8451de757dc898a29037126f5c3481c090603fe6cdf3b3bebfe856364"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.510.0/aos-linux-amd64"
      sha256 "64faff11f85116e1c5822af7a89a35bbc538805cf2c9cf2dc8922b23fd3a37a3"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.510.0/aoscompose-linux-amd64"
        sha256 "64faff11f85116e1c5822af7a89a35bbc538805cf2c9cf2dc8922b23fd3a37a3"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.510.0/aosguard-linux-amd64"
        sha256 "16f07da8303e500c1a47741e5c21cc74995abad955a7a12a4fd1e52757dfa5f8"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.510.0/aterm-linux-amd64"
        sha256 "1be623d978c6175affb748181804fe2d89299e50b55bd4dc2417e62053b38fbe"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.510.0/aos-linux-arm64"
      sha256 "c88df00f3116ce5cfd7004a92185730bc716f9fa71582d43b09ecd1fb5286ea8"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.510.0/aoscompose-linux-arm64"
        sha256 "c88df00f3116ce5cfd7004a92185730bc716f9fa71582d43b09ecd1fb5286ea8"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.510.0/aosguard-linux-arm64"
        sha256 "6288550acb6f00d161fbaa2e044f69a249a03fb9319fa4a8a1f29ff496c9a204"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.510.0/aterm-linux-arm64"
        sha256 "cb9efc15424f458d3781445417bc1d99f01f11455610acf99e2ac8e49b948412"
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
