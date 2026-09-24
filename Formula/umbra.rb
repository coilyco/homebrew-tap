class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.239.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.239.0/umbra-darwin-amd64"
      sha256 "a167149278ab316b6a145e172e1f1a1d38e8c6696ef2ead01ddc4e7a9783034c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.239.0/umbra-darwin-arm64"
      sha256 "195e1edc84d5b3282fa251dd6ebec2527a7cddc0696a403861cacd2d51d7c938"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.239.0/umbra-linux-amd64"
      sha256 "7353ee71aee0e751bf473b4184305eadf5f9d1fedf7eb7dbd5fb5600a81ffb30"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.239.0/umbra-linux-arm64"
      sha256 "173e93c2eb02d3dfd1669afaa2fa0801dce3499106160beb4e910d1698a146db"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
