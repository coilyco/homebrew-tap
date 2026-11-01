class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.263.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.263.0/umbra-darwin-amd64"
      sha256 "00c9fea309d73248880036abefc484275626037cc2ec97b5a532489d0f6eddcf"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.263.0/umbra-darwin-arm64"
      sha256 "8e30b0ad97b494ea080460b53f6dd9a8f0792b3630c8874c8531101434960a6e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.263.0/umbra-linux-amd64"
      sha256 "2ee289718d2c3e1cb18cbd85b215f172e83e62995a3c34de6eb7f73e2d2dda00"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.263.0/umbra-linux-arm64"
      sha256 "2f2464b3bc241e09412e1f299cef1a10b0f40448f1331af979a81cdc1679f70e"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
