class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.209.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.209.0/umbra-darwin-amd64"
      sha256 "e83033ff53096de7f51347ecbe3fde6516f3e718a64f7912292b70caa353afef"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.209.0/umbra-darwin-arm64"
      sha256 "5237de2b4f1f8db807b0c1543350ba37e6f11bebe10f350a4b61a7dda61b5267"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.209.0/umbra-linux-amd64"
      sha256 "f798d2067ba7de722f524eb18ee53a0874d362d6b004d4e71187ee3b30e0c970"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.209.0/umbra-linux-arm64"
      sha256 "e6ed7774975faee184ade391fdada6ecbfeed2a90efa9bd2bcb47e4d3446c1f3"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
