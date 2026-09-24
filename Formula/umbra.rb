class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.232.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.232.0/umbra-darwin-amd64"
      sha256 "0d8170bc1dafe625bf0a5e31a71d7af50d147d82d2a53a1829821183a5047075"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.232.0/umbra-darwin-arm64"
      sha256 "a2bb8a9590b60f7f3ea78dfc85e322b4ef0c3f0568fea15df1f7e9731a8a182b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.232.0/umbra-linux-amd64"
      sha256 "f8ebd18a26bdff4333ad2f5d822df1e601bf0ee43042a99e050cf0c1a5571dc5"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.232.0/umbra-linux-arm64"
      sha256 "07f6a6dab0b889e633ec316f26c3e79ffd1e75b41b3eb2e7c999c6a5e1e5cc29"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
