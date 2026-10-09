class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.459.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aos-darwin-arm64"
      sha256 "3970ac410181bb4a6c076884e18574717f20eb7b6194bc6221b4524abaf794d4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aoscompose-darwin-arm64"
        sha256 "3970ac410181bb4a6c076884e18574717f20eb7b6194bc6221b4524abaf794d4"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aosward-darwin-arm64"
        sha256 "3970ac410181bb4a6c076884e18574717f20eb7b6194bc6221b4524abaf794d4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aosguard-darwin-arm64"
        sha256 "1ab7756855a79873b371b90d1b649f252673053f141502198e3010184179622d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aterm-darwin-arm64"
        sha256 "5d6de4effdfbd36eaf7a5a7e6ec65694864f7cc03e1f6494fe095e8197cbd74f"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aos-linux-amd64"
      sha256 "60f52e077f75ae36a842d9baf7b044a82da3d105861119e23089688f70fb36a1"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aoscompose-linux-amd64"
        sha256 "60f52e077f75ae36a842d9baf7b044a82da3d105861119e23089688f70fb36a1"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aosward-linux-amd64"
        sha256 "60f52e077f75ae36a842d9baf7b044a82da3d105861119e23089688f70fb36a1"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aosguard-linux-amd64"
        sha256 "8ce84a7b645466462c7a115b3b1005fce3d381b2218da19163bd8ca6baf883d4"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aterm-linux-amd64"
        sha256 "9b7fb1a5c41f1dad40b1bd9d2764be7b1e97cfa9a2fd829212a7a529e683ac8e"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aos-linux-arm64"
      sha256 "07f02723bd7f5748678edb2bc31873b2566d7060bdd847359d78a98cd6b28de3"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aoscompose-linux-arm64"
        sha256 "07f02723bd7f5748678edb2bc31873b2566d7060bdd847359d78a98cd6b28de3"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aosward-linux-arm64"
        sha256 "07f02723bd7f5748678edb2bc31873b2566d7060bdd847359d78a98cd6b28de3"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aosguard-linux-arm64"
        sha256 "42ddb830b40b2cb6e712e5d6d1020c2b015aba793622c8d9ae14335413a8862a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.459.0/aterm-linux-arm64"
        sha256 "51159c35fc7f55f387d603d67ab494cdbc95292ecc990bcd8f81c664de876b36"
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
