class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.148.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.148.0/specgen-darwin-amd64"
      sha256 "52c5ab7748b4063866f2d6a06bda866f444cf00849c7800b0da61244a1b3ce55"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.148.0/specgen-darwin-arm64"
      sha256 "84dfe8ecd6074a6423ae2a58268d106b03bff4444b6b9dde72454a190b8d84d2"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.148.0/specgen-linux-amd64"
      sha256 "12d6efcc3b0d57cc897828e77eb7d4374af6fd799017b2e216ff7dc2b72b1015"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.148.0/specgen-linux-arm64"
      sha256 "b3b6b5c693ea17c12d692a7e07f660402384d1fae83085f396947bd2c8532673"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
