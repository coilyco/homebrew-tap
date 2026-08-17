class Ward < Formula
  desc "A contributor-facing umbra consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.887.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.887.0/ward-darwin-arm64"
      sha256 "8886e328105e3b85bbf66c33fb42bff07fbfef6513ffc8677ee40fec8ecc0fa6"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.887.0/ward-linux-arm64"
        sha256 "c14417f7d79cda082bc125f847bb33d067e6acdbd3d2b4d5251219b8baf830b7"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.887.0/ward-darwin-amd64"
      sha256 "6c63a53944216a5e8931b019790e24019a2528222837cec6fff01da0f1b5dbe2"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.887.0/ward-linux-amd64"
        sha256 "28ce577134cdb47c405bc482f5546f74273654cb0d0a847bb2d43618f07e5fc1"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.887.0/ward-linux-arm64"
      sha256 "c14417f7d79cda082bc125f847bb33d067e6acdbd3d2b4d5251219b8baf830b7"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.887.0/ward-linux-amd64"
      sha256 "28ce577134cdb47c405bc482f5546f74273654cb0d0a847bb2d43618f07e5fc1"
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
