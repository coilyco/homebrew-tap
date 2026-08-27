class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.171.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.171.0/specgen-darwin-amd64"
      sha256 "da898c4e53198140240d236add5125b88aff65c40505f90d9315f509e7fd95ff"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.171.0/specgen-darwin-arm64"
      sha256 "1fd9df9c3502e94f7e85bec4bf2291b1f6988faff1935620b5943e353e7349a3"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.171.0/specgen-linux-amd64"
      sha256 "9683b9e979f7f8c8541a0044e84badfc3006b9433edfe70de26ac65a539d747c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.171.0/specgen-linux-arm64"
      sha256 "2a92845dba9065b21f6391635bfc5bfcbbb5990bb760cde042755ef06d7876b9"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
