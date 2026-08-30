class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.188.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.188.0/specgen-darwin-amd64"
      sha256 "d6fc819da2cf31b066f772ade614384dcd1cfcf4388d1ca96ee34c8b1fb8aac4"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.188.0/specgen-darwin-arm64"
      sha256 "ef1fef9e93ae84dad103e18b251d9e5e18f3c7df5b60e547083d1bea136fe518"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.188.0/specgen-linux-amd64"
      sha256 "e69156580e2f56cecb0c8a66b8613a2e98815de9dbbec0b883bf0dbc160d56ce"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.188.0/specgen-linux-arm64"
      sha256 "c47e790853b8465d61dbbe61ff44e5d4181fae8a1d0c8122ac8eb2983981d95e"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
