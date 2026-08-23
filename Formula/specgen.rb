class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.165.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.165.0/specgen-darwin-amd64"
      sha256 "40b3ff6778bbaafe37e01e0153aad14c6005ac6e6f3cc73dc55ec8c6392704b5"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.165.0/specgen-darwin-arm64"
      sha256 "8a904e4f1950ce496ede961bd094562fb1be472c350c967f74c1386d9ad24f5d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.165.0/specgen-linux-amd64"
      sha256 "e463bb8bce4abb5d5963047cf6df9ada5c99ce9d9a52ee07e1b98dd8cd9659d7"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.165.0/specgen-linux-arm64"
      sha256 "3f52fa925c46fdea4e699957799ba5c3c92b92695aa2da14e6062a88b0ab628c"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
