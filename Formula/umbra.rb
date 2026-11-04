class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.267.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.267.0/umbra-darwin-amd64"
      sha256 "e79ebd920a2e24c92c50f051d3f84821c7d70bb7b5872e85fcc250785728ab77"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.267.0/umbra-darwin-arm64"
      sha256 "fa9ad84087367e07f9a8ff266e20d2dfa7233bf0b7f831c2f03e22604eee194a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.267.0/umbra-linux-amd64"
      sha256 "4db10588776f507ac393307487c060357f79d65966b66ba865be56fe9b23cc85"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.267.0/umbra-linux-arm64"
      sha256 "bee5a139e458aa158d35bdabd4a7bb6f0d615024d82af676edc7fef0f9a574f5"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
