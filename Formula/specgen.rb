class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.186.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.186.0/specgen-darwin-amd64"
      sha256 "7744e0225b83d16b10c8a88258289b696341e6335946fd45c165a1274df0c942"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.186.0/specgen-darwin-arm64"
      sha256 "c555632534c42f96f3afedbb51f71e331678da2eb4249f4c844fd773ce87c4be"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.186.0/specgen-linux-amd64"
      sha256 "b0415a89d1a7d01cc1c3f62b8b67c105741a9cd8ec1a231334264148bace1f92"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.186.0/specgen-linux-arm64"
      sha256 "99fcd2c9b0af14b7df442dc1e1d507737094d4f81089764aab10fe6a2068a915"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
