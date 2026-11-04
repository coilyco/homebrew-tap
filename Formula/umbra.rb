class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.264.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.264.0/umbra-darwin-amd64"
      sha256 "14f9231966be10e7187fd09740719b1d87e2f3d4c093b94d4214ea9e645f1726"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.264.0/umbra-darwin-arm64"
      sha256 "3c400542a0b385ddfcb168a42306eabcf328b488cc97e642b39d2b0f46e6b5c9"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.264.0/umbra-linux-amd64"
      sha256 "6f248a538abe10fc971975d76b310ed31a7b0907e1e723d518532fa51ebf613a"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.264.0/umbra-linux-arm64"
      sha256 "a3ca6809ea0ab8ebd57a93fa3be64a51c5a3418230ea87c566d221bcf01c0c67"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
