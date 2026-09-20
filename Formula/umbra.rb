class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.222.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.222.0/umbra-darwin-amd64"
      sha256 "272ba1f00e2fad07d8675ce4f537aaa908841485fc4580e1610581b68b607637"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.222.0/umbra-darwin-arm64"
      sha256 "8285e8655d3b73c2b089ceb5dc3978a251c1765beae4da0b11cbeb3a25440d58"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.222.0/umbra-linux-amd64"
      sha256 "e7bff9df80f9d61365d304590091d9807bcdb61ee80c86f3b0c00b37055ba52d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.222.0/umbra-linux-arm64"
      sha256 "e8930daadb2e15c09bbccdeb9dfc404c3623bd9ecd76cdb04f53ba9fac6ceb5c"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
