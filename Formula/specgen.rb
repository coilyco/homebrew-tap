class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.185.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.185.0/specgen-darwin-amd64"
      sha256 "ebf264bb424fb79aa35af1ff395f01797305ab9b232884aa00f512a975d1941d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.185.0/specgen-darwin-arm64"
      sha256 "d188d7c17a870978ee6c45bff929d7f90c27b8a5e12aee17a70c7d66c5621c02"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.185.0/specgen-linux-amd64"
      sha256 "350e15eda0987223f5df16e44f693e8b8b40d63b8fa19bee0d431b5bf060b03d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.185.0/specgen-linux-arm64"
      sha256 "b1196b43094864aa43411e51459bd3b30c0dbddd01cffd77b72054a2b842211d"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
