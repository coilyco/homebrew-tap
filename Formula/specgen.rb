class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.142.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.142.0/specgen-darwin-amd64"
      sha256 "ceeb9716e8012fa144c1d03a152b16c274d7931c7c39e2fa56715d593268b3c9"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.142.0/specgen-darwin-arm64"
      sha256 "73ce59fe5c85e4496dee50b61ca3c954474425ca0301ece02ba1613a0b4f3f4b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.142.0/specgen-linux-amd64"
      sha256 "333d6a0febb55cb0b835f809c859b156a437f5c3b163d69ff3ca06a6a674febb"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.142.0/specgen-linux-arm64"
      sha256 "b74430d2c2d9b52a19bbf4dbec202bcefd0114bda498f9103f5413c675142375"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
