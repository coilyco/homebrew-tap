class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.146.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.146.0/specgen-darwin-amd64"
      sha256 "e0dbd1fe93d1c5184a5f148f093cbea3834d3005c68a26e3d60d2629c97c728e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.146.0/specgen-darwin-arm64"
      sha256 "0f58f9d00228358c1c75a6f1628477876e85cbac0aa1bbd77129b21f90717ee0"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.146.0/specgen-linux-amd64"
      sha256 "f7be7471f71d03a19c3343bccdf230dac2189d4457fd9105579acab4e8b03067"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.146.0/specgen-linux-arm64"
      sha256 "f9472f54a20259edbeea03d3aa0b582b68256b95babbb9a7b231d5496cb9568a"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
