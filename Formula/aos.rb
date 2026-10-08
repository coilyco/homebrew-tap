class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.451.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aos-darwin-arm64"
      sha256 "b14aa54e25b45e5ffafdef8eb64c319aaaf65d34f5ff467a6f514144f962fce5"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aoscompose-darwin-arm64"
        sha256 "b14aa54e25b45e5ffafdef8eb64c319aaaf65d34f5ff467a6f514144f962fce5"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aosward-darwin-arm64"
        sha256 "b14aa54e25b45e5ffafdef8eb64c319aaaf65d34f5ff467a6f514144f962fce5"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aosguard-darwin-arm64"
        sha256 "33842527a94e00c4ca254f5aca44f1e1dfbc01c2ca6f99eb7b843bf6160328f2"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aterm-darwin-arm64"
        sha256 "5abe9add88df60b1ae2a021303dc197e4215a4f58546254f56a16976061cd80d"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aos-linux-amd64"
      sha256 "62eebff11a5923b27a0b45ed72b635184b63e98d1e77de9ebf1bafeb9086acbe"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aoscompose-linux-amd64"
        sha256 "62eebff11a5923b27a0b45ed72b635184b63e98d1e77de9ebf1bafeb9086acbe"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aosward-linux-amd64"
        sha256 "62eebff11a5923b27a0b45ed72b635184b63e98d1e77de9ebf1bafeb9086acbe"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aosguard-linux-amd64"
        sha256 "7827557ba3b05c46ffdedbcb313303164d066d287645658409da34a862710422"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aterm-linux-amd64"
        sha256 "7f468a433a6726723cc6d0772b13dda98d52520bef1c2b256336dca89a224e31"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aos-linux-arm64"
      sha256 "bd42ff18b0834a4fdd0fab4339e91113a4934bc230c1ab1db563eb83abd720b0"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aoscompose-linux-arm64"
        sha256 "bd42ff18b0834a4fdd0fab4339e91113a4934bc230c1ab1db563eb83abd720b0"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aosward-linux-arm64"
        sha256 "bd42ff18b0834a4fdd0fab4339e91113a4934bc230c1ab1db563eb83abd720b0"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aosguard-linux-arm64"
        sha256 "48c249f616cc6c91602f826ff5e08f35410cbd48961c17e719e832bdaa899846"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.451.0/aterm-linux-arm64"
        sha256 "bcc6c4f8139ba04070a631a2f80d4bed2dee5288d492ce758fb46b223cd44a5e"
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
