class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.162.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.162.0/specgen-darwin-amd64"
      sha256 "25e51e33eed2624c37b1fca8184609674b8b14952d411657706398ee2421b04f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.162.0/specgen-darwin-arm64"
      sha256 "7cd8d0c78be9f9c2b5c4cfe7f11fbe446646e88b7326f2a0fcb8cf8e652631d5"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.162.0/specgen-linux-amd64"
      sha256 "63b861d6a9db13eb5a37da3227a330d93fd7b56eff172f72d3b77c4900712ce4"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.162.0/specgen-linux-arm64"
      sha256 "1fe9e3f8b38e67b85c12d3d98c2d98ef5fea6f8b83d50200ea5fb062ad3f44be"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
