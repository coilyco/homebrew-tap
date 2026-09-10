class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.214.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.214.0/umbra-darwin-amd64"
      sha256 "7b5c6fd110720bf9ca4a112406c0d112598119f06b4c676539811f8827b5c41e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.214.0/umbra-darwin-arm64"
      sha256 "0802518556ecfbfaf3f6b2489e8777919689f3e89c8610685dcb02bb26e856fa"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.214.0/umbra-linux-amd64"
      sha256 "2525177394bed6658ac39390a3b7b7878819240b2ec3d02f72f13d05c424cfa9"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.214.0/umbra-linux-arm64"
      sha256 "152e661f320ee9e1a97399f0382367e2764bc25d4fb83b8ad07f917c64d78457"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
