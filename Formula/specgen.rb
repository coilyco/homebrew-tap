class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.167.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.167.0/specgen-darwin-amd64"
      sha256 "d51611b577b4b90c4f52e3827a1598906483209302d241aac81b7a15cdd0aa92"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.167.0/specgen-darwin-arm64"
      sha256 "26c7da203e372bac9de6aad9ca0246f803669c07f8bb1d2cfe204d37541eb15d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.167.0/specgen-linux-amd64"
      sha256 "7b7b38b21de1bc14d975114724f29aa025e05730f0edfc2169ad2f1371566557"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.167.0/specgen-linux-arm64"
      sha256 "ebf007483e2c0594b02aa9ffc4f6df9be226a41f44de7a671758dd849a720a0f"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
