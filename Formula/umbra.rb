class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.236.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.236.0/umbra-darwin-amd64"
      sha256 "c8c72e02942a5edcdc58fbf6696d473947670a852948584a6f091152f5ed8e09"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.236.0/umbra-darwin-arm64"
      sha256 "3dfbe4566db8843b5b2c9c7e9e008d6ec6d3a26e5fb3f726abab76fa0b57e098"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.236.0/umbra-linux-amd64"
      sha256 "b9a1c8488573d4f89d4f61a2aacb0012175b48860dabea7f70003fd549e5dba7"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.236.0/umbra-linux-arm64"
      sha256 "1ef5b761e9b2604829bfec3a742af5d0d196335120bb941d7f3a4e7265a37619"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
