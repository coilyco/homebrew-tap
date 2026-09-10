class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.213.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.213.0/umbra-darwin-amd64"
      sha256 "8040bd7157847d9fe545eb53b3a1b57ecc65ca88f6e4f7b5b5c8c7c65ce721d9"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.213.0/umbra-darwin-arm64"
      sha256 "9b8dd2f2a6f4ff35303e3f5a28e3cd09711c68c7f97ca9014cb56b704f76f033"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.213.0/umbra-linux-amd64"
      sha256 "af9d6f5df094b0d97220a8b8a9518fd375f62d3911d23ac46ac7ee48f1cb8912"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.213.0/umbra-linux-arm64"
      sha256 "f7821b0ca23deb877dcda9a1efedc90291c11df32c30b8381e138788f241541b"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
