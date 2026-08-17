class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.149.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.149.0/specgen-darwin-amd64"
      sha256 "f3cebadcd9b23f9e54d3dac88b835744334ee19f6340d803b96c4fa009e1a0a7"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.149.0/specgen-darwin-arm64"
      sha256 "75bf40354a6faefe05e2bd9e932b85707ade9b8f25fb17cfc70ad1852468d2f1"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.149.0/specgen-linux-amd64"
      sha256 "8af718b87ba4447b867f5d095878a1f805e4cd6c43be3f7956e595676284776e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.149.0/specgen-linux-arm64"
      sha256 "141b2e95b2cf3db1faaa441b04297c414a6bae0c225ddd774a381c4746e010f6"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
