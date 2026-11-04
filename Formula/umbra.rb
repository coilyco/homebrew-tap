class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.266.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.266.0/umbra-darwin-amd64"
      sha256 "7df20512e7a171a58406376ce04d792ec349909d12923871a0f4bb24a7da50bd"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.266.0/umbra-darwin-arm64"
      sha256 "2b81fc773838f8aee2b3148fcff214f2153463218b67bd9dc219f9d551f2b529"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.266.0/umbra-linux-amd64"
      sha256 "00d43c4e5e275df810f2ddc23c356ffbbe8554608f65d153ee322a87c29b52d2"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.266.0/umbra-linux-arm64"
      sha256 "1d75bff8e67c52c13a97fd19371223e2098fa9f2c0f3043fecf0d5679a6dd0b1"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
