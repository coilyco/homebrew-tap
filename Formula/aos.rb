class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.166.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/aos-darwin-arm64"
      sha256 "9d75a55819bddd1ef505ed4fd76c4ddc9b5016cb5962081eae1895967ed1db27"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/aoscompose-darwin-arm64"
        sha256 "9d75a55819bddd1ef505ed4fd76c4ddc9b5016cb5962081eae1895967ed1db27"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/aosward-darwin-arm64"
        sha256 "9d75a55819bddd1ef505ed4fd76c4ddc9b5016cb5962081eae1895967ed1db27"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/aosguard-darwin-arm64"
        sha256 "f4b0ecafa6bbee8ef3432e9b1bdc52efe895f11b0c04a9967db7859cc8fb95e9"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/agent-terminal-darwin-arm64"
        sha256 "cb142a66c81fb73315469c37e273e7413f337d50b4fd8017cd26b8fc61be8b1a"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/aos-linux-amd64"
      sha256 "3e0500c837a79c7c3c304e6e1572dee65871f0098967eecaebcfb411ef447772"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/aoscompose-linux-amd64"
        sha256 "3e0500c837a79c7c3c304e6e1572dee65871f0098967eecaebcfb411ef447772"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/aosward-linux-amd64"
        sha256 "3e0500c837a79c7c3c304e6e1572dee65871f0098967eecaebcfb411ef447772"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/aosguard-linux-amd64"
        sha256 "d7e87189e583c7856607ab16471b55684ada43361905b69f279434a60790569a"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/agent-terminal-linux-amd64"
        sha256 "725be97ed634fcd0fda34cb7d311a46d0873cbc496d801a4e7fb56456a08e4cf"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/aos-linux-arm64"
      sha256 "e1b652e064438d8a8dcdf5f264ec46d2bda79b7bfed5a6c6b81b9db7605b0a47"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/aoscompose-linux-arm64"
        sha256 "e1b652e064438d8a8dcdf5f264ec46d2bda79b7bfed5a6c6b81b9db7605b0a47"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/aosward-linux-arm64"
        sha256 "e1b652e064438d8a8dcdf5f264ec46d2bda79b7bfed5a6c6b81b9db7605b0a47"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/aosguard-linux-arm64"
        sha256 "bdbc84f590673e3042a6328ed8eaf98ec56f6aad247a8977b24c9673d73e5230"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.166.0/agent-terminal-linux-arm64"
        sha256 "63d27fbc967094bd506f593e3c30ed3c00a39e7658ff7ea71491983c7853a8c0"
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
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/agent-terminal --version")
  end
end
