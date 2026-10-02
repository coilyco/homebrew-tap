class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.241.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.241.0/umbra-darwin-amd64"
      sha256 "b54bff8fe5c4f17e8b93d62f5a8b793ccd2042016448c0329157c777586f80d7"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.241.0/umbra-darwin-arm64"
      sha256 "64f53fc4f33503ad978bee2bacdc1ddd53be1340f0ced125e2679a6a388e5b2e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.241.0/umbra-linux-amd64"
      sha256 "3be8716bcef6f301ff6258d615265a9c61e36d07311a748c5bce6ab46652bce0"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.241.0/umbra-linux-arm64"
      sha256 "cc65a7fefada3a96490f20a07b562c840763557d93506e61dff2e206993ee040"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
