class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.192.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.192.0/umbra-darwin-amd64"
      sha256 "a7868b50e18705db835a374a15c001e9ca14435cd82087e27e0253d299212d37"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.192.0/umbra-darwin-arm64"
      sha256 "578e3f9e74bead8b4880e7204a9b1b03033631bb61c788b6b5c003b9a0c74f52"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.192.0/umbra-linux-amd64"
      sha256 "d07899f4e6c15fceaedf24d686c4509074bfa68cd11faf264657f8b4850908ed"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.192.0/umbra-linux-arm64"
      sha256 "9cb004fccb9b0a8951520bcb5025a335b8c60a56d1b9bd844554ef346c2a10c6"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
