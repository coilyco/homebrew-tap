class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.199.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.199.0/umbra-darwin-amd64"
      sha256 "059914f3d93ee4458b72a38e1138031db591444a517c3d3472aebf9437d5886d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.199.0/umbra-darwin-arm64"
      sha256 "39cf9446186e710bea597f934d07118328dfced5aa555f7cf875d2edef4ded3b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.199.0/umbra-linux-amd64"
      sha256 "9908da2e3aa52a886ce95e6d227cd20dd557eccc78b84533ec25a28fbfafdadd"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.199.0/umbra-linux-arm64"
      sha256 "4bef68c8f7af6e34d89f4b24a38a5c6808f5f3095e6c91c7dbc8a9b306bf2957"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
