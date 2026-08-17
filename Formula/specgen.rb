class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.152.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.152.0/specgen-darwin-amd64"
      sha256 "3d490a85a45753b9df4e993fe2e7a2918e1ea784594f31ad1b4a5ef983b66e05"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.152.0/specgen-darwin-arm64"
      sha256 "b73c43acda7854eef8d02529aeca03ac8e3c846056274903945f9e4d6d2fd0fb"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.152.0/specgen-linux-amd64"
      sha256 "eedf1364fb5ea5f95195a643c6a89b03f107471fffd1e0a1f1f5cb4c9f862ef0"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.152.0/specgen-linux-arm64"
      sha256 "1d09b2d1620f03b9431a325d1dd6e30dca01e97f570891cda7c51cfbe54d2bff"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
