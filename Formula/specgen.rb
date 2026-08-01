class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard"
  version "0.130.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.130.0/specgen-darwin-amd64"
      sha256 "b08d260162687f66ed1b44a5a4d80d1d4731f700c7bc90aae3ed299d59e610a1"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.130.0/specgen-darwin-arm64"
      sha256 "bf1801944399e86b874372f6a1f781efe0c1413b1181d53b9c3cf6796b5166b9"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.130.0/specgen-linux-amd64"
      sha256 "a3058f6aa3dada571e256722798c3418013b50aeaca2ecb68fcbc7274d80626e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.130.0/specgen-linux-arm64"
      sha256 "c22dc664e9f8eb9fb678268f1cb6bd91001950a86936e2097bce96660f733657"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
