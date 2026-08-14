class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard"
  version "0.136.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.136.0/specgen-darwin-amd64"
      sha256 "f90664d1a2a01a6d5888e4df67bb28b5bb79fb36aeede40c7ce970f679fea447"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.136.0/specgen-darwin-arm64"
      sha256 "8f381b07baae209c4546024e7187c139a78e9df0c94d3688db3736cca94b218b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.136.0/specgen-linux-amd64"
      sha256 "56db9f34847f26fb3094ba0290748d300a93eaf972de8f0d227196774340b05d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/cli-guard/releases/download/v0.136.0/specgen-linux-arm64"
      sha256 "db671be2b44adbd82fafb093297f3c9dd3ab987319859b7590e30afbdbd28399"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
