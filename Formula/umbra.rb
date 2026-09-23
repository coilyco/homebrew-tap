class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.230.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.230.0/umbra-darwin-amd64"
      sha256 "412b8e48b60e716f9b6c16788f239b7cd6db1982a4c49d1c9086fd1645db5c4b"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.230.0/umbra-darwin-arm64"
      sha256 "148d090c2f2dedd4d95e3f1129bfda4d425e66f1b1dcab63329b23c622caff13"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.230.0/umbra-linux-amd64"
      sha256 "0925dfa0fc521ed3fd3537204b08b1444959431cf27374c3e570a2b63630fc33"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.230.0/umbra-linux-arm64"
      sha256 "890efd52b1b4f153d5d6c670ff51807fad2f9f93a66b4bf578683b73ea70ea4b"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
