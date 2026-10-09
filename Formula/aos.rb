class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.463.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aos-darwin-arm64"
      sha256 "a0682c8ca67092e950a166699f5067db32b681c86f4bfeac7ecddf2493302b1e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aoscompose-darwin-arm64"
        sha256 "a0682c8ca67092e950a166699f5067db32b681c86f4bfeac7ecddf2493302b1e"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aosward-darwin-arm64"
        sha256 "a0682c8ca67092e950a166699f5067db32b681c86f4bfeac7ecddf2493302b1e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aosguard-darwin-arm64"
        sha256 "bbddfb419398f0471dbe9c100c40239449045d83904b2542505d8109ee109fb1"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aterm-darwin-arm64"
        sha256 "cee1438f9780c70c7690a951c0ee4e496dcac174a85244da2eb6b293a0aacc2e"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aos-linux-amd64"
      sha256 "4e166d816c91bd5a6ded945e4d865ffb3f303fdf5fb0798d5fda14b6c6587c6e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aoscompose-linux-amd64"
        sha256 "4e166d816c91bd5a6ded945e4d865ffb3f303fdf5fb0798d5fda14b6c6587c6e"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aosward-linux-amd64"
        sha256 "4e166d816c91bd5a6ded945e4d865ffb3f303fdf5fb0798d5fda14b6c6587c6e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aosguard-linux-amd64"
        sha256 "a39e3568abee91f5b028687980033017d7fc33b628e4271327c28111ba50a488"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aterm-linux-amd64"
        sha256 "932f0ac1cc08ef4ab51a23f5558b7f820dd92ee4e03997682c2e82be2f1b3ece"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aos-linux-arm64"
      sha256 "b9e75fda0150c60ec7245efc951345365c92f88434625cb2115ff1e83f7925c1"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aoscompose-linux-arm64"
        sha256 "b9e75fda0150c60ec7245efc951345365c92f88434625cb2115ff1e83f7925c1"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aosward-linux-arm64"
        sha256 "b9e75fda0150c60ec7245efc951345365c92f88434625cb2115ff1e83f7925c1"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aosguard-linux-arm64"
        sha256 "27517ef04f760b36ba0308c4ef81dcae7b1ac5a83ef0df96718973982254554a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.463.0/aterm-linux-arm64"
        sha256 "2b229d1479a577040a705aa297044deeefe3a0e155391e83093015cc94823eab"
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
