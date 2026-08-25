class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.168.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.168.0/specgen-darwin-amd64"
      sha256 "7143a4343ad198a86828b39aa80531151d460a63b4510d1bb6013deed8198ee6"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.168.0/specgen-darwin-arm64"
      sha256 "a098a93d1ba5ac6485379127cdb8c67e846fc15a5e3e26b58c314478fc39c81d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.168.0/specgen-linux-amd64"
      sha256 "cf270dce9edc8edc7059e89d4ee55632685982f75283e5c8af44d32908081d68"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.168.0/specgen-linux-arm64"
      sha256 "1a3bddca68bde2271fa58ada20ba7d4bafeedd8e890cf15db167108c9469352b"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
