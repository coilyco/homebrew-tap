class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.179.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.179.0/specgen-darwin-amd64"
      sha256 "4e6a51d08db1de719f1483bfae207c7469c4e23afa173058ae6f0a64a55ef620"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.179.0/specgen-darwin-arm64"
      sha256 "1864fdce639b25c5b1e627ae83ffff520535c7cd51783a54ed4da6191be559b1"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.179.0/specgen-linux-amd64"
      sha256 "3aae259096dde8ec465510f0843ec7ff0a5b0782b882ea869ffef2133570d921"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.179.0/specgen-linux-arm64"
      sha256 "17b1c9f2cf1a9e576894135acece008b23e0a6e6224b09412eb1c960f82b39b7"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
