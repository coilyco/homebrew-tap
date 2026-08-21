class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.164.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.164.0/specgen-darwin-amd64"
      sha256 "49f07f4caf4f7c2b44cb149ee1349bf6e1c4482b57d4ab628a4031c46a99a43d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.164.0/specgen-darwin-arm64"
      sha256 "be1e191c9ed4729ca00e5abd530d6f8e4c0855379d15082b4fa016e1f4e20ae7"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.164.0/specgen-linux-amd64"
      sha256 "f722f8e80ccda3887e7f55c469bdb7cffc0715dcc79fac73cf0f79cba9ad0ace"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.164.0/specgen-linux-arm64"
      sha256 "a6a53451f4aca6e721393702231c7255f3ada1c94a8eb1bff5e912d1f6904eac"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
