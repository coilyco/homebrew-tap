class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.243.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.243.0/umbra-darwin-amd64"
      sha256 "6633f3df0e0043183e5faee8673f45d9bd4766b7c099b5b6c0232f2a44e63cc9"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.243.0/umbra-darwin-arm64"
      sha256 "9f9cf5996400dfce2d2c5146a59ee18c3abde081042aa665577e7fc7d3a36325"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.243.0/umbra-linux-amd64"
      sha256 "173bc509fa0c5e997afc7c0526600bf56ddbccc7a3d082f1da8074801987d8bb"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.243.0/umbra-linux-arm64"
      sha256 "e24ac1202da9d11b3982495677dbdac9f9be6f9d6dd3bab1fb80d21d314d41ac"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
