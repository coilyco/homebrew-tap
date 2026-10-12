class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.255.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.255.0/umbra-darwin-amd64"
      sha256 "6711e241f9d402e7ed1106176ca89ec4cb98e223764dd33125e589bf897861dd"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.255.0/umbra-darwin-arm64"
      sha256 "2f5f52f3213d4da86863de8dbfb02ea7e1755c9fca4ebd46c6e769fe9e647955"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.255.0/umbra-linux-amd64"
      sha256 "c72bd7e5e24b5b04fa834ce70bcb10cf592e7895313a29fcd33dd4de8e73e3b5"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.255.0/umbra-linux-arm64"
      sha256 "32d91fb69abbc400318b484c4b652039fdd425b73c1f91f55abe2a940072e109"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
