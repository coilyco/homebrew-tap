class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.254.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.254.0/umbra-darwin-amd64"
      sha256 "2240036e58ffe6d9b2f6dbe66c0d3810b0017a424ca4d05946e3851ae974146e"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.254.0/umbra-darwin-arm64"
      sha256 "a553e8a5ccdd66fe582eaac12ce760befac4d2ba3803f7098dae59fb7d1921eb"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.254.0/umbra-linux-amd64"
      sha256 "eb5ec1f5b5b4766803b4a98b4c4e062a32c92c057cfabdc237a9af8f8b55fa3b"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.254.0/umbra-linux-arm64"
      sha256 "457a3a087c402a077a7610e7a7f034ad729e708a3a3717bb157d3ab2d9ded7b2"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
