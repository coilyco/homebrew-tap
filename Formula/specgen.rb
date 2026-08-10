class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard"
  version "0.133.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.133.0/specgen-darwin-amd64"
      sha256 "2d5e74b65efec56d911fe68b63b9b33a579e5647d5107715d41a7b7ba548f35f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.133.0/specgen-darwin-arm64"
      sha256 "a056c13dffb04560328f70e8320de289ac35055395f831cca6237984935b18c0"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.133.0/specgen-linux-amd64"
      sha256 "dfe4b2dc410919f98b5885572bceba33140deeed3ab676ddc4f0a74c3118c4c0"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.133.0/specgen-linux-arm64"
      sha256 "a550923878cdf38e402445148d0f92663955ceaaacc97c35bdcea3ea88e4f6ff"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
