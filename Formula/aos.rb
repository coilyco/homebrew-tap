class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.504.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.504.0/aos-darwin-arm64"
    sha256 "f339f1c9def34d17bbf5bc8030419cedfd07eaeb405fa73de09bc19eb529fa0a"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.504.0/aoscompose-darwin-arm64"
      sha256 "f339f1c9def34d17bbf5bc8030419cedfd07eaeb405fa73de09bc19eb529fa0a"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.504.0/aosguard-darwin-arm64"
      sha256 "f1b00e8a2811d605d8bf6d0625877f73edada67174ae6aedcdb138dc1a2d5df2"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.504.0/aterm-darwin-arm64"
      sha256 "c12424b77a111a5a8192528f55b2187e1665c3c72941adf75ffd5b39c50c9571"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.504.0/aos-linux-amd64"
      sha256 "4d2460bf196ca87df1d93d9eda88438f5168e5754d51f419eec0b041fb06a6c5"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.504.0/aoscompose-linux-amd64"
        sha256 "4d2460bf196ca87df1d93d9eda88438f5168e5754d51f419eec0b041fb06a6c5"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.504.0/aosguard-linux-amd64"
        sha256 "b16668436d4c068e20a02fee1ba21a64aede8077c855dce96d67717eb38146dc"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.504.0/aterm-linux-amd64"
        sha256 "99bd217df85cb494ae9471e6c47944e5b29edf219dd4c3942fdb2f5252d5575c"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.504.0/aos-linux-arm64"
      sha256 "88b3932fc156a10388762a451dac1ee3544fe9f54f8c3d9aca728aca3c3875a9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.504.0/aoscompose-linux-arm64"
        sha256 "88b3932fc156a10388762a451dac1ee3544fe9f54f8c3d9aca728aca3c3875a9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.504.0/aosguard-linux-arm64"
        sha256 "60f9b94972c99946904f80de4d456936c81b22f8534a8ceaa950479468f9093a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.504.0/aterm-linux-arm64"
        sha256 "d0b3e8e91e9f6e9a0e6274a89c8c855bf88305e3101e02f8cd07e41597bc9172"
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
