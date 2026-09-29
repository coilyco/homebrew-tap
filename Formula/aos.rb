class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.402.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aos-darwin-arm64"
      sha256 "1536e282523a0bde791f017c5a7ee20e975024919e2b1e25cbddfb1aa519be43"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aoscompose-darwin-arm64"
        sha256 "1536e282523a0bde791f017c5a7ee20e975024919e2b1e25cbddfb1aa519be43"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aosward-darwin-arm64"
        sha256 "1536e282523a0bde791f017c5a7ee20e975024919e2b1e25cbddfb1aa519be43"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aosguard-darwin-arm64"
        sha256 "416367ed7e7dc36e842ac56d1a22d4ee12105c63860d18e334106277306ebd59"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aterm-darwin-arm64"
        sha256 "94c7c32938d5491e39a69003dcdb138045e4e15855b3841e395bb4e7f36c9074"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aos-linux-amd64"
      sha256 "2169b84a22a1820ca303f46bb0616a336a290d54b9d99bfc2430372b420f899e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aoscompose-linux-amd64"
        sha256 "2169b84a22a1820ca303f46bb0616a336a290d54b9d99bfc2430372b420f899e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aosward-linux-amd64"
        sha256 "2169b84a22a1820ca303f46bb0616a336a290d54b9d99bfc2430372b420f899e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aosguard-linux-amd64"
        sha256 "4d17f2e51167c7214c06537227fbe66ccb6ca7b4917da2ca7ef9cda55563eff2"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aterm-linux-amd64"
        sha256 "b74fcafd02a71a1f642f992e69daf30faa0c80bcc60701388d8f2ace7bf97e88"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aos-linux-arm64"
      sha256 "4dfd6c374aba1aac177ec9db68c9976f171671035e02bc195fd2cffb49eadcd5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aoscompose-linux-arm64"
        sha256 "4dfd6c374aba1aac177ec9db68c9976f171671035e02bc195fd2cffb49eadcd5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aosward-linux-arm64"
        sha256 "4dfd6c374aba1aac177ec9db68c9976f171671035e02bc195fd2cffb49eadcd5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aosguard-linux-arm64"
        sha256 "54fdc78ce5b7ef973d47c46e0da4ea21f1a86c0f4da30869a3f706a2cce9aa49"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.402.0/aterm-linux-arm64"
        sha256 "55d183105b6402e5caf5f63e2dafcc6076ea033fc31a46122eca0b0ca3c81984"
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
