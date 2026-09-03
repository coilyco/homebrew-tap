class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.204.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.204.0/umbra-darwin-amd64"
      sha256 "658227a19e9e4e7f5f568beecf07dbde8ba2c963399db8ff8b25059a18bc1126"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.204.0/umbra-darwin-arm64"
      sha256 "14f319a892416029ddbc7cff289fe12880e1e8ee59eee136f0b2a43672c8e15e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.204.0/umbra-linux-amd64"
      sha256 "1a49e7921f84fcda811de9ed07cc4f95b765aceddd9d9969c6a1cb4dbec34a25"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.204.0/umbra-linux-arm64"
      sha256 "5f363ffd37ed1328d925eb8dacf48e42e7c94a413ab849b85a349268535c3b97"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
