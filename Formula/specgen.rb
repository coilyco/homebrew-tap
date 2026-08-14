class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.141.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.141.0/specgen-darwin-amd64"
      sha256 "21878d6cc1bd944a21fe3a6a79415501b6e23098f3e1a0f1071a1b8ddd760975"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.141.0/specgen-darwin-arm64"
      sha256 "5794d856e2ac30da8aef4d32b9ef258e1fb98065f56cffa35d59902952edeeca"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.141.0/specgen-linux-amd64"
      sha256 "eab9fc35c6cf63032342d1789eee34c78dc928405ff5ae0f1e164fd079eb8afe"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.141.0/specgen-linux-arm64"
      sha256 "cb430217c0df26f8dbbad66ae2c1fbe5c924653234a30415df3f75b45727de60"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
