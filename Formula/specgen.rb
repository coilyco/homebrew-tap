class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard"
  version "0.131.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.131.0/specgen-darwin-amd64"
      sha256 "9369f14bca0f8226abe99b5b6420e54e52ef6504d0b15aa457724d42e566cff3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.131.0/specgen-darwin-arm64"
      sha256 "3f60163012521ce4c0bd2bd04ddb0e28cf3abc7fbcae0df0e271109618cb4127"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.131.0/specgen-linux-amd64"
      sha256 "1952c1624f04c01617f02760812c45e34f87dfedd16931e82bd40730422a71a8"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.131.0/specgen-linux-arm64"
      sha256 "fbcb783606c34b02cf9f031b5473a16e1aa74b2a24263c84a6745b7a245e185c"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
