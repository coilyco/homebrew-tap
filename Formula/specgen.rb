class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.138.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.138.0/specgen-darwin-amd64"
      sha256 "92ba27e9b71702db8c5e55a9eeac8a9b04f4bfe71629edab2766c21ee88e1361"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.138.0/specgen-darwin-arm64"
      sha256 "4ee541d3d0a285028365763fded0f5b98becc46b9ec9a77598d1ba9d03b42ab4"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.138.0/specgen-linux-amd64"
      sha256 "9d67bb69d51f1adfe5e5678d98a56dc3e842ed94b51b72bbaabc2e04753333ba"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.138.0/specgen-linux-arm64"
      sha256 "bc50b6f2c007781a4f2c7cb01bbcb045726dd60ff547aa587016f933612bb230"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
