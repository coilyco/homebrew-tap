class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.229.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.229.0/umbra-darwin-amd64"
      sha256 "182c1f752d952d9738730fdc5097bb945e38c5117636745b8bc4eaa48a69d2c0"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.229.0/umbra-darwin-arm64"
      sha256 "c298e50d0935b0978a11f5efae18386d8d460ae223aef4bfc77d5934b48acd0a"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.229.0/umbra-linux-amd64"
      sha256 "24aa46ba75868f331cb1303dec450835284c4590626a8990482bc34cdef449e8"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.229.0/umbra-linux-arm64"
      sha256 "b05ab94673c6e10d95930300bb6c3316ac1dc3694934ac70e2d308b7062e83a9"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
