class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.206.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.206.0/umbra-darwin-amd64"
      sha256 "51cf350f3e480c744bc524d4c3ab4177b1e0f510a2e56521e59a381c1c829d07"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.206.0/umbra-darwin-arm64"
      sha256 "a869a10240a90aecc35fb2281f62c54ba7200ee798b8e760554ae075e1b7f230"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.206.0/umbra-linux-amd64"
      sha256 "7c43df8afb29fa65fe43c0923a6a58185a00a2fb60a9cfe80a5105bd18a5df57"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.206.0/umbra-linux-arm64"
      sha256 "d44300a74e6ffa4629725973ed2a788ff0ca7a40a7f7966654b626572a3dd2b5"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
