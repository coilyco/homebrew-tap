class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.143.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.143.0/specgen-darwin-amd64"
      sha256 "4956f0d91ddd356e215a40a87dc1e539a353703262306839ce94b5a4e1dca5fa"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.143.0/specgen-darwin-arm64"
      sha256 "95a6b8e3307c3d251b48d130f9e8cd04707ce5359b2121c5239b53e33699585d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.143.0/specgen-linux-amd64"
      sha256 "7767b2e77d03bc767efaf474d36e9bf28498549108b0df2b5390a80ee9bb8f80"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.143.0/specgen-linux-arm64"
      sha256 "462ce2ba316526c0b735b956f00e3717a757970deb247a5e048e2cbb5cf064dc"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
