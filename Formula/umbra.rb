class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.244.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.244.0/umbra-darwin-amd64"
      sha256 "13efa05a7fb38134a2a3685da5d3e9f957528157486a1ac535e3a8828ffcdecd"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.244.0/umbra-darwin-arm64"
      sha256 "4a37cb28a0d2d9591f4724a5b16482a88236e1cc1f1242a2a02a42c35d01e4a2"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.244.0/umbra-linux-amd64"
      sha256 "5c4a88948674fe11479e7e8286897772cae6efaa7766ec201e085c3278808592"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.244.0/umbra-linux-arm64"
      sha256 "d1e71c1ae0cf78452a97aad867029c8a24b9dec6daeab20eb8ec670c64a68424"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
