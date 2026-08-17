class Ward < Formula
  desc "A contributor-facing umbra consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.886.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.886.0/ward-darwin-arm64"
      sha256 "004bd8069cd268340d8cdea561592976a514d7fe7a96079f158cc8f298a6b8ff"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.886.0/ward-linux-arm64"
        sha256 "b9c2535d800aa50329d870e2a1599037df5f0b0f97d06f2143c9e09bd9436399"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.886.0/ward-darwin-amd64"
      sha256 "b9fa334abae31abf65d105ee6785dda4b5fcfb3fda62a61e12d98ffc3b2dde24"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.886.0/ward-linux-amd64"
        sha256 "81bcf20e2c7178c910e2f0e5f6723e6fa4c8b5c296d5c438fd61e50d10a4b9a2"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.886.0/ward-linux-arm64"
      sha256 "b9c2535d800aa50329d870e2a1599037df5f0b0f97d06f2143c9e09bd9436399"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.886.0/ward-linux-amd64"
      sha256 "81bcf20e2c7178c910e2f0e5f6723e6fa4c8b5c296d5c438fd61e50d10a4b9a2"
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
