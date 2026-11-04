class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.500.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.500.0/aos-darwin-arm64"
    sha256 "5e9e518462c440b1d526146bcd75e6b0bcfb7b6ae377dc00befd18023a066ad3"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.500.0/aoscompose-darwin-arm64"
      sha256 "5e9e518462c440b1d526146bcd75e6b0bcfb7b6ae377dc00befd18023a066ad3"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.500.0/aosguard-darwin-arm64"
      sha256 "5f2fd2563d3b67e7637ed96fc38a07942aacb6ff7a23cda6f918e587c99b686f"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.500.0/aterm-darwin-arm64"
      sha256 "7aad0013496d1da0cb3fa51821f0e5b391922521aba154ed666cc8e89c2c736b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.500.0/aos-linux-amd64"
      sha256 "5dcf684b4fc1b9b8592ffea83a955ce96355f91172d36d9a9a3b056c60c5de87"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.500.0/aoscompose-linux-amd64"
        sha256 "5dcf684b4fc1b9b8592ffea83a955ce96355f91172d36d9a9a3b056c60c5de87"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.500.0/aosguard-linux-amd64"
        sha256 "03e0cb8d28de577d661ec4ef756e06a2da00afb696650f2ac4048ab3c5359c38"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.500.0/aterm-linux-amd64"
        sha256 "72c2c6872d78e837a9d7abecf9ab5acd89899aee8d69a690044809eb8a71a264"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.500.0/aos-linux-arm64"
      sha256 "a0bba3f662b4218d3b397fff5a8ff1294a8fd9053af4b97a9d459c2606e00840"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.500.0/aoscompose-linux-arm64"
        sha256 "a0bba3f662b4218d3b397fff5a8ff1294a8fd9053af4b97a9d459c2606e00840"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.500.0/aosguard-linux-arm64"
        sha256 "f3cdec0477fa5c9514811c3db80b6e003c61772a0a971a66d45f5a26c22459bc"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.500.0/aterm-linux-arm64"
        sha256 "144b03d8d6425062d0634f1f1b8312dfa06ac54678a7ae725945c9c4ea8082d7"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
