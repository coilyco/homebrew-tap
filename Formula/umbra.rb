class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.194.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.194.0/umbra-darwin-amd64"
      sha256 "26afe0d3a2ff10f0f846dbbc1b1adfc49d652ee7dae5029fd330358fdc77d104"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.194.0/umbra-darwin-arm64"
      sha256 "35eb84ace312bb854ef6d13b4f3a3c7d01334f996b667b6d36e6abd2a946853b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.194.0/umbra-linux-amd64"
      sha256 "e167b71750dbc39d9c3aa75c1a1465c7794f8f7d61ce73802cbd3a7b2e55f2ff"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.194.0/umbra-linux-arm64"
      sha256 "6af053fff5a3be781e557a37c18f362ddd6df03600c36c17d58a8a2bb5d07708"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
