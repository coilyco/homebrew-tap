class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.202.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.202.0/umbra-darwin-amd64"
      sha256 "f38e54538ebe9cc7a188d763a78680cf6fadb20045c785abce190dfb9da01a7e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.202.0/umbra-darwin-arm64"
      sha256 "0349e20d2b3fbd8680585c0943413cbcaa9e3192745beddfb5d157f99e2490d3"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.202.0/umbra-linux-amd64"
      sha256 "27f9b594e9fc767573c2a566c7111a8d43fc9c7f2872b9f2ce95e3653bdb366e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.202.0/umbra-linux-arm64"
      sha256 "1a7d03c7b299bb0c9a2297ffcb6a13e1284f6361d4b40f608b1054bce7433f11"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
