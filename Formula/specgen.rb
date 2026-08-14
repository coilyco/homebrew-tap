class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.140.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.140.0/specgen-darwin-amd64"
      sha256 "57d19457eae7c4d7b2522fb3062001cce7a042a58f785af19b09f585346398d5"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.140.0/specgen-darwin-arm64"
      sha256 "7dabffa9479b0062d9ab50765da2e8bf2333e4d46ce348ff74829638b09b490f"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.140.0/specgen-linux-amd64"
      sha256 "b27c2efd925d941addf0f593d0107b353a405641a6647461b2608408861266a8"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.140.0/specgen-linux-arm64"
      sha256 "ad84a9a91eb20c7f11c7e6098176e0171947538e09cf23b18e155dd17fe46238"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
