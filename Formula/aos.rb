class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.207.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aos-darwin-arm64"
      sha256 "d198bb1b1914ec8d37668aa33aa670ad94890d7ffb4aeb1f4f95f7d7350a6389"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aoscompose-darwin-arm64"
        sha256 "d198bb1b1914ec8d37668aa33aa670ad94890d7ffb4aeb1f4f95f7d7350a6389"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aosward-darwin-arm64"
        sha256 "d198bb1b1914ec8d37668aa33aa670ad94890d7ffb4aeb1f4f95f7d7350a6389"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aosguard-darwin-arm64"
        sha256 "dbb3c2aea43d1cfd3928f2846925e88124a52878a2fa7e0be54a00d385ed6eaf"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/agent-terminal-darwin-arm64"
        sha256 "bffb00d3d11ae32177003490c441cd52e8f99873e3eaaf1d2e888381c080c90b"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aosterm-darwin-arm64"
        sha256 "bffb00d3d11ae32177003490c441cd52e8f99873e3eaaf1d2e888381c080c90b"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aos-linux-amd64"
      sha256 "791038d86264e3a122461f5d945506aa2e3d4efc8d9fe5f44f95f02dd4f7ac64"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aoscompose-linux-amd64"
        sha256 "791038d86264e3a122461f5d945506aa2e3d4efc8d9fe5f44f95f02dd4f7ac64"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aosward-linux-amd64"
        sha256 "791038d86264e3a122461f5d945506aa2e3d4efc8d9fe5f44f95f02dd4f7ac64"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aosguard-linux-amd64"
        sha256 "7214e6113fe2154c6ab9be3239d01ec2a533f5dd27f5752a666e7b97df67db98"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/agent-terminal-linux-amd64"
        sha256 "461b07ae4f65b095bf7785c0f3037074c91f2979a84908281e4c629328d64d6a"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aosterm-linux-amd64"
        sha256 "461b07ae4f65b095bf7785c0f3037074c91f2979a84908281e4c629328d64d6a"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aos-linux-arm64"
      sha256 "8bf62f62b74d2290f14c49bee1885821800801fcbbeab88222aa6279380425b1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aoscompose-linux-arm64"
        sha256 "8bf62f62b74d2290f14c49bee1885821800801fcbbeab88222aa6279380425b1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aosward-linux-arm64"
        sha256 "8bf62f62b74d2290f14c49bee1885821800801fcbbeab88222aa6279380425b1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aosguard-linux-arm64"
        sha256 "fadae343a4eb683f97e7277bc7b6e12b1c7a957671cee927750a4f62b8ada82d"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/agent-terminal-linux-arm64"
        sha256 "373d87df069f9c3ee808751251de192bce1b013ca5010905621ec09f8c82c00f"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.207.0/aosterm-linux-arm64"
        sha256 "373d87df069f9c3ee808751251de192bce1b013ca5010905621ec09f8c82c00f"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("agent-terminal").stage { bin.install Dir["agent-terminal-*"].first => "agent-terminal" }
    resource("aosterm").stage { bin.install Dir["aosterm-*"].first => "aosterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/agent-terminal --version")
    assert_match version.to_s, shell_output("#{bin}/aosterm --version")
  end
end
