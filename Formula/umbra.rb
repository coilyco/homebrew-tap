class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.212.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.212.0/umbra-darwin-amd64"
      sha256 "0e8a32aec74ada40d24254c903c65ee138ff6b4a4149d8c285dc175df5f6e86a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.212.0/umbra-darwin-arm64"
      sha256 "4a9330717943b896268f556e3b33e8164212cff9bafae804f9d50112b954c28c"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.212.0/umbra-linux-amd64"
      sha256 "e0e4adcfd05a5c56be59b6d31c60db2cde886d62b87b2d5a0aa8436f9d1691a0"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.212.0/umbra-linux-arm64"
      sha256 "a0cd676791543edd3b723e7165121763a009dca1f049e30e976b25365c24ac59"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
