class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.183.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.183.0/specgen-darwin-amd64"
      sha256 "d4d46fc95f99bd01aa287c1b1b7e5c2b6136b21ae336008e885089cff2fccc26"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.183.0/specgen-darwin-arm64"
      sha256 "2debcfe0f256170f8ce9e8b8a377852d5c1013738232aec0aa2d9b649af11035"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.183.0/specgen-linux-amd64"
      sha256 "d16acb401dbdf7fc4e52f36628b6b2b4a5ace42581875c1d1be9a445eb286dea"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.183.0/specgen-linux-arm64"
      sha256 "191a61b6469304d2cce83689eef28b7960bf9a89526eba0a884870f98159a0fc"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
