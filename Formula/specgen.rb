class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.155.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.155.0/specgen-darwin-amd64"
      sha256 "6b895a549cc7689800be4db2909d401ef944e996b1bfd6bca71d19b380315d41"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.155.0/specgen-darwin-arm64"
      sha256 "89f7b1fb664eb6735763c982a4b29990ae03179c747aeae211b33010a6c6e9c7"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.155.0/specgen-linux-amd64"
      sha256 "0c20f89fad2890881c3f681622870565f0b22f2d4920b1affdec91912b0deebb"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.155.0/specgen-linux-arm64"
      sha256 "076cf8f56d3188848a339f2bf94f65afd1dd992e626a0f6dfa7ab5129d191a10"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
