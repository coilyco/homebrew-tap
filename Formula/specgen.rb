class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.178.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.178.0/specgen-darwin-amd64"
      sha256 "ef0c8e57244442c757929b7631ba97a9fbf114f37f4d9aa84d0d32cbff1d802a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.178.0/specgen-darwin-arm64"
      sha256 "fcc40c6e323a6c4816144ef4eb06883dd53279958067a133528014beaf9a0482"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.178.0/specgen-linux-amd64"
      sha256 "716140dd186e5baab95fe7336752f0689bcd2d2c1b8c006d5c23edcea20f1d74"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.178.0/specgen-linux-arm64"
      sha256 "41302c8cb53441c611da19752d46fdd315c860ee9c2af391cca2b0e70efff197"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
