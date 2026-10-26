class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.256.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.256.0/umbra-darwin-amd64"
      sha256 "11658c854ac324b39d6a971bae1921a7d529b9aed037013a3a63360582ee05a5"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.256.0/umbra-darwin-arm64"
      sha256 "ab2d6ef36fd2736fb33cb7df21b1fcdf8756a0a3089b4be5ec0eb2ac28922d57"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.256.0/umbra-linux-amd64"
      sha256 "6e85573e2f5bb61031e600523c5b2fc3f1afcd98cc5edce8a3a424486db3b668"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.256.0/umbra-linux-arm64"
      sha256 "9a4776415783f23879e1d3027619fc3f907879cfb155fe5be7f423986ffb464c"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
