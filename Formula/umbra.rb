class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.228.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.228.0/umbra-darwin-amd64"
      sha256 "23fee11440e4b1c95a09f1dac1f7e80434b806df40a7b5cdbdb10ea11bb46c50"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.228.0/umbra-darwin-arm64"
      sha256 "844e2eecde2ac86f821656be665b42bbf5ca1e517628991f7b4f4a6c3786c45e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.228.0/umbra-linux-amd64"
      sha256 "4954c6a18c0fa4631a80341a0d7afcb2bf7255e941308aeb6524b3c22cf74de2"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.228.0/umbra-linux-arm64"
      sha256 "927654b5139e50d7742e110b3f61fee5af327752f4105c3a0c058818f6efcd2a"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
