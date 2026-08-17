class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.145.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.145.0/specgen-darwin-amd64"
      sha256 "d6eefa1d237a30d3169ad76027cfe52685af14b17e2adba46d7ee7c787e4bfec"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.145.0/specgen-darwin-arm64"
      sha256 "298d7c12b3c96bcd1e418cb96fe329ab64a5d3410ff30de76ceb067a6c61a9a5"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.145.0/specgen-linux-amd64"
      sha256 "487aa6525535f2fbc2628e1cca48763066c47645309115f97b0b07434a24d554"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.145.0/specgen-linux-arm64"
      sha256 "dc7b4a82182fbbb7da309f04c094d875327524ae9350c90cad6b649e0bb96159"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
