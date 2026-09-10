class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.211.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.211.0/umbra-darwin-amd64"
      sha256 "b1a14a94aa249838ae07d058e1dd4c9fca42944352169a2eafb7c02653fbcad1"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.211.0/umbra-darwin-arm64"
      sha256 "82df689b94bc21c6aceb592d010b946be74cd0f9685a5af28df8166be5d98b0a"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.211.0/umbra-linux-amd64"
      sha256 "7a2aef84f5cf9e82c39d147775ddc3cecc7b06f2ba7241522599350e25975bea"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.211.0/umbra-linux-arm64"
      sha256 "a5640eee00ee621e98fba4808d1f38053f06b1e65eaf1af3445cb6cd86594212"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
