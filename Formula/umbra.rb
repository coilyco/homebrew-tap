class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.218.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.218.0/umbra-darwin-amd64"
      sha256 "165591778eecb64a01abb48b3b6c0c301a76a95133cabadddf94ef8ef4f67617"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.218.0/umbra-darwin-arm64"
      sha256 "9975b26daed2d6245ca959f782cc369b174619bc2a832e61703962cadf72a2c5"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.218.0/umbra-linux-amd64"
      sha256 "b3f791329374413079d2efbc96eba32a2e866c9904096c33c513838c94f8e95d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.218.0/umbra-linux-arm64"
      sha256 "d8ecd946e0cc29b3309039bbaae1bbb706e21d59c22261b72df9fa01d0f61604"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
