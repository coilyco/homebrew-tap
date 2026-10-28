class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.261.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.261.0/umbra-darwin-amd64"
      sha256 "9b3eac8431ad66ba7b7dd63606435c34e7fbef50f4dd660c3019a99900da23de"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.261.0/umbra-darwin-arm64"
      sha256 "39a87a2ed016cdef64172458d7786f578689e1b6dccfb3704cd4a68e35760832"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.261.0/umbra-linux-amd64"
      sha256 "0aac2da10576f659a1b8b6a12c5b366fa5f4ad5b2ea93fa14e05b021d272cb68"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.261.0/umbra-linux-arm64"
      sha256 "ff4df5fc67c0b9dfed3f5b537537f49d30f608c8a9d35695de82b21fc5b5e120"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
