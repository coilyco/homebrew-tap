class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.343.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aos-darwin-arm64"
      sha256 "c3a487b78b14064aa45832db4372d66f516eda8c51231df76487a4bbed0f7247"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aoscompose-darwin-arm64"
        sha256 "c3a487b78b14064aa45832db4372d66f516eda8c51231df76487a4bbed0f7247"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aosward-darwin-arm64"
        sha256 "c3a487b78b14064aa45832db4372d66f516eda8c51231df76487a4bbed0f7247"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aosguard-darwin-arm64"
        sha256 "0c2088e1ec4000b3a5298d0214ca93fe7649d8e7aa1afc39af7f89bdf8f0b671"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aterm-darwin-arm64"
        sha256 "1e26acb18dca41166e15f41e8059b0565465389253638238ffa988c0f67cd139"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aos-linux-amd64"
      sha256 "21671bd5c12f3ddd30dd16257d5799cc8451424920e1a931afc8197565d20a28"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aoscompose-linux-amd64"
        sha256 "21671bd5c12f3ddd30dd16257d5799cc8451424920e1a931afc8197565d20a28"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aosward-linux-amd64"
        sha256 "21671bd5c12f3ddd30dd16257d5799cc8451424920e1a931afc8197565d20a28"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aosguard-linux-amd64"
        sha256 "8792dc6a7cbfeb7210239decf66c8f6390ce0bc35aeddbf319e88796e3a74af9"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aterm-linux-amd64"
        sha256 "fcb0be3ac651ca46d17a6500f60e044202c6339803277f973a141378cf8ce1af"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aos-linux-arm64"
      sha256 "a46bfe006a02fcdedb6b2264f55e20dfbef4f388adc9b853383faa2fb44e67e4"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aoscompose-linux-arm64"
        sha256 "a46bfe006a02fcdedb6b2264f55e20dfbef4f388adc9b853383faa2fb44e67e4"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aosward-linux-arm64"
        sha256 "a46bfe006a02fcdedb6b2264f55e20dfbef4f388adc9b853383faa2fb44e67e4"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aosguard-linux-arm64"
        sha256 "76435949e7b536eab8f1573a505f007d174249a34474a650d50789ea90d28e37"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.343.0/aterm-linux-arm64"
        sha256 "86e0f9be2dc650a22603595d0330d705e34a8a3cac2d1a08ddb568d37b42fc0a"
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
