class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.177.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.177.0/specgen-darwin-amd64"
      sha256 "de6d93b086a3bc7c55ae71e9fedf2d5b526207b41cb7d91a91da7dcd0e1b90a1"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.177.0/specgen-darwin-arm64"
      sha256 "39be47ab7fc63f9577219c865ccda59a487ea61c1d0d7d5354a0d9d5a0a11375"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.177.0/specgen-linux-amd64"
      sha256 "fb5ba4071088c46f7e8ee01c6f19f996bcbebc459ec507627bc2892ba8dea016"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.177.0/specgen-linux-arm64"
      sha256 "b3912f73252bb8c7433915747831a94596f554f667295865c4fb84db8c1b0b00"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
