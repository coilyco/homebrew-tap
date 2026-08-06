class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard"
  version "0.132.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.132.0/specgen-darwin-amd64"
      sha256 "1ac4430d5efeb18f55a5750b30e0256ca7c0efc74759fdfb2fc0fd509f475bc3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.132.0/specgen-darwin-arm64"
      sha256 "29b13c682278538bdad00bf48463c5cbc3ba6cbf29e50df08b87778a23d6f0a3"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.132.0/specgen-linux-amd64"
      sha256 "00393a4e7dbf3177b4311c5c3e89d8e9a37115e98373042876a8610534cd4918"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.132.0/specgen-linux-arm64"
      sha256 "a0e72d26faf122d8121bdbde914bd3d10c57ca83af057d28a228a285ae04c76c"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
