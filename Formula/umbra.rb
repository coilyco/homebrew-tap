class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.195.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.195.0/umbra-darwin-amd64"
      sha256 "20783a23192cebb5be7c19162985aaca45b8830ba53f65add57086b0f97c95e3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.195.0/umbra-darwin-arm64"
      sha256 "7065a4d48e8701897c2eebb238b53265660480c8fe431736ebef1ee038506429"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.195.0/umbra-linux-amd64"
      sha256 "73a40ddc0c6aad86eb025f56f09eb6d3e75ad9ef366ba07ab1620fca924d21c3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.195.0/umbra-linux-arm64"
      sha256 "2691549c35c32c6c39fa46ad6b82542b0928f7b2b5f4ea37238c489019c4594b"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
