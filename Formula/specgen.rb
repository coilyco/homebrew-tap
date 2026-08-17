class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.157.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.157.0/specgen-darwin-amd64"
      sha256 "19f0f533d95abab314b3b172862a8057503fe2550ef956e43daca0a6ccdffa96"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.157.0/specgen-darwin-arm64"
      sha256 "712730c3d32eaf58815ac3e12008f6f0393fc5bb60e05f28bc6b3ff2cb53db51"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.157.0/specgen-linux-amd64"
      sha256 "1cda4e7656d9332480a07fa8d18d61e95b10d2e0c81d6850588ebaf113ac2730"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.157.0/specgen-linux-arm64"
      sha256 "45ca84217730082823da0830fa841003eca2d6a4a0670890aeec31a8586111ab"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
