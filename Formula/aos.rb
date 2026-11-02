class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.488.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.488.0/aos-darwin-arm64"
    sha256 "2d6b3ec90ee83b6dec5306100133fb5d09196fdde8333db8e454fe491f479d9d"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.488.0/aoscompose-darwin-arm64"
      sha256 "2d6b3ec90ee83b6dec5306100133fb5d09196fdde8333db8e454fe491f479d9d"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.488.0/aosguard-darwin-arm64"
      sha256 "50bcb982a5d976896d3ef0b54c68eacc4e5daa949348e4f3a505068f7079dafa"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.488.0/aterm-darwin-arm64"
      sha256 "1283b49cb9e1f15062bd12cb6565b4e6652558d05e971373e0cedf4a07156b27"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.488.0/aos-linux-amd64"
      sha256 "0ac388e38479fec5749379992c0664a0d7f2b696f0ba9679bec8c6bb5f673182"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.488.0/aoscompose-linux-amd64"
        sha256 "0ac388e38479fec5749379992c0664a0d7f2b696f0ba9679bec8c6bb5f673182"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.488.0/aosguard-linux-amd64"
        sha256 "300091571a4c3678734d500d62d65efc1a00ea0617fbbfcd5a0f3dd3a53b2aec"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.488.0/aterm-linux-amd64"
        sha256 "7474daf51a12a83e9a1eace63d5bf3ae11350c899973b543332b8eede8f91aa7"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.488.0/aos-linux-arm64"
      sha256 "7bd777bd90f726a1d56b4b03f0005fae7a74f81d0310bd1a50a083b533cbfab6"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.488.0/aoscompose-linux-arm64"
        sha256 "7bd777bd90f726a1d56b4b03f0005fae7a74f81d0310bd1a50a083b533cbfab6"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.488.0/aosguard-linux-arm64"
        sha256 "b15032481a941cf1ea48953303d42b9170fa42307c56172de707ebe644016fc8"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.488.0/aterm-linux-arm64"
        sha256 "b96e2204b1f1118d07a67fb07c39212f2fc79df2490e757dd3d667e21c5b22c0"
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
