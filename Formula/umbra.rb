class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.217.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.217.0/umbra-darwin-amd64"
      sha256 "ad8ccf9b2de5558568c253a1a28b8f93d05d313eb2fe3f1ebb62c59b6f09ad89"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.217.0/umbra-darwin-arm64"
      sha256 "10e9742a210f2db65ed73a27614d6059f04c8d8277146689645261c9ef302602"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.217.0/umbra-linux-amd64"
      sha256 "1f250a18d9d9cdb5ea0efc38aa980fc0578db7ba9be39a6e2e86f7c1ae143413"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.217.0/umbra-linux-arm64"
      sha256 "0f30fdc51f19147bc765b377e37c64b18c2066b89965c0a3823b7cc47aec98ac"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
