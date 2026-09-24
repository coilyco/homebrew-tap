class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.240.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.240.0/umbra-darwin-amd64"
      sha256 "eb9fc59cde16ca4f5268506967c0e4b13d7cea405c1c4d8c17498e4b292fd9a4"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.240.0/umbra-darwin-arm64"
      sha256 "08d1c3327ab2b1b1ba0cd0ee464b60d0ec25481c4af55d8017e2ab31389fcabd"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.240.0/umbra-linux-amd64"
      sha256 "192aa55ecff9770599c98dbbc0f389219ccca2e52278a1514b233907500907cd"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.240.0/umbra-linux-arm64"
      sha256 "ab051fb83868dc503b4cb4ba3da56edb39f4f70493934a686c3b901c94d7a6c2"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
