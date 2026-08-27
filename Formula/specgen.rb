class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.175.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.175.0/specgen-darwin-amd64"
      sha256 "6012545b521ddce21f3ac807c3a83a079614ac26e33734b17ce9fdc4de0f8f2d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.175.0/specgen-darwin-arm64"
      sha256 "eccb85459f614e54b5bfc8c37ff759071465bdf0d735203249f1805cad8d79b7"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.175.0/specgen-linux-amd64"
      sha256 "0d7888d7b376e26af153e47c26479fa05d7270355a165273b244beb1f2d56aae"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.175.0/specgen-linux-arm64"
      sha256 "e8a4e36b3c586fae48de5f842ea8a60944fe0c4b99abe4819290e1bc8f176a60"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
