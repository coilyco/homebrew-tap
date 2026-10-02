class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.242.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.242.0/umbra-darwin-amd64"
      sha256 "3bb13ef1ddbff327816afa3c47784879f71a2aa3df70312da33d33a37486d64f"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.242.0/umbra-darwin-arm64"
      sha256 "60d1c936482e75bf94c2ac5d8b334f02dbf55745410f3e881411cc0b9fab39d4"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.242.0/umbra-linux-amd64"
      sha256 "1a061cda6b07989f075889bd4dad009618bd99d724f06a9a31a5d8e1d4fb5ef1"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.242.0/umbra-linux-arm64"
      sha256 "037a6a30fc3ef40c4fdad5be354c53a323c522a32d8f7e6c4b7e2a6aacd65d3d"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
