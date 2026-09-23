class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.227.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.227.0/umbra-darwin-amd64"
      sha256 "174351b66f6ff52ebbf4615b3d0ed8b8595d9de17aaf54cfec3d8af3e748108c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.227.0/umbra-darwin-arm64"
      sha256 "1e57e8a6574c72dfe0413dcc8960d45b6bd1561a20f6a9d7a7757ab7f74c0ee6"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.227.0/umbra-linux-amd64"
      sha256 "dfd940efba9f0f790345ae0f204e338b44d6142ab4ce3321f0fb7d95adf4d495"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.227.0/umbra-linux-arm64"
      sha256 "9ca128adf33d0cd7c32bdd53196151d7b9d084466e1dcde7d16aecc82a374797"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
