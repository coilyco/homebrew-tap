class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard"
  version "0.137.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.137.0/specgen-darwin-amd64"
      sha256 "54aa216fbf0482449d47699d9d228634c2a7e9f30c4f0191bc6213f95a98ad52"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.137.0/specgen-darwin-arm64"
      sha256 "9de13cf7464f975af81f40de46fd2aaa4e549815e61bd5b73a5ab7acc801f2b1"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.137.0/specgen-linux-amd64"
      sha256 "e23fefb9eda10cd7c1e252bc39f2e34a899af79dc545a4c51736615bade194f6"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.137.0/specgen-linux-arm64"
      sha256 "cb4c1d38bd080597c6b25a2315721c7040635feb19e10ea12efb94b47dd69893"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
