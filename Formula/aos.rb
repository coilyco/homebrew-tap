class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.400.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aos-darwin-arm64"
      sha256 "f570a81c6469646e7f030db5263ef673a61e88f3388e6b57a41f553ff6330966"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aoscompose-darwin-arm64"
        sha256 "f570a81c6469646e7f030db5263ef673a61e88f3388e6b57a41f553ff6330966"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aosward-darwin-arm64"
        sha256 "f570a81c6469646e7f030db5263ef673a61e88f3388e6b57a41f553ff6330966"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aosguard-darwin-arm64"
        sha256 "8700e5289fe9ef01b18b0a3de499918ce969eac9e572411870b7943cb129ab00"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aterm-darwin-arm64"
        sha256 "b1164d322ec4104d3cad741fbc03230c65a9e5498f342dd73f434030d5fb5ba7"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aos-linux-amd64"
      sha256 "394afa08e84ab872d9b8f071363aa635c30f5a868635bb7d0839b1e32375895c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aoscompose-linux-amd64"
        sha256 "394afa08e84ab872d9b8f071363aa635c30f5a868635bb7d0839b1e32375895c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aosward-linux-amd64"
        sha256 "394afa08e84ab872d9b8f071363aa635c30f5a868635bb7d0839b1e32375895c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aosguard-linux-amd64"
        sha256 "cdd2ee9076791f9efe7c20ea4fd9927f8f0d3d513f81e0ccd24072f6d1b5f8db"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aterm-linux-amd64"
        sha256 "84a5cd5416bfd47defc04c55c70e2c368afa92a79bc6c066a8e1c9acfdd767dd"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aos-linux-arm64"
      sha256 "cf72aeffd40c5e44f84eb7092d65b0b6965bc06ae0aef595b9f0710cfe26b8ca"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aoscompose-linux-arm64"
        sha256 "cf72aeffd40c5e44f84eb7092d65b0b6965bc06ae0aef595b9f0710cfe26b8ca"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aosward-linux-arm64"
        sha256 "cf72aeffd40c5e44f84eb7092d65b0b6965bc06ae0aef595b9f0710cfe26b8ca"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aosguard-linux-arm64"
        sha256 "0b352f783e106bd13220faa89db0a2171dd644f7abf1ee124148acbaf750cc2e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.400.0/aterm-linux-arm64"
        sha256 "45ac215676e3199a2586e776fa44ac10d62b06a95f03c3566ece26427ac6175f"
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
