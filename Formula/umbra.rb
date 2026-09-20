class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.221.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.221.0/umbra-darwin-amd64"
      sha256 "3ce561ab7aabb032411166d001d6b364360a40c1127f1de4106accf34e1d6759"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.221.0/umbra-darwin-arm64"
      sha256 "8c8c0dc2026e93d3f8a804f65ad9eb0e69167a9e5a578c15217f25bac9a880c0"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.221.0/umbra-linux-amd64"
      sha256 "b99a05f507ac826670ec98ce36eb0a3acccfa9fc679775f04da616e6278dd78c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.221.0/umbra-linux-arm64"
      sha256 "8dc028033097a51159b39de7be9163327b5a12e8ee4de469d06a42e33a484e5b"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
