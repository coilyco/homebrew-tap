class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.234.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.234.0/umbra-darwin-amd64"
      sha256 "46ffae92f39c0a19283303f7d54b9bc451831227d132044dc45a3f747922ab44"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.234.0/umbra-darwin-arm64"
      sha256 "7683abccacee5f431c0b3de4f5d4c63c3450831d62f8bf23d2b856b9397797f8"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.234.0/umbra-linux-amd64"
      sha256 "7ad4b5ab85a94f4b4901dc35ebf1f2e3f851b8899c91783bbac497cccbeb358c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.234.0/umbra-linux-arm64"
      sha256 "6acd0a4ce04249e8df089f04f06816ef1b247c4b14ede6635761ff97870d1b93"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
