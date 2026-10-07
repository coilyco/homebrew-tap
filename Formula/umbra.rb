class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.248.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.248.0/umbra-darwin-amd64"
      sha256 "76a051516a4b0e62bb78e3609e52f6ca7e21ea8528235a30d0d017a530323305"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.248.0/umbra-darwin-arm64"
      sha256 "912fce74d71f25a7603d12e0f6e75293de4ea8d0f780cec518345f13c47b5c06"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.248.0/umbra-linux-amd64"
      sha256 "84fb4a3b28768a84ef697fb39de1c4d3a8020dd493487ca8430f02911be87f63"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.248.0/umbra-linux-arm64"
      sha256 "36c8da8de19b4e3e18916190761d29102d8f129bac3a0851ec44cff57deb39e5"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
