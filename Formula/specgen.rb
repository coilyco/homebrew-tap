class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.190.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.190.0/specgen-darwin-amd64"
      sha256 "555ed3f793991af0c89f6ecb48d7f3de83097b794f860ceb4f34e7a7c5ec4678"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.190.0/specgen-darwin-arm64"
      sha256 "47442e4d93b15d74d7bba19f799774a0768065c600adaa5c019620f0d77cd7ca"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.190.0/specgen-linux-amd64"
      sha256 "8aad9371aa520282a1ab1723b87b94a6125de7a9e3451bfc4d45361a6936efa2"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.190.0/specgen-linux-arm64"
      sha256 "ee62976e4fb61ce4bdcaccd6321e7d7e0df55e5658e5effdbcb75954b54ba567"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
