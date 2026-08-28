class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.180.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.180.0/specgen-darwin-amd64"
      sha256 "90926fd3010f959e6067c8547db17fcb5f48bd3a55b3d84340773b8933fb8e81"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.180.0/specgen-darwin-arm64"
      sha256 "ed662b09eae4d8c1092bc0ea830c6288f68f752b9ab77490398026091d21c464"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.180.0/specgen-linux-amd64"
      sha256 "5df54fc2d9cd64b0221e4d744f9d5be1967fb6860b816327f36a01c1b680112f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.180.0/specgen-linux-arm64"
      sha256 "3e1b44234d6e184082e251faf9769e23cf764a5a4580aa176185c33da9d36ec7"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
