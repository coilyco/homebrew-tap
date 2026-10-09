class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.460.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aos-darwin-arm64"
      sha256 "b5e5423838b7fe5d9ff03a77b71c4ada3dcf5e0347c33c4dc659d550a61df521"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aoscompose-darwin-arm64"
        sha256 "b5e5423838b7fe5d9ff03a77b71c4ada3dcf5e0347c33c4dc659d550a61df521"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aosward-darwin-arm64"
        sha256 "b5e5423838b7fe5d9ff03a77b71c4ada3dcf5e0347c33c4dc659d550a61df521"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aosguard-darwin-arm64"
        sha256 "925050347f1f9c69c15ca3ecd1aba213192e65ca0e0cabf3cb56382ec3b6ad8b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aterm-darwin-arm64"
        sha256 "690096164a6d11d8e21e1a30eef3d5ada009e5118a7ce5c0b677d9482743b9d2"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aos-linux-amd64"
      sha256 "1695f299962cd86402e6e1d9deb3baf491304d17eea238437caf864ecd01adae"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aoscompose-linux-amd64"
        sha256 "1695f299962cd86402e6e1d9deb3baf491304d17eea238437caf864ecd01adae"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aosward-linux-amd64"
        sha256 "1695f299962cd86402e6e1d9deb3baf491304d17eea238437caf864ecd01adae"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aosguard-linux-amd64"
        sha256 "747e9dfb8a59539952004909f7ae761dc5969f85e2595b3c83ccb1804826917f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aterm-linux-amd64"
        sha256 "723196de25d571a16f0b14cb81b6cf88b40aadde837798c3da07ce276a05418c"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aos-linux-arm64"
      sha256 "9984829facdfb4715ba7cad533249399dd477d150786d275ad17ac058aac0afb"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aoscompose-linux-arm64"
        sha256 "9984829facdfb4715ba7cad533249399dd477d150786d275ad17ac058aac0afb"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aosward-linux-arm64"
        sha256 "9984829facdfb4715ba7cad533249399dd477d150786d275ad17ac058aac0afb"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aosguard-linux-arm64"
        sha256 "81e2b456f235b2b20ace3fd70d482207c77209bb67a0893c786f8b0872d50a26"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.460.0/aterm-linux-arm64"
        sha256 "9426813c058c74c6dfe9a7d984b6123429bba31e32febd55c458af956901f831"
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
