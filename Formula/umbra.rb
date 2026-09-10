class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.215.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.215.0/umbra-darwin-amd64"
      sha256 "d84a69e54b8449c72e7c77e6412d08477d9643d5c0505827fd5ae4f68f3a5f1f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.215.0/umbra-darwin-arm64"
      sha256 "1ee1179a93f785f7a5a7f64d18d162cd3c5b7260bdab5c05a567a4a67947ee12"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.215.0/umbra-linux-amd64"
      sha256 "0a1ce27ba2f705f7229a6e55705b15fcd3081e401f4644f9379852a7ba451a58"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.215.0/umbra-linux-arm64"
      sha256 "b304712b1fa3ab40d5a29ff3ec2a3520441719ce6874a65cde214d1d7cd9eaa0"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
