class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.395.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aos-darwin-arm64"
      sha256 "94ca53fa85f8e37fab0aaa9d65c8b48c715cecd9b8f9513df928b86bd9d6624b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aoscompose-darwin-arm64"
        sha256 "94ca53fa85f8e37fab0aaa9d65c8b48c715cecd9b8f9513df928b86bd9d6624b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aosward-darwin-arm64"
        sha256 "94ca53fa85f8e37fab0aaa9d65c8b48c715cecd9b8f9513df928b86bd9d6624b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aosguard-darwin-arm64"
        sha256 "a29f0655cf8baf6763c09c3f81c686d9e69a0faef8cc5ed326a9236c63dae86b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aterm-darwin-arm64"
        sha256 "5d85ffa533cf9f9d0366d587ed4bc3f5bd1253a460a8b20b46d7325a733fe616"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aos-linux-amd64"
      sha256 "352f811d9de6b771f8fed24ecfeb71f9675ff53018663625fa1c3b8181feb431"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aoscompose-linux-amd64"
        sha256 "352f811d9de6b771f8fed24ecfeb71f9675ff53018663625fa1c3b8181feb431"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aosward-linux-amd64"
        sha256 "352f811d9de6b771f8fed24ecfeb71f9675ff53018663625fa1c3b8181feb431"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aosguard-linux-amd64"
        sha256 "0e405a54e94be6b9646280fc90636a8ad5b8a352338edc7ab0c17d879c2eaa5f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aterm-linux-amd64"
        sha256 "b8f644ca8cd519d484a2a943d1e42992f84d04667d5e70b14aa83b6983eb2412"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aos-linux-arm64"
      sha256 "148d1918fc4e2d876c0f1e744531b5085f9c72abc705e8c19182bd8c0001441d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aoscompose-linux-arm64"
        sha256 "148d1918fc4e2d876c0f1e744531b5085f9c72abc705e8c19182bd8c0001441d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aosward-linux-arm64"
        sha256 "148d1918fc4e2d876c0f1e744531b5085f9c72abc705e8c19182bd8c0001441d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aosguard-linux-arm64"
        sha256 "358c195367cc8b932ca43585e12b8108fdd8697f6f2a041b9e54ecfb12c5fe20"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.395.0/aterm-linux-arm64"
        sha256 "2b7a13610e0f12bdd5c92a5434e6033345e14b869a49e912c19eb2b328ff4947"
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
