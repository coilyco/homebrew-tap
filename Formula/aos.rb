class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.492.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.492.0/aos-darwin-arm64"
    sha256 "9da8eec28f34fa61faa18ad690db05a10e3dd750b37f6aa7b200eee24f8a8a9a"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.492.0/aoscompose-darwin-arm64"
      sha256 "9da8eec28f34fa61faa18ad690db05a10e3dd750b37f6aa7b200eee24f8a8a9a"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.492.0/aosguard-darwin-arm64"
      sha256 "669aec9297aee50791abb54cfcd6ba73ca5d85159948d0fd819e894241af31d3"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.492.0/aterm-darwin-arm64"
      sha256 "f05948547e77a7365e6292b887610d0335b2e1d99c990c2cd735c9c25adab1e7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.492.0/aos-linux-amd64"
      sha256 "d997a90cc035ea6f52aa0067c190cf46c1d53b9d02fdfcb452dd8c572b1b40cf"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.492.0/aoscompose-linux-amd64"
        sha256 "d997a90cc035ea6f52aa0067c190cf46c1d53b9d02fdfcb452dd8c572b1b40cf"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.492.0/aosguard-linux-amd64"
        sha256 "6cc28f98b990923f58d85ec3b05e4fd6d86b0d51a56e559a706c594fe507d26f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.492.0/aterm-linux-amd64"
        sha256 "40af5571773e0fa1200d81e841adeb78ab8a8985876d9dbbfef69d195ea3bb5f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.492.0/aos-linux-arm64"
      sha256 "e2784a62e25ce9ac0859bdad96aedfc5b307a73b132c824945f940126d0a856c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.492.0/aoscompose-linux-arm64"
        sha256 "e2784a62e25ce9ac0859bdad96aedfc5b307a73b132c824945f940126d0a856c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.492.0/aosguard-linux-arm64"
        sha256 "f74fa24789b6baee1664e6758ae034658c7ad7242f8b5bf249062624523b10d9"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.492.0/aterm-linux-arm64"
        sha256 "c2e437f7fbdfb602b160f2e74b189c4d06817e6c4e5a1e5a9948521e808336b1"
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
