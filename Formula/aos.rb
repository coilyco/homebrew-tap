class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.432.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aos-darwin-arm64"
      sha256 "99e102d62468938554f9f7f4e23099a49167325cfd42e8e279392da812d6deba"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aoscompose-darwin-arm64"
        sha256 "99e102d62468938554f9f7f4e23099a49167325cfd42e8e279392da812d6deba"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aosward-darwin-arm64"
        sha256 "99e102d62468938554f9f7f4e23099a49167325cfd42e8e279392da812d6deba"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aosguard-darwin-arm64"
        sha256 "406d6a6171d92a69bb34e5c2ad6ab93aa0acf1000ccf451d5bb1916f95506e2a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aterm-darwin-arm64"
        sha256 "85d045c755a8a878236d73dca991ab8ade17644e8047c772898bd3711bb737e5"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aos-linux-amd64"
      sha256 "e4e013cb0dedfbcda55f48954ae1b791b47c8af6082ad5691013ac7d0979570e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aoscompose-linux-amd64"
        sha256 "e4e013cb0dedfbcda55f48954ae1b791b47c8af6082ad5691013ac7d0979570e"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aosward-linux-amd64"
        sha256 "e4e013cb0dedfbcda55f48954ae1b791b47c8af6082ad5691013ac7d0979570e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aosguard-linux-amd64"
        sha256 "8f6cce7e4810145fbdc3f5135cecd724f3ff321cb3d13d08c1bde850594c1432"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aterm-linux-amd64"
        sha256 "fa7c963093c983d472685e3cd5ef451b15f4bdf73ee27691e6ef0070de2caf90"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aos-linux-arm64"
      sha256 "80d66125cc6b006f064acfe4ac28427e5cd1c5af29f7cc9728fd7c2e8010fa3e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aoscompose-linux-arm64"
        sha256 "80d66125cc6b006f064acfe4ac28427e5cd1c5af29f7cc9728fd7c2e8010fa3e"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aosward-linux-arm64"
        sha256 "80d66125cc6b006f064acfe4ac28427e5cd1c5af29f7cc9728fd7c2e8010fa3e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aosguard-linux-arm64"
        sha256 "d981ac4b6b83136c776be9482e0d7d739bec8a7c5ce54523d9ef82917d6622e5"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.432.0/aterm-linux-arm64"
        sha256 "198667c7e6029caba026576c2e6aed631cc36d426770eec66b397d5e50f7f18c"
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
