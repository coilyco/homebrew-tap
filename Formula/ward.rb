class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.879.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.879.0/ward-darwin-arm64"
      sha256 "f25d09eb7f4a7d6b01b74eb54ba402a52ea75f0e4404529a3fb14b9d141b7713"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.879.0/ward-linux-arm64"
        sha256 "de3e3274004b2232e5071efacd43e5a256c206ac2ea83c8c4e41bf8699910d03"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.879.0/ward-darwin-amd64"
      sha256 "ef9f3481447e18543e6b63dd33066ca06b9e2e3ef0877afc82d30e9b66f627af"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.879.0/ward-linux-amd64"
        sha256 "c57a7feb4a29eb1b3e1443cf59416bcca9ee1a5bae3dcf9aa71a1242b9fa7036"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.879.0/ward-linux-arm64"
      sha256 "de3e3274004b2232e5071efacd43e5a256c206ac2ea83c8c4e41bf8699910d03"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.879.0/ward-linux-amd64"
      sha256 "c57a7feb4a29eb1b3e1443cf59416bcca9ee1a5bae3dcf9aa71a1242b9fa7036"
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
