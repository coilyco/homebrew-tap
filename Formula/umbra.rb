class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.253.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.253.0/umbra-darwin-amd64"
      sha256 "a48c78c875b3aee2fd60a9a7b685c485e1204da9b6a875c3485cd2e3a9874010"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.253.0/umbra-darwin-arm64"
      sha256 "fee916952b9b4caaa97d7ac0c32d76839a1f9aa1fa4536c505b85cc1a5d41909"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.253.0/umbra-linux-amd64"
      sha256 "e6aeec458fc895bc4930b8fd81d9bfefb714e010e01182d51b58e4e03691b67f"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.253.0/umbra-linux-arm64"
      sha256 "52c5b61d3f2bfa9c6a84dc896671df67e0f18eabd7df24eb7d447ad9fa991b10"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
