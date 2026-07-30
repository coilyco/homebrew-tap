class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard"
  version "0.129.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.129.0/specgen-darwin-amd64"
      sha256 "9e566fe2681554afea93cb0620d2f53ea36f2c38d3ce08d0e599f9f4f593f55c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.129.0/specgen-darwin-arm64"
      sha256 "812fc51aa6234bdf1a0d83a1027e85f4d52cf3800ba9831058e68f0f9fdc1a2b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.129.0/specgen-linux-amd64"
      sha256 "16dc3b7a515e1a55d423ca90795df129515a6908e9ce8144074f5c833639b287"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.129.0/specgen-linux-arm64"
      sha256 "9b4e83a74d19d319ff648b19418df8616e6a99f6ccb58aca8e385276a63536c7"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
