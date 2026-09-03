class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.200.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.200.0/umbra-darwin-amd64"
      sha256 "71761ada54c22102021e91090a4f25e1a7571a305d550352fa5718b0649a660c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.200.0/umbra-darwin-arm64"
      sha256 "7ba094b60a6b5986805aa3a029a9419ebea913e02fa11c1041ec8b60eec3433b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.200.0/umbra-linux-amd64"
      sha256 "09781768de5a651d8ff79b6172224950ba78e668acfdeddb0a1a1c09b9828041"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.200.0/umbra-linux-arm64"
      sha256 "481a598eb9e96c272c3630621070d26f4e26a54b5754d3d07dc9ade1dca415bf"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
