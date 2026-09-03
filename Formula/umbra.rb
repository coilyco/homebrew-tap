class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.201.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.201.0/umbra-darwin-amd64"
      sha256 "df84d3790f696d3a141587afe739efb708fd65976d2f98480927c14c1d6f0f54"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.201.0/umbra-darwin-arm64"
      sha256 "3d4f04bde2efb4aa7292a68318c1e6b8d7237c587cf19a5c8654ce5e1e9124f8"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.201.0/umbra-linux-amd64"
      sha256 "7a294b0d4277b862644242de92009f5520f0728e7c9e701b6747dbaf9f1881c9"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.201.0/umbra-linux-arm64"
      sha256 "d5ed84fef8e2ff8f2cb170c2c41f496a7143f7d7328fccf92fd5fe4e790e8c2f"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
