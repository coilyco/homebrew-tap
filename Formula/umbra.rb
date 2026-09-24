class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.238.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.238.0/umbra-darwin-amd64"
      sha256 "1493e49b4478cb9b1c5edb11e266dbf2e28bd739e6bf7be074590b5f01432301"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.238.0/umbra-darwin-arm64"
      sha256 "d90cb9bc972e72cb3a6474e8d394976b415bc56c1fe7d5c5741a3ffb02fadbae"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.238.0/umbra-linux-amd64"
      sha256 "c3aaf530c18da6082b1f10bdd1bc43b94effbbf9d90e996633076f4e068f1040"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.238.0/umbra-linux-arm64"
      sha256 "11f5f362914250fa26b605e4c7e765fc723185f014ce8477deaf0e2a1f2c7d6f"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
