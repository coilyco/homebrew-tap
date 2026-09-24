class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.235.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.235.0/umbra-darwin-amd64"
      sha256 "a4179511dd8e5d13aba10cc1d7dfd4104a9490c5a442a38ace74949744382116"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.235.0/umbra-darwin-arm64"
      sha256 "5215f26fd14756458721732d2b8d09ef9364bffc2dde3ab0602a7ac6baea467d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.235.0/umbra-linux-amd64"
      sha256 "d2eed837a41368378bf0d21aeae14ae5872aad274cb78b76ddb33f0e1cdb7691"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.235.0/umbra-linux-arm64"
      sha256 "9c6dd80251ff9cecbcf56f9620acc518e61336435dea3bb64d3eeda05e43caef"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
