class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.147.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.147.0/specgen-darwin-amd64"
      sha256 "26559310680384bd0cc8e3d0e95a8b6798e5d553378e0d422ff1a94bd15d6396"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.147.0/specgen-darwin-arm64"
      sha256 "afb537f80ea19c7419222338881670c5f72827911d566f0f6213db2056d9bc14"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.147.0/specgen-linux-amd64"
      sha256 "4b0d30c521d54e33e40fb74638c7c0f31241302504a59948cb5bba580edc306f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.147.0/specgen-linux-arm64"
      sha256 "0d6dac77ad77a4c970479c85c8a58e1fecb0a3963eeb24c7fa53c74579380dec"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
