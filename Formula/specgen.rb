class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.154.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.154.0/specgen-darwin-amd64"
      sha256 "3687098da09be4b16bb32a22067ddb7244981d9c6f2eb73eb733648ca5d5c695"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.154.0/specgen-darwin-arm64"
      sha256 "19cbb569fe5609cfb75b2df5330466389ba0d3d2f81f995ea7c603e097c40af1"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.154.0/specgen-linux-amd64"
      sha256 "7dc4c07414a56f59a5164d48ec4dc4a84407ed4c2906d69e5127de1f0003bb34"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.154.0/specgen-linux-arm64"
      sha256 "6cd47307314354d87722b4ec45fd2209a54bc5e98564cc5ec04bf1513969697e"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
