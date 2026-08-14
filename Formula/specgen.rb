class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.139.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.139.0/specgen-darwin-amd64"
      sha256 "1a9f83f6ea8f7bac7ac60fa89d06342f3ae041210a26e7241a5312e2c1dfd64f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.139.0/specgen-darwin-arm64"
      sha256 "3b5cde363c05489b46212fffc07977fe003e1f8dc2bc2655fe4b0f0232841c04"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.139.0/specgen-linux-amd64"
      sha256 "c657ac68d2ae05abc6534399018b8c07ca2ee779fb9f7c5dbe45ed6f343b0739"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.139.0/specgen-linux-arm64"
      sha256 "80437a6adce66ed1616c8fcc08fc08e960b2662934fa83772c0da66a1da0cca2"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
