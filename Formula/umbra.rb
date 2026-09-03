class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.203.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.203.0/umbra-darwin-amd64"
      sha256 "49ba6a134cb415df6c7b5f89ccfb6aa6675fa0e5c2154d14bd1497b9e6ccabfc"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.203.0/umbra-darwin-arm64"
      sha256 "40fbec116830ec19ebfcc923863fb454f3673f971730da2ee519b23525272cfc"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.203.0/umbra-linux-amd64"
      sha256 "6c44810acbb30cd84f6728cc03b179ce7c26c643baf1ec1bad260fdf9fed14f6"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.203.0/umbra-linux-arm64"
      sha256 "64e2aed21cffd5e29ef9ecbbe35bdbf4904d027ad384fbe7c1c4d35cfb82b021"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
