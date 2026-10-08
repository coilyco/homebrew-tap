class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.449.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aos-darwin-arm64"
      sha256 "5d2e6a4b519c8ddacc1c3e9e02f50c094164c49b963abb8678afa77f69edf40a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aoscompose-darwin-arm64"
        sha256 "5d2e6a4b519c8ddacc1c3e9e02f50c094164c49b963abb8678afa77f69edf40a"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aosward-darwin-arm64"
        sha256 "5d2e6a4b519c8ddacc1c3e9e02f50c094164c49b963abb8678afa77f69edf40a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aosguard-darwin-arm64"
        sha256 "0b94b430a878f377abbb8422614c072b7d8524335cebfba7b623f51b27b59abb"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aterm-darwin-arm64"
        sha256 "6ffce56a70908b8f33e9f52901cb595794653ed7960bd55e0705f03ae8e18b92"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aos-linux-amd64"
      sha256 "309153edf1d0e7232e74b7bbb2497b392cb8d3d5242236d512d3941a7da124dc"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aoscompose-linux-amd64"
        sha256 "309153edf1d0e7232e74b7bbb2497b392cb8d3d5242236d512d3941a7da124dc"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aosward-linux-amd64"
        sha256 "309153edf1d0e7232e74b7bbb2497b392cb8d3d5242236d512d3941a7da124dc"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aosguard-linux-amd64"
        sha256 "2b5816628b0980b3539cc56584895581250bd3db3f3194581976aa146c95e84d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aterm-linux-amd64"
        sha256 "2dacc92a6bb25fbe0604f2372222976be65dfcbbe95b789e5332c699a3d8b891"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aos-linux-arm64"
      sha256 "aba9c68b865341834e54e3cdd8f02b113ba21565551e2da0c98ec9a35864adca"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aoscompose-linux-arm64"
        sha256 "aba9c68b865341834e54e3cdd8f02b113ba21565551e2da0c98ec9a35864adca"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aosward-linux-arm64"
        sha256 "aba9c68b865341834e54e3cdd8f02b113ba21565551e2da0c98ec9a35864adca"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aosguard-linux-arm64"
        sha256 "779f335e9b108a7f756969c2caf7ec531571a288727176620f3e1fac357845ab"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.449.0/aterm-linux-arm64"
        sha256 "d7b1b448dbc0dfc899e9fed987128431ae227c66b1686ba17a25ff7c2c559954"
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
