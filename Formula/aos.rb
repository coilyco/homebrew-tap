class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.464.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aos-darwin-arm64"
      sha256 "3bfce4fe586039fffd01021e03630963cfb4b26e89d8b71dbf1009bdc4c077f7"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aoscompose-darwin-arm64"
        sha256 "3bfce4fe586039fffd01021e03630963cfb4b26e89d8b71dbf1009bdc4c077f7"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aosward-darwin-arm64"
        sha256 "3bfce4fe586039fffd01021e03630963cfb4b26e89d8b71dbf1009bdc4c077f7"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aosguard-darwin-arm64"
        sha256 "b976f5c1c9c1399f8f0182230c7c70c13d62b89f2e44428c548196c2cdb79b3f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aterm-darwin-arm64"
        sha256 "8919d17a8f0641a6b0e4e2e6c107ed08af7921967bc0692d968832acb393f819"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aos-linux-amd64"
      sha256 "bfcfb487bb5558960da7d3efa87efea0716eb26937a0db25b7036372d2cf1c6d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aoscompose-linux-amd64"
        sha256 "bfcfb487bb5558960da7d3efa87efea0716eb26937a0db25b7036372d2cf1c6d"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aosward-linux-amd64"
        sha256 "bfcfb487bb5558960da7d3efa87efea0716eb26937a0db25b7036372d2cf1c6d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aosguard-linux-amd64"
        sha256 "017a8f4f55e4a3be4eb762874ffdeb945522856af25493798963183092c99406"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aterm-linux-amd64"
        sha256 "666611d3e20a2a54c5650c500ec6deffb20a7502f21a3e999b4fca49742065a4"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aos-linux-arm64"
      sha256 "70939e38e9d7cb9283e1fd73b6b198b996bf4967389a2ce98d2fef1d6e5b2be7"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aoscompose-linux-arm64"
        sha256 "70939e38e9d7cb9283e1fd73b6b198b996bf4967389a2ce98d2fef1d6e5b2be7"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aosward-linux-arm64"
        sha256 "70939e38e9d7cb9283e1fd73b6b198b996bf4967389a2ce98d2fef1d6e5b2be7"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aosguard-linux-arm64"
        sha256 "f93a364b718e4d4773f8392e1efb4a6705ac100b3c06abee10479abc55165df7"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.464.0/aterm-linux-arm64"
        sha256 "eb1c1e1b2d517646b5cc5a222a553f7175ebb3ee163f19e64857ac461a2e4bb6"
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
