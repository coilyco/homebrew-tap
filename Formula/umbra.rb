class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.205.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.205.0/umbra-darwin-amd64"
      sha256 "6cf972bb369586a7752a9f17d6f94200d9bbf3f6d2884d0eec97caaf2e3a1e68"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.205.0/umbra-darwin-arm64"
      sha256 "b88a2a86008854feb5ae12d9cc71cff9f8e380b9fe41dcee1a2a259efdc211d4"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.205.0/umbra-linux-amd64"
      sha256 "f3672ac4bccc1ab249bfae33a7fd85ff7cdc2112648a6c182809bb49446bf05d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.205.0/umbra-linux-arm64"
      sha256 "17474772b02ade94dad9ac5b2a01fedaaae890859e543070be191c98a382befa"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
