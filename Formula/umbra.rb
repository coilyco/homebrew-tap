class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.210.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.210.0/umbra-darwin-amd64"
      sha256 "793379c528543943d85d27bb92ea5253c5c51806026ae39dc19a63082cdf2a1e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.210.0/umbra-darwin-arm64"
      sha256 "6150978f97a26f16b2cc83c6dbf4d678407a4d08f69799798ae7dde1896ef1b2"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.210.0/umbra-linux-amd64"
      sha256 "0e754b0dd7dc4612751a9c797470d944abc60778d1b7259d32ca6f770a96c4b0"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.210.0/umbra-linux-arm64"
      sha256 "3b24b43dacca6d5c739e877a58a6e51b7c563de2e82c0d2fb6c08fe9e98f965f"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
