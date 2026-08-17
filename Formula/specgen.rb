class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.151.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.151.0/specgen-darwin-amd64"
      sha256 "07713a6ea3407389376c11980b45b66b442b120b4e0e9e6f2688ff8bf670560f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.151.0/specgen-darwin-arm64"
      sha256 "e39aa3d0b990081ad6a3123f2da7b5d748d5876bf9c09256fad3a2bced04bfae"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.151.0/specgen-linux-amd64"
      sha256 "c89b1dea42c0af8da9ddfdca4c0597e2bb8450a41bf56f3b133dbe1cdd393f64"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.151.0/specgen-linux-arm64"
      sha256 "a83a8bdadcd12d584ece34ca452585ffd2e3d4608f6d682edb7f00eb4629f1d9"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
