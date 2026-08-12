class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard"
  version "0.134.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.134.0/specgen-darwin-amd64"
      sha256 "5fd317e76bd1774312c197d196aa3cc710879d74b1f391bec7aa8e37ac9d3859"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.134.0/specgen-darwin-arm64"
      sha256 "fc4339763b10643f80bef889adce462725ecad7a255d189f0dfb4c684d6804e5"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.134.0/specgen-linux-amd64"
      sha256 "94e646b0431617b06694f39635195d86426eb1b736a85cec11671af93733930e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.134.0/specgen-linux-arm64"
      sha256 "6c2929500cb5d36fce65e4cbe0b3d2382637aeba63a9169773f5d8ad6fea0932"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
