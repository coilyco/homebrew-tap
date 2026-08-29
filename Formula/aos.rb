class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.275.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aos-darwin-arm64"
      sha256 "b28c7b1bba138c5ecb9e58fb81022514189bc8654ad6c5bee3695663baf10da3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aoscompose-darwin-arm64"
        sha256 "b28c7b1bba138c5ecb9e58fb81022514189bc8654ad6c5bee3695663baf10da3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aosward-darwin-arm64"
        sha256 "b28c7b1bba138c5ecb9e58fb81022514189bc8654ad6c5bee3695663baf10da3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aosguard-darwin-arm64"
        sha256 "8531c7e09f5a56a528bcfa1bdd6e5b245f160bac931c0b46ead4c920f8b46be0"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aterm-darwin-arm64"
        sha256 "a3fc4e32af2df1a3479136b8b82c031eafafa45c102eba2dd9f68e78545e81d4"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aos-linux-amd64"
      sha256 "de633a3ee64137099cdeb3159637bd15d2b14d62fe91059e66124c7ff5e7dacd"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aoscompose-linux-amd64"
        sha256 "de633a3ee64137099cdeb3159637bd15d2b14d62fe91059e66124c7ff5e7dacd"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aosward-linux-amd64"
        sha256 "de633a3ee64137099cdeb3159637bd15d2b14d62fe91059e66124c7ff5e7dacd"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aosguard-linux-amd64"
        sha256 "53d2b58e7d6102435e60d1e176443ab60ab4380c1ab50c7a54556000f20a8a24"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aterm-linux-amd64"
        sha256 "69e166b65d1720afe79489e23b42ea8346770463a96352d331d8511dc343fa72"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aos-linux-arm64"
      sha256 "d4e071ce62399aba4e59a69a65cb759e97d1376801dfae9bb200cdd070839472"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aoscompose-linux-arm64"
        sha256 "d4e071ce62399aba4e59a69a65cb759e97d1376801dfae9bb200cdd070839472"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aosward-linux-arm64"
        sha256 "d4e071ce62399aba4e59a69a65cb759e97d1376801dfae9bb200cdd070839472"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aosguard-linux-arm64"
        sha256 "240883a0b1c0738b3b6b62a64a7bad86438fddf96376cb6e0a95b372f4322284"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.275.0/aterm-linux-arm64"
        sha256 "848d849ced02ecbc225d39a6335080176a2ab21345b98481b6d5cc9c790a8762"
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
