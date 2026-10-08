class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.452.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aos-darwin-arm64"
      sha256 "2964fda1fc45020653c1f8f120d9e4dac38592750e8d96d5861ab5937be62379"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aoscompose-darwin-arm64"
        sha256 "2964fda1fc45020653c1f8f120d9e4dac38592750e8d96d5861ab5937be62379"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aosward-darwin-arm64"
        sha256 "2964fda1fc45020653c1f8f120d9e4dac38592750e8d96d5861ab5937be62379"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aosguard-darwin-arm64"
        sha256 "65ec8d0c98e7756f3bcee7258d92d899fbd66c55a86e472ca99fa408312b455a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aterm-darwin-arm64"
        sha256 "d48e4521b5d943a6421b2006de13d0d6f8670efbc95132bc9c861e1b96ca2140"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aos-linux-amd64"
      sha256 "cc996bffe90933657aa028547d2a90782184fb1f771bfb315e3cf5871364be19"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aoscompose-linux-amd64"
        sha256 "cc996bffe90933657aa028547d2a90782184fb1f771bfb315e3cf5871364be19"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aosward-linux-amd64"
        sha256 "cc996bffe90933657aa028547d2a90782184fb1f771bfb315e3cf5871364be19"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aosguard-linux-amd64"
        sha256 "6a9692309e29dc5d1ee56861258b673c9351eae74962201d79c37cf6f976c6c4"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aterm-linux-amd64"
        sha256 "ee1ff1382d0c3ce002b1106b69d86cc77ec2c7cdc2f85a4ebfa930943b87aea9"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aos-linux-arm64"
      sha256 "f081e6681ae8252d50d41e1c2f2337258456e62bdc78321ab9e090dd958ee462"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aoscompose-linux-arm64"
        sha256 "f081e6681ae8252d50d41e1c2f2337258456e62bdc78321ab9e090dd958ee462"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aosward-linux-arm64"
        sha256 "f081e6681ae8252d50d41e1c2f2337258456e62bdc78321ab9e090dd958ee462"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aosguard-linux-arm64"
        sha256 "39ff7540f6e74b00bb7dca9d6df617ba313b988d20aafbe8e6bc928a0fd496d6"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.452.0/aterm-linux-arm64"
        sha256 "62ab32442d909d586a8fbf6ab43e7ffccc9d6f4e1f163b3d4727da09cba32704"
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
