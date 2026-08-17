class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.144.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.144.0/specgen-darwin-amd64"
      sha256 "4955266865887cc8b42e8f5113de0886f6be1731c4c7e2b7654aa45efd483e0d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.144.0/specgen-darwin-arm64"
      sha256 "2d202ac3b9315b4b772406b81c47d03c60686c68723152387470f08b76647b23"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.144.0/specgen-linux-amd64"
      sha256 "009260492d973a72acac12c16a1d5f62ea80d74c02982fc1df72e0b818aacfa7"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.144.0/specgen-linux-arm64"
      sha256 "70fa827d58eabae4edd33dc89c10a0d3c8dfc919f23d9cf345c0d360be0a5f9e"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
