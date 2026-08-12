class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard"
  version "0.135.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.135.0/specgen-darwin-amd64"
      sha256 "aa783000d15e2628b16ca04337727f879a721e70084744ef35c06f4f44240071"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.135.0/specgen-darwin-arm64"
      sha256 "10851a3b6430f1e406de319ff39dd3ff8bb1f6343f78a0812ba6e1e26178f34c"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.135.0/specgen-linux-amd64"
      sha256 "55504740a5acc2fe993562301ae5a1cd49bd0c7332a573e9444a15820aa008df"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.135.0/specgen-linux-arm64"
      sha256 "37566538e20a8e34be0b57993ce24d90645677c97b60b85e034345d724228a52"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
