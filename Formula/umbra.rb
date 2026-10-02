class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.245.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.245.0/umbra-darwin-amd64"
      sha256 "f5f372f91a56b8ecb1a22da624c2bc0e3a876a9a74ca453fc87dc143e9072966"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.245.0/umbra-darwin-arm64"
      sha256 "0ed99bd227b6dbe4ce951747129f2bb5beed73f3ead820d94a94d1fb65cecc2e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.245.0/umbra-linux-amd64"
      sha256 "5c1c1c860f4176675f8d4743a639c6275aa2c91976d456bdfd009bdbeed7dee4"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.245.0/umbra-linux-arm64"
      sha256 "7df310f4fe23e48020d6cdec175dc59c85f1bf0bb0c4226f26abc264aeed0a7f"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
