class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.471.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aos-darwin-arm64"
      sha256 "368c9851d2969194378501a894853158c5e7117c1f860bd8e290663150d9899b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aoscompose-darwin-arm64"
        sha256 "368c9851d2969194378501a894853158c5e7117c1f860bd8e290663150d9899b"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aosward-darwin-arm64"
        sha256 "368c9851d2969194378501a894853158c5e7117c1f860bd8e290663150d9899b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aosguard-darwin-arm64"
        sha256 "66ddbd11bf1d323a8c232a8fe52ac0e3bb19e2f6154e577ff54b86a8297e4668"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aterm-darwin-arm64"
        sha256 "8e3af654991b117494d30b41d634058c84f89ba48cfc6e7e33df5c725ba67f00"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aos-linux-amd64"
      sha256 "c42a06dc1606ab2f183324695992ca7bd6a12e99e8017f373c179b85ac1957a9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aoscompose-linux-amd64"
        sha256 "c42a06dc1606ab2f183324695992ca7bd6a12e99e8017f373c179b85ac1957a9"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aosward-linux-amd64"
        sha256 "c42a06dc1606ab2f183324695992ca7bd6a12e99e8017f373c179b85ac1957a9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aosguard-linux-amd64"
        sha256 "8e0f6a0bb6e1729184cf06c541937435e33e08857b3b9bf5f52e98951e35fc1b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aterm-linux-amd64"
        sha256 "e51efd7a2237fd27f0959be98b2e2767d05fca798e586c06fa9b65914921d6eb"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aos-linux-arm64"
      sha256 "853a7e7f3e22cbe9521ea7b6949897a8c1984c73680cf36db50c774f4905a160"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aoscompose-linux-arm64"
        sha256 "853a7e7f3e22cbe9521ea7b6949897a8c1984c73680cf36db50c774f4905a160"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aosward-linux-arm64"
        sha256 "853a7e7f3e22cbe9521ea7b6949897a8c1984c73680cf36db50c774f4905a160"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aosguard-linux-arm64"
        sha256 "f8d1dccb6a0d8dbe386d6fca5ba7380bf475aaeee4cf6cecf2a5072ff8ef3987"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.471.0/aterm-linux-arm64"
        sha256 "a5e0af58e2a7e19dd54df3ae32e6a3342843b1571bc78fb00d14a5a6cf625924"
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
