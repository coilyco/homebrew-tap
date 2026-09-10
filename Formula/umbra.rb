class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.216.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.216.0/umbra-darwin-amd64"
      sha256 "2d44bb7cb49884fd913a37b064a9ae103a0c96cb00532030d01d6a4f15a54489"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.216.0/umbra-darwin-arm64"
      sha256 "4e338ef489f7e57f6ee587f3d69b16915c9790aba29d67fb127e85b2c16ae393"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.216.0/umbra-linux-amd64"
      sha256 "9a1d0e825a2262c087fdda1f34375d7ad92b7040775267ffb22a0539d263f1bd"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.216.0/umbra-linux-arm64"
      sha256 "9adec3fb2d7262cf22a7a1f255f653435fe41b6628e06ecf6bb51cf9664f20b1"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
