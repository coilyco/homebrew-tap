class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.207.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.207.0/umbra-darwin-amd64"
      sha256 "10e3da6761c45ad6050f0e0840a7304aa72fb230b390add2191d9033bd4386df"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.207.0/umbra-darwin-arm64"
      sha256 "075f1f27c47778f0d405353cdc89df6108b74e8114fc3362d97c41638181bf88"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.207.0/umbra-linux-amd64"
      sha256 "487a4be7668089deac9bfa39122dd4942f86b4f72a89e372aa70dde3304a4aaa"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.207.0/umbra-linux-arm64"
      sha256 "5c11fb8bc6d8ce903a8f006f7faa06d10a1b8a64d10bea3449bb24f3e115208f"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
