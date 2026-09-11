class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.220.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.220.0/umbra-darwin-amd64"
      sha256 "c8f567387f833be67d254e1407f4a3f8b34f68561f76a00cfa0096ce89f9cc7b"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.220.0/umbra-darwin-arm64"
      sha256 "66e6de3d702b31f2af7910699bf94742152a3aaf158bfd5c53e3acc67b9f5d7a"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.220.0/umbra-linux-amd64"
      sha256 "f7425b6cb9156b246e744f4849ba4183e458cdb39beccc44471b437c757997ee"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.220.0/umbra-linux-arm64"
      sha256 "883ba1f7928e004068bb6344b97c6abad4c5d9a626d86e0f5b2712e889cc726d"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
