class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.173.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.173.0/specgen-darwin-amd64"
      sha256 "32820301a18d2d5a0bac2d3411476d759fa967bee6c77275619df14f23aa12bc"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.173.0/specgen-darwin-arm64"
      sha256 "7aae14085cf1eaecf7c33fbd056ef6522149b0e18336a3c841aa6b83781ea56a"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.173.0/specgen-linux-amd64"
      sha256 "de6386e9bd15cfdafad950d9790df0ce4ec8ceb72e2205c24b1fabf95c86a9fd"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.173.0/specgen-linux-arm64"
      sha256 "9eaa7d084b2bbc1e00bc7c50da729ba33754c120062dda9707ed64dc28237286"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
