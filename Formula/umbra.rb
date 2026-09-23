class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.226.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.226.0/umbra-darwin-amd64"
      sha256 "70f56cab9138b83bf3153ecb1c76e308510d4ccfd9aec77cf07a3e760e9bdf75"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.226.0/umbra-darwin-arm64"
      sha256 "5e56883587fc0c997a045003a612a220d2034f1f55f2f83935c5aa48369fb2a5"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.226.0/umbra-linux-amd64"
      sha256 "6fad4009359bce971f28ded78691448794fc31566f208324ffa594218e735ed5"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.226.0/umbra-linux-arm64"
      sha256 "484a9272e3c77e0b98fe6d9fb94c959a825948355548c42b39d40eea1f849ba9"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
