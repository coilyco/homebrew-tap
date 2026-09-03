class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.196.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.196.0/umbra-darwin-amd64"
      sha256 "649102aae87aff32c4932b3b3ae61adf326b5e2c508d11c9e844bd491bbbcb0a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.196.0/umbra-darwin-arm64"
      sha256 "defac1e8aa7e87e40d323f1fe8975388e7d7e076c97e0962ab56957c0acc53fa"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.196.0/umbra-linux-amd64"
      sha256 "bda96a0e9c43a9929431aa6ca695ea9d3603d44db28b0d46ab4f47ba6b3b3cff"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.196.0/umbra-linux-arm64"
      sha256 "a4a7fbd688d85b9ffcdb2c2eed376413286ab6c334d89f01726d076507a1c619"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
