class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.159.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.159.0/specgen-darwin-amd64"
      sha256 "74ba0eac04667602cde05f575d3c2bf1aa524e7d0f9ca05588b1e9ba6544e4a0"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.159.0/specgen-darwin-arm64"
      sha256 "aa6e767182625c49995e62249ffdf3d75838462596105514a9c1faa1417a4021"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.159.0/specgen-linux-amd64"
      sha256 "3b9d587d39ef969bdf8b61e50aaf10b72d9ea877412257e5089320e2afee4d67"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.159.0/specgen-linux-arm64"
      sha256 "7cc1624d8a597eb87cb107049f7f803c59559304e00976910fb892df11e75e1a"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
