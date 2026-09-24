class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.237.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.237.0/umbra-darwin-amd64"
      sha256 "e981dded46ea0666c1e54ac9285abd9ae2241bbdf3ccfe4d97f1c5150d9b9d61"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.237.0/umbra-darwin-arm64"
      sha256 "c6d195a7e8a80ded8d2982215b9ff0b59b6a2a7af23f1b1e9b383b294cf0c61c"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.237.0/umbra-linux-amd64"
      sha256 "6b8e2ed0d4d86ba383faef84f6288316fd1b8272e788f2db4149047a4202eb67"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.237.0/umbra-linux-arm64"
      sha256 "5fde63206a25724060ccf22eff6a758bc027b448a2f00c47a9aaa317d47fe805"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
