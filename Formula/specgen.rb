class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.166.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.166.0/specgen-darwin-amd64"
      sha256 "722be4ff809367dc58ec5b6aaf352f6f49110317cfbf381cb18b0defb9acce31"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.166.0/specgen-darwin-arm64"
      sha256 "8af29734e5ae443dd2c1c2f64d92c9c8b40dcdef6cf34bbdc85578cc853cafb6"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.166.0/specgen-linux-amd64"
      sha256 "d441ac31d8decb33b8ddb12ff1277715b0d73d6f9184dc2be998f3e70a5813ff"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.166.0/specgen-linux-arm64"
      sha256 "b02d4ee79d79b23d2b99cf5af565e5daf63f202fa165e2fbf6fec4789b4d8b29"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
