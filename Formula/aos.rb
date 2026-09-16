class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.338.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aos-darwin-arm64"
      sha256 "670a0e41e45c2e00dba19ffe89042dace228d1d21425ac4fd567b0a067800fe2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aoscompose-darwin-arm64"
        sha256 "670a0e41e45c2e00dba19ffe89042dace228d1d21425ac4fd567b0a067800fe2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aosward-darwin-arm64"
        sha256 "670a0e41e45c2e00dba19ffe89042dace228d1d21425ac4fd567b0a067800fe2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aosguard-darwin-arm64"
        sha256 "8ed98ca0e9ef8fbf1b9c70048fc74dfa8e5fcfe5e5dcc8f6a4b2043455347500"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aterm-darwin-arm64"
        sha256 "95ba58a0d87652f83078f81eba3c200ae23f34e15be33cb1b2017f504aac2653"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aos-linux-amd64"
      sha256 "2aeddfc23129c81aafd26b6e2387af3c1ea4e3ec73e0ab994b6d1b7cbbb6d153"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aoscompose-linux-amd64"
        sha256 "2aeddfc23129c81aafd26b6e2387af3c1ea4e3ec73e0ab994b6d1b7cbbb6d153"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aosward-linux-amd64"
        sha256 "2aeddfc23129c81aafd26b6e2387af3c1ea4e3ec73e0ab994b6d1b7cbbb6d153"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aosguard-linux-amd64"
        sha256 "7e44e405f8fb0c3fb4587573521ffd4b0d47c48a961b36a50ad16589d1c73f16"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aterm-linux-amd64"
        sha256 "3fca1331de97d03e3aaff032672309c5b12e470e08cae1b2ff7809f1d6ed5056"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aos-linux-arm64"
      sha256 "660db7be858639ef1a8d160ec833576657265eb82badfd2734f59253901c4000"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aoscompose-linux-arm64"
        sha256 "660db7be858639ef1a8d160ec833576657265eb82badfd2734f59253901c4000"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aosward-linux-arm64"
        sha256 "660db7be858639ef1a8d160ec833576657265eb82badfd2734f59253901c4000"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aosguard-linux-arm64"
        sha256 "118ccf2fcb63f0178030b3b1a3c11fdbcbb3dab4f9358e11abbe5f3d627e88ce"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.338.0/aterm-linux-arm64"
        sha256 "f60b682a700941906698e144d624b83ffa6306798a21c26f2e830d3603b88827"
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
