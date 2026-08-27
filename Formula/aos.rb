class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.249.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aos-darwin-arm64"
      sha256 "8bdc3d08d0ce7bdcedc7deaef6970559739e339f07fdd1634d3bc60fb0ccebfb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aoscompose-darwin-arm64"
        sha256 "8bdc3d08d0ce7bdcedc7deaef6970559739e339f07fdd1634d3bc60fb0ccebfb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aosward-darwin-arm64"
        sha256 "8bdc3d08d0ce7bdcedc7deaef6970559739e339f07fdd1634d3bc60fb0ccebfb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aosguard-darwin-arm64"
        sha256 "5632074edb4fb8ee4f1dd7a99601e48734a991050921fe20fc5dc718db243c1c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aterm-darwin-arm64"
        sha256 "3a1daac85ac0c971977f9e5219f8568f08f5ee33df508aff3bf58945954f68ab"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aos-linux-amd64"
      sha256 "04addeaa9b4ddc1e13bdac27b545c4b043bb8cf9cf92c6bd92914a6e9ad44695"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aoscompose-linux-amd64"
        sha256 "04addeaa9b4ddc1e13bdac27b545c4b043bb8cf9cf92c6bd92914a6e9ad44695"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aosward-linux-amd64"
        sha256 "04addeaa9b4ddc1e13bdac27b545c4b043bb8cf9cf92c6bd92914a6e9ad44695"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aosguard-linux-amd64"
        sha256 "f4762512723b95cf47b340cc79d3e140a0631649abb9067a5ce3b43e38c20389"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aterm-linux-amd64"
        sha256 "d7c03052e40c4ac99da927e8900cd310122a9727a3db661854a4fa6b5a4d877a"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aos-linux-arm64"
      sha256 "b2925d516c267d7e58c7f3418eb3e4920a7c394fd3b33d706ff16271fce4df20"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aoscompose-linux-arm64"
        sha256 "b2925d516c267d7e58c7f3418eb3e4920a7c394fd3b33d706ff16271fce4df20"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aosward-linux-arm64"
        sha256 "b2925d516c267d7e58c7f3418eb3e4920a7c394fd3b33d706ff16271fce4df20"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aosguard-linux-arm64"
        sha256 "9be4da33a9818f9d6965c34890a2502b0aaf8a066bf8a761b86caee81a444133"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.249.0/aterm-linux-arm64"
        sha256 "c543ad1ef9920d4f0d2d23a541d66e8490f27c0ecf8b715f6b9dc9f0ea9a71b5"
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
