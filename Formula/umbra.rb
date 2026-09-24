class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.233.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.233.0/umbra-darwin-amd64"
      sha256 "7ba3e896c40436950c956e68a7924668b0bbbe8a1c5d472514d5c4e1a27d823e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.233.0/umbra-darwin-arm64"
      sha256 "c3127daedaaa544efabd9ae778774c14fe5371d495e19cc3e95d292b2f243e22"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.233.0/umbra-linux-amd64"
      sha256 "07879ee37b2b99df2481b210fa90469305b7771daa02d8ed9c4e2cd59154dd6e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.233.0/umbra-linux-arm64"
      sha256 "677186a83c98b1dbb9bab08b167f291d72ca9688ba461b2d05eef8b4f60c005c"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
