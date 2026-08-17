class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.156.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.156.0/specgen-darwin-amd64"
      sha256 "de6894aad17203314974dccdb6975f1f1d10cbed84c83b862197fafc1d096333"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.156.0/specgen-darwin-arm64"
      sha256 "111283de1a820a44a24a0d9a2301301df4d93217d3b824633512714415bf01e9"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.156.0/specgen-linux-amd64"
      sha256 "4ab6b8f6c995a3ef9ad6c262167104333134f0c43ce2e6ea7e9fac032dc2131a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.156.0/specgen-linux-arm64"
      sha256 "c769de7d4ff8690e3621e410bba84d22e39713f04032d2c7b5840fb0386d6b04"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
