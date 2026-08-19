class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.161.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.161.0/specgen-darwin-amd64"
      sha256 "4b7331457c1d2ef818a7803b67f9e1749cd225f0a798f7dbbcf844fd8fdb71f5"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.161.0/specgen-darwin-arm64"
      sha256 "22b98b932621b8d79ce8268902390fc7ba9b310633b3b52d93292574f5dce758"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.161.0/specgen-linux-amd64"
      sha256 "7d2260fa096bdb2b7bdb626948193d8f69a93cd9022e9672709b89559be5f0fd"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.161.0/specgen-linux-arm64"
      sha256 "ea2886126931c4924d45643d15325164e1e29d51291d4e1958f5a53545d611a8"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
