class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.153.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.153.0/specgen-darwin-amd64"
      sha256 "0a565ba4d87ee5814619c43808ffe69498b045ab3f41eb823ee05e73b8da1940"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.153.0/specgen-darwin-arm64"
      sha256 "83462ffaf460ea91c4d876fa2ea81503d011d15618aecf7ee00dd76c2599a7ef"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.153.0/specgen-linux-amd64"
      sha256 "6eb8dce80160f69baca4b0337b958b56ecabc4273a5dcb2df67a6a0610f95892"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.153.0/specgen-linux-arm64"
      sha256 "c520a5f81d49bb0aa41487ad99aea74a01d8983c61045e9f8566da09f7574ac4"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
