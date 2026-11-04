class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.265.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.265.0/umbra-darwin-amd64"
      sha256 "6490ed7c37ba7fa9440e99d7ea6dae239acbbdd855cee633d1888011c8c4e8a3"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.265.0/umbra-darwin-arm64"
      sha256 "8447931275883e587b0ece60c8e3998ae22b7f7fdd97c65f053276c00d981b31"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.265.0/umbra-linux-amd64"
      sha256 "6a07d86ea6fbd8965715db607ca6955fa0866bf87fca97647d4e44f2f97f0e14"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.265.0/umbra-linux-arm64"
      sha256 "63e5f593dbf2b27eb9728acd3ef56bc18e1ee662d560174c8f5e97a7fff4ce8c"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
