class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.225.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.225.0/umbra-darwin-amd64"
      sha256 "0a7b9d4e3e27226b6d3d0df2a32635778f435481b90793ef11f0ca11af97b72b"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.225.0/umbra-darwin-arm64"
      sha256 "2458ca40a93aff218e10a6ca911fce8039d69d7878ba8f06c1166c2120ee0d27"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.225.0/umbra-linux-amd64"
      sha256 "7ae0847a1b3f8b700a3f4772bf16f0ce34efda85e39f670f10fb9bd6dd6d3fc3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.225.0/umbra-linux-arm64"
      sha256 "b410539dbc1208f627ca899b465edeb2ee947bfae9002b94f3a9f5bda81afbf7"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
