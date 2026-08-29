class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.184.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.184.0/specgen-darwin-amd64"
      sha256 "e2bbc5bd52c75fd5d22aa74ba8fd80cb790b39ed96aea97c8d4db5ba7296b36a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.184.0/specgen-darwin-arm64"
      sha256 "0e479ad23247247cf13b35eafb5d8e6a2869b2fe0dcd7680142c98daa1d8395c"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.184.0/specgen-linux-amd64"
      sha256 "eed61e6d0d9e8c8d3a884a1d1a69450508a1ac5864a046636a362868f065e79c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.184.0/specgen-linux-arm64"
      sha256 "f82a39f3cfd319435c0938ccc2b36fb5524b6a46551038e387e4dbfa343a3301"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
