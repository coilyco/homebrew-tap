class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.880.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.880.0/ward-darwin-arm64"
      sha256 "299e424ff96bdbbf08fcc45a9699caf225978f3841878614cd6f4868927c1824"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.880.0/ward-linux-arm64"
        sha256 "34602499d8c7ae1872bc651e8ade5175b734c61c201afb2534f509ddbc12d252"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.880.0/ward-darwin-amd64"
      sha256 "463c05098a281d45c65073a93a475d0a24b28d439740ec6cf7d81d8d9c661db6"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.880.0/ward-linux-amd64"
        sha256 "d52431bdf85ffde9c3aba192ad69d62103e08bde0db332be7f514f3f6364a11f"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.880.0/ward-linux-arm64"
      sha256 "34602499d8c7ae1872bc651e8ade5175b734c61c201afb2534f509ddbc12d252"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.880.0/ward-linux-amd64"
      sha256 "d52431bdf85ffde9c3aba192ad69d62103e08bde0db332be7f514f3f6364a11f"
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
