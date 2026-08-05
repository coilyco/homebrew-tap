class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.872.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.872.0/ward-darwin-arm64"
      sha256 "7df3f5da274f7c515efa752d4627f453db82914f6efbbb60f63e52a0884d4f8f"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.872.0/ward-linux-arm64"
        sha256 "0d489d836017f2c05030fba0769b8ddb1ca1f0237cf6e5bfd690201a9ecbba74"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.872.0/ward-darwin-amd64"
      sha256 "4bb77e14ba3f4a038434ef773e2e7233563c180f580aca2065f5ad05a54e69bd"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.872.0/ward-linux-amd64"
        sha256 "c40222fb441f214fb6259a6202d3de9facdaee94d663cdfdbab21003360bc54c"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.872.0/ward-linux-arm64"
      sha256 "0d489d836017f2c05030fba0769b8ddb1ca1f0237cf6e5bfd690201a9ecbba74"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.872.0/ward-linux-amd64"
      sha256 "c40222fb441f214fb6259a6202d3de9facdaee94d663cdfdbab21003360bc54c"
    end
  end

  def install
    asset =
      if OS.mac?
        Hardware::CPU.arm? ? "ward-darwin-arm64" : "ward-darwin-amd64"
      else
        Hardware::CPU.arm? ? "ward-linux-arm64" : "ward-linux-amd64"
      end

    chmod 0555, asset
    bin.install asset => "ward"

    if OS.mac?
      resource("ward-linux").stage do
        sidecar = Hardware::CPU.arm? ? "ward-linux-arm64" : "ward-linux-amd64"
        chmod 0555, sidecar
        libexec.install sidecar
      end
    end

    bin.install_symlink "ward" => "warded"

  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/ward version")
    # The warded multicall shim must be on PATH and point at the ward binary.
    assert_predicate bin/"warded", :symlink?
    assert_equal (bin/"ward").realpath, (bin/"warded").realpath
  end
end
