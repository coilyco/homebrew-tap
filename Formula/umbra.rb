class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.257.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.257.0/umbra-darwin-amd64"
      sha256 "00970e7d16c4e03fcbc17c32c0357b788d88959ecb389fd5f6026c67732bee45"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.257.0/umbra-darwin-arm64"
      sha256 "86b7fd01c8d74816e0868e02cac5539f60248a09c7216e4f5f9edf808d034ed9"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.257.0/umbra-linux-amd64"
      sha256 "5c6852d4f92a5f335742ff8aa2f49500eb7b7984fbcbc4dc86a47d397f20ae15"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.257.0/umbra-linux-arm64"
      sha256 "05a04aa2bf085916f79eebf6f10e3dc29c8a45de6cf3183e5fd6652f8bc574b8"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
