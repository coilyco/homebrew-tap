class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.191.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.191.0/specgen-darwin-amd64"
      sha256 "f0ffa7cec36398d8d0b9d295bd07e9835d7db42aac58e9a94646d8531c2dd5f0"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.191.0/specgen-darwin-arm64"
      sha256 "286177d5acd7b42b56897f1bb9a8160514cc20fbc6d224f6c6e9e9940cd1caaf"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.191.0/specgen-linux-amd64"
      sha256 "ef90ed1b6605dd37e384cef676d45a41f7e5b9a442c6ffc70ca11b362be61851"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.191.0/specgen-linux-arm64"
      sha256 "abefb2e29a487dfda7f8dc8f8d16ef6bd2223ff03baa4c6745955b0298a1d7fd"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
