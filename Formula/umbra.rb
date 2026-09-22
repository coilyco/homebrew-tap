class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.224.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.224.0/umbra-darwin-amd64"
      sha256 "349ed2ae867c82fae21f14d4ecf68c82fd6c7dbc7142224c2017a3cb525c879a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.224.0/umbra-darwin-arm64"
      sha256 "91dd74d8aec32d949ed44a7c551c6937d244b9477f9082b060b6f27fe7740c94"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.224.0/umbra-linux-amd64"
      sha256 "e0619da27981aeac9ce88073f397dbf2aea790050ba1bb5d021d70d4478f2a9f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.224.0/umbra-linux-arm64"
      sha256 "5f2fe144a0545bfaccc7be221dd0607c780655608550fcdc42498844e3d66b35"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
