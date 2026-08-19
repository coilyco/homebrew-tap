class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.158.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.158.0/specgen-darwin-amd64"
      sha256 "4424d2e5942121afa7405274b97587bedc120f5fba14723382d39317dab25e52"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.158.0/specgen-darwin-arm64"
      sha256 "9f4465c939ad85a84b51c22ac54701fc1cfe355e8303994629a5ab6624f2d95a"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.158.0/specgen-linux-amd64"
      sha256 "423b1b178f93d0d0bfee4ed12c6f4cad874753a2dc4d1fca29f61e6b5e15020c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.158.0/specgen-linux-arm64"
      sha256 "16c551a3f368eee4aa421832ffd967da23deb0548fc755b8410c4074737970d5"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
