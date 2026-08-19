class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.160.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.160.0/specgen-darwin-amd64"
      sha256 "284154a89c5cc88dc9bc9f37a42f684d71d9ac0cba738fb6f51eb9b2a5964782"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.160.0/specgen-darwin-arm64"
      sha256 "da518f2a6807ad387e20f3d5fbfa630a0178180602c1806ec56045f2ecabf10b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.160.0/specgen-linux-amd64"
      sha256 "c628cca3651e76bb74bf9e816e8bd9a479a77ca41209b4865da7e9f352dcb879"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.160.0/specgen-linux-arm64"
      sha256 "38713e6270c532a498c16f43e6eeb6d40cfbc8da38c52beb81d3990058b108ba"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
