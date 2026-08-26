class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.244.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aos-darwin-arm64"
      sha256 "acbf549f80dc0376eb3957e4b7826a5a69dfea4cc4fe505141500a84f324cd20"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aoscompose-darwin-arm64"
        sha256 "acbf549f80dc0376eb3957e4b7826a5a69dfea4cc4fe505141500a84f324cd20"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aosward-darwin-arm64"
        sha256 "acbf549f80dc0376eb3957e4b7826a5a69dfea4cc4fe505141500a84f324cd20"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aosguard-darwin-arm64"
        sha256 "d0410a25bdaf1c6617b79251f56cd2496df344e97815365c82529680dd069046"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aterm-darwin-arm64"
        sha256 "c2b159fe67fa1d376ef8c1f229b51684c9036d7b81cad42b67d52ac20fcd2ccc"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aos-linux-amd64"
      sha256 "f9c70b82eef49ccd2d937909bfc9b08b0eb1b9303a127c1fc9cd5b42216b8748"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aoscompose-linux-amd64"
        sha256 "f9c70b82eef49ccd2d937909bfc9b08b0eb1b9303a127c1fc9cd5b42216b8748"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aosward-linux-amd64"
        sha256 "f9c70b82eef49ccd2d937909bfc9b08b0eb1b9303a127c1fc9cd5b42216b8748"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aosguard-linux-amd64"
        sha256 "79545bbfb2a9fa732b694f9d4c4a5dc95fbdcd90dced97d94d42f2b0174107ec"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aterm-linux-amd64"
        sha256 "31d2f22fb15df378af5c3df681d990326468a6132f899019eb6a4b9d243595cb"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aos-linux-arm64"
      sha256 "b2332d3137ee429b796cd715b75f92f6590f07d8641cc0904f43c63cb49e0c4e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aoscompose-linux-arm64"
        sha256 "b2332d3137ee429b796cd715b75f92f6590f07d8641cc0904f43c63cb49e0c4e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aosward-linux-arm64"
        sha256 "b2332d3137ee429b796cd715b75f92f6590f07d8641cc0904f43c63cb49e0c4e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aosguard-linux-arm64"
        sha256 "c7b0a1b926df8f59c4fdf698157992919620a9638d6b3853a1e94e432cc4dbef"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.244.0/aterm-linux-arm64"
        sha256 "3f86719c2a67804f089df5643c5b06701a25320157db663a13b7507b2ea4bf19"
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
