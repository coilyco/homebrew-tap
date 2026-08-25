class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.170.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.170.0/specgen-darwin-amd64"
      sha256 "5313bf034e07b9f231758d6d0f02303b80dc1f82733780862c7cbcff31bb7577"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.170.0/specgen-darwin-arm64"
      sha256 "3da6bec439ad87cca421930d98d8858e4c2703e42d1548c993773e65a7b63c14"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.170.0/specgen-linux-amd64"
      sha256 "66b72b09c9981404d086d760aa7a193c20da5f46a8c01b7dce4c0edcd534ef66"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.170.0/specgen-linux-arm64"
      sha256 "e7fe063ade775047d7eae8c21133d4aac92bfbdc6b43d60c23c703b56927ce5e"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
