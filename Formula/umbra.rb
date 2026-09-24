class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.231.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.231.0/umbra-darwin-amd64"
      sha256 "9d28892f8b3aa63a1bfa3469b6290ad738d66473808c80d68460e5d2dbb722b0"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.231.0/umbra-darwin-arm64"
      sha256 "b11565225e35228588fbf68c2fcbef6b8ff3adf54153aa8794aa667974b25385"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.231.0/umbra-linux-amd64"
      sha256 "09b6e21f138feaa1e802f49a32b1a8c1e7e1d7e622c265b68a25134aeeffcdf8"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.231.0/umbra-linux-arm64"
      sha256 "98f205b734bbef94dd14cc7f0df24e8f8b4e3141eafeafb382c559e5622f1b01"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
