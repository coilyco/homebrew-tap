class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.182.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.182.0/specgen-darwin-amd64"
      sha256 "50b2755bf235f7a3290a590771cf568f5e29caf08dcc3861760a4d95a55cc839"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.182.0/specgen-darwin-arm64"
      sha256 "b6857ae744b4c475f4eb18ceff78afa2ab007b102ab1264535ddc1078bce9a30"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.182.0/specgen-linux-amd64"
      sha256 "9abb0356e08976ae6ecb55536ea694c78c73d26d02d35ad4e71c4bbf844b2773"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.182.0/specgen-linux-arm64"
      sha256 "4b6bd4955b45f49b2c7668523f6c5826861a569f9f5f2d3664772f884698719f"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
