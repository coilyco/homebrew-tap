class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.150.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.150.0/specgen-darwin-amd64"
      sha256 "46af5083fc6083eae7f8a62ad1f26c0ac7c60228d3447f03b383eaba54e13a2c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.150.0/specgen-darwin-arm64"
      sha256 "6140994171517432f97a6ecafc811b392faaa430740ac6c23a8685bb436ac26c"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.150.0/specgen-linux-amd64"
      sha256 "8300495a823ac33d1d9b4f09ad67a847f7920fc8fc2f997e854edec5d45d6925"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.150.0/specgen-linux-arm64"
      sha256 "aa39fc88bc338de1e90c3129209e000e916d4339254e75d45ad7db12d8c7b391"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
