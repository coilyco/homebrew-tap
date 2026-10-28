class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.260.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.260.0/umbra-darwin-amd64"
      sha256 "2f525ea6dc949ae7c7af33a8b817a786803b150cecfbcc63fda4b6e7da23bd90"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.260.0/umbra-darwin-arm64"
      sha256 "3b6e2a58574bad38a68d97f3e5d50040fa34338064b729ecd6d729c134df008e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.260.0/umbra-linux-amd64"
      sha256 "fb1bf0248c234d0c5b91f5a61b7aa26f9fb80a9f5320e54eb3e889fa59b8541c"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.260.0/umbra-linux-arm64"
      sha256 "f0858845acd8455e5e473eecd8f0fd15b6573771007c618716435978938b5f3e"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
