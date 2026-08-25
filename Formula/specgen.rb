class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.169.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.169.0/specgen-darwin-amd64"
      sha256 "7f2d1ec74b5c038e05830f53d6e6be28a7ed66d7e2fa146783130224afb02bc5"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.169.0/specgen-darwin-arm64"
      sha256 "21dd3e4fd8659fc5a8354db8f268d1071bd345067a9e8dbc6e987d7413b8ea6b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.169.0/specgen-linux-amd64"
      sha256 "36a389181980b2fcbc01483b6f10892794a06fdcd947bc45681b38218a1cfde1"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.169.0/specgen-linux-arm64"
      sha256 "978c1c6bd0df7d0e1fe3b37a985ae4aedcaa895024093cf820048c9bf5d74243"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
