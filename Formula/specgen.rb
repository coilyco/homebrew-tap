class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.189.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.189.0/specgen-darwin-amd64"
      sha256 "22afe8af1b95219bb4ba7df0ac817efc96015e7d032b6ab9ce498ea85a9c0c40"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.189.0/specgen-darwin-arm64"
      sha256 "6c3fe51964ac3cb03fd7e59b932a9751c14db8d29c847a413cc64abd4acf25e4"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.189.0/specgen-linux-amd64"
      sha256 "3c26fb7c364d02d1724b345bbaa7b09e1d6dc42c9b81f0fe1324764ebb6ffb11"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.189.0/specgen-linux-arm64"
      sha256 "747ace2fe230e193b37f4aeb813ea016433ba19dcc51049f74c18f1a2656d8a4"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
