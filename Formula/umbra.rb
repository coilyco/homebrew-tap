class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.208.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.208.0/umbra-darwin-amd64"
      sha256 "cf51f0c13a4184184e975bc78882bb2f3a61ffc62eaba70c31659598facf08cf"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.208.0/umbra-darwin-arm64"
      sha256 "a2dba261f0246c5b541c144567b0d5ac36f316aa94e34e538d8f68fa47ea851c"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.208.0/umbra-linux-amd64"
      sha256 "05649fc9a8b39e017edf308c9fef75f37bed6189ed413f4b7321f283c75e3972"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.208.0/umbra-linux-arm64"
      sha256 "2727127acf0e0824b8664dd993ae35f3f13dc52d9db5a2473d873caf217352b2"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
