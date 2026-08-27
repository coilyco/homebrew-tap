class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.172.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.172.0/specgen-darwin-amd64"
      sha256 "397af28b92e408d32e82fb635dc4254bd3f689a33d6d53e97683d31651966a0a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.172.0/specgen-darwin-arm64"
      sha256 "780daf9f29847358132390fce9248b2fafdee80c1f9a40389c379bc4c000ac77"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.172.0/specgen-linux-amd64"
      sha256 "c59c7d0dcbdbcad62d9f700220975d80495792301e70a77de315c5a85faa4f3e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.172.0/specgen-linux-arm64"
      sha256 "8bd3440eef940c7c232e16781642ac13f4a10a58c86ef2216e7327b42bd8e28e"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
