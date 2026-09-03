class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.197.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.197.0/umbra-darwin-amd64"
      sha256 "1cd035559a946f23e619e02ed0040d6ba12352cc1d0db476ba201b9ac94243ae"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.197.0/umbra-darwin-arm64"
      sha256 "d935504567e9d18667bdae428b7c556b503d71649d0fe622015c96a765803d05"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.197.0/umbra-linux-amd64"
      sha256 "e62fdf5c82ddfc16543434891260946b1d3fffa1fb2da2cf44dd5a7e5f2e8b1f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.197.0/umbra-linux-arm64"
      sha256 "abf081a5c3fc50d181225716f02f75d3198ecc7696c6f715aa8759e38a98003d"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
