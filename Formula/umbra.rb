class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.193.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.193.0/umbra-darwin-amd64"
      sha256 "9a59715a0fc04b2852051509902ea906454a0a71bbbb841894f77976f9d89f47"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.193.0/umbra-darwin-arm64"
      sha256 "e82921ffc74948e6298e35425b6355d38d37f3660615d1dbee6825b234c65634"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.193.0/umbra-linux-amd64"
      sha256 "01eb7dd1b2294bfb1374cfd64396e67cea84c988c80dd62f49f512d255979adb"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.193.0/umbra-linux-arm64"
      sha256 "850f38930c6b43fec7c776aa0fb430752beeddb5cdecb4559fe02c01209fefcd"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
