class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.249.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.249.0/umbra-darwin-amd64"
      sha256 "2a140eafa766fc3c38b160eccffe12fca401ce9484142158385d9b767045418c"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.249.0/umbra-darwin-arm64"
      sha256 "646ae791d9c2d156d2af105de331c6d15370674451b96465308a8fcb3e3b3b86"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.249.0/umbra-linux-amd64"
      sha256 "16e2cab9d0adfe0c424af8e7733080497018367073c0c3750484d7aa5cbd4fe5"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.249.0/umbra-linux-arm64"
      sha256 "bb681683b56437a5bfa4e8df759ca406694ce0690ce3f41fcc09b978378d1295"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
