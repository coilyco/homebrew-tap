class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.176.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.176.0/specgen-darwin-amd64"
      sha256 "7dc7e3465bbc10a67fdafebd115ac0f54135c7099fe4afddf0a997fb2c50aa8c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.176.0/specgen-darwin-arm64"
      sha256 "0f17a8f072b423e5bd2d4ac8c75e0b33e634a950087a0659852acf25f37ac2ca"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.176.0/specgen-linux-amd64"
      sha256 "6aa67b7c2cca9b9f83b005bc36ee30d6f5831b3d9985f40bae0ef6bd00f1e3cf"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.176.0/specgen-linux-arm64"
      sha256 "a10c7b4f74c935a9cbaf595695eac15e1d26bf892685c6654dd3dd0d1ca718a9"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
