class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.198.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.198.0/umbra-darwin-amd64"
      sha256 "8666c7dbdeee956f4c002c926f908b7be1e45dc347e028e7244682b13e574c9d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.198.0/umbra-darwin-arm64"
      sha256 "9255818c3795df4f6ebd4bf5f0a392bd2ac20fb17b95d21818b83bab508f2d95"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.198.0/umbra-linux-amd64"
      sha256 "dfdedec40d74aea5df9e9b0f9f429b050cad587d16ba09c3183a20ab7a8bb9f6"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.198.0/umbra-linux-arm64"
      sha256 "ca0084f83c4c08a816c4bf1c009672c9e688f724126c5eb3cddf4cee46a78698"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
