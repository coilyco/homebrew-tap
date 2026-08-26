class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.236.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aos-darwin-arm64"
      sha256 "2bfb2c47ceb5d618336e374da83c1d70de7e52f4fd427190eca27e12e3e7152e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aoscompose-darwin-arm64"
        sha256 "2bfb2c47ceb5d618336e374da83c1d70de7e52f4fd427190eca27e12e3e7152e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aosward-darwin-arm64"
        sha256 "2bfb2c47ceb5d618336e374da83c1d70de7e52f4fd427190eca27e12e3e7152e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aosguard-darwin-arm64"
        sha256 "fd019e54a897aedd2eae022b0889ef869783f709f5395eb5e1cdad9d195096af"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aterm-darwin-arm64"
        sha256 "b4c1675e7eb35937baa3496f825e49ceb06a272feed3b15a6741bcae8e94d6c5"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aos-linux-amd64"
      sha256 "73b9da9b5e8bfb033c9062fbfb69e8ab49143b0da21c690494fba5f035cb063d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aoscompose-linux-amd64"
        sha256 "73b9da9b5e8bfb033c9062fbfb69e8ab49143b0da21c690494fba5f035cb063d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aosward-linux-amd64"
        sha256 "73b9da9b5e8bfb033c9062fbfb69e8ab49143b0da21c690494fba5f035cb063d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aosguard-linux-amd64"
        sha256 "374beaf58f447b060975fc8dc7f5104a188a66dae883ddcae36db6d0a51b22dd"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aterm-linux-amd64"
        sha256 "754b4de1fb0af7cbbc1faa322d7fa8881d71b79c7870ff325735fa53cc5609dc"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aos-linux-arm64"
      sha256 "c29e1988b7c29d5abe526d51f160a37f44f7084ffacb613c22f5b33ed703fd72"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aoscompose-linux-arm64"
        sha256 "c29e1988b7c29d5abe526d51f160a37f44f7084ffacb613c22f5b33ed703fd72"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aosward-linux-arm64"
        sha256 "c29e1988b7c29d5abe526d51f160a37f44f7084ffacb613c22f5b33ed703fd72"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aosguard-linux-arm64"
        sha256 "d0c14021f10a0f7c22e98ec4dc67d8b5d3dd24b8f76d6d84dfec2a273d489b19"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.236.0/aterm-linux-arm64"
        sha256 "11474064464e9558d5fa4c71f68c916c616a21ae0f74026a8779e502ab258771"
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
