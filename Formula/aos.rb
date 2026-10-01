class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.407.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aos-darwin-arm64"
      sha256 "9173f96c4d51ff254950ca4ecd7356ddf859e2f8f906a19a4bd9e80cfa4b386d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aoscompose-darwin-arm64"
        sha256 "9173f96c4d51ff254950ca4ecd7356ddf859e2f8f906a19a4bd9e80cfa4b386d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aosward-darwin-arm64"
        sha256 "9173f96c4d51ff254950ca4ecd7356ddf859e2f8f906a19a4bd9e80cfa4b386d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aosguard-darwin-arm64"
        sha256 "d0e1b6d4dfd390d11be9878a4ae17de9fcb94342f153957da36e703921a11e91"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aterm-darwin-arm64"
        sha256 "09b48b135a66328da60c288452d2d849fd45b4d4bce2e87c5edfb6920a2f2d57"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aos-linux-amd64"
      sha256 "eedf065c9f6728552bfd3829740c64dce808884f050636e8e39e4a21c2539497"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aoscompose-linux-amd64"
        sha256 "eedf065c9f6728552bfd3829740c64dce808884f050636e8e39e4a21c2539497"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aosward-linux-amd64"
        sha256 "eedf065c9f6728552bfd3829740c64dce808884f050636e8e39e4a21c2539497"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aosguard-linux-amd64"
        sha256 "06422430d6d5a04338282de6c88edb50fb0143c9896de5acd3b97b738141bed8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aterm-linux-amd64"
        sha256 "2a2e9bac68d7039d57d3633afffb62107fba4c13b04416804fc767badb46af52"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aos-linux-arm64"
      sha256 "ba920d68462318921712f605b48f9193b8804e45f1f7e40a4410a43df9dec60d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aoscompose-linux-arm64"
        sha256 "ba920d68462318921712f605b48f9193b8804e45f1f7e40a4410a43df9dec60d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aosward-linux-arm64"
        sha256 "ba920d68462318921712f605b48f9193b8804e45f1f7e40a4410a43df9dec60d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aosguard-linux-arm64"
        sha256 "c0648451ea72ddbe3b764c546da6bc107641483a97df789d2cd2fe19e92ffd66"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.407.0/aterm-linux-arm64"
        sha256 "0434735b4598cb5c5855d8bc2dda4cd73ae954aa1765092af9f31d50fc23042f"
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
