class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.181.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.181.0/specgen-darwin-amd64"
      sha256 "80509e06f674fa8e64656231996063bb465dcb1cc5f3971b394842424a7ea97c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.181.0/specgen-darwin-arm64"
      sha256 "03a378cc49c256b204a7a043019225d7f850a6c6504cccd134d21342497c3b9c"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.181.0/specgen-linux-amd64"
      sha256 "82e1354968ae1bd7daea18d1716c61a7a2e526d3d7f3bebe320f5808b26e8e29"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.181.0/specgen-linux-arm64"
      sha256 "8fe113fd02a3cf26f5fe742390ea9387e051e5c56a6ec0f7e51d0274d8755945"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
