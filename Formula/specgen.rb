class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.174.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.174.0/specgen-darwin-amd64"
      sha256 "a7972a2c2bb663f9d48faa1e41c01ee62458a746ac35f5b20c5ad0d9dd2fc8f8"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.174.0/specgen-darwin-arm64"
      sha256 "3ac04621b770e431991062c60d0757bb5785e9befdb03873404572cf46ba92c7"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.174.0/specgen-linux-amd64"
      sha256 "630458a88d9ce4d80ed447c499a8b3b94d07325b4bd6cbc7f872c56f5ea34b11"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.174.0/specgen-linux-arm64"
      sha256 "6a5023ae2dd310363a9eae41f87226f685af5938d5d1d6f955ff6de7487997c4"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
