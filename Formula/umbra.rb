class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.219.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.219.0/umbra-darwin-amd64"
      sha256 "faf6e3ae0609012a028b2d42dd62a61c32a09b3bfeb96e6d170cfadfee57c602"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.219.0/umbra-darwin-arm64"
      sha256 "bdc3ee1e56ca2c379747c258eca0218dadad8c31a28ab6209e8ec95968cc2373"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.219.0/umbra-linux-amd64"
      sha256 "505b2ca9fa20fd96293e4f31b641c29d61367c8d12a52e79ff6d8802a0ab1552"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.219.0/umbra-linux-arm64"
      sha256 "2f08050070483723de2cf81459816e715533b8928aca18aa1eb62d30499067c1"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
