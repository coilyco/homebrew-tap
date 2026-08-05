class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.873.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.873.0/ward-darwin-arm64"
      sha256 "d35d00b3a6f83bd731af464edaaec034ec6e404643c397e15fda91b33d523bb6"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.873.0/ward-linux-arm64"
        sha256 "945310f303105aaef9b53c9847e1520b7ba3845f518d376fa80430402462f5a6"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.873.0/ward-darwin-amd64"
      sha256 "b4536d5a9f291fd5643777f05eec1279a985f3a62977d005039da669fdeeff92"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.873.0/ward-linux-amd64"
        sha256 "b63b572f567169bd7a469d8a40cfba7402f51d32b33f336fb19f10fe8d62b110"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.873.0/ward-linux-arm64"
      sha256 "945310f303105aaef9b53c9847e1520b7ba3845f518d376fa80430402462f5a6"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.873.0/ward-linux-amd64"
      sha256 "b63b572f567169bd7a469d8a40cfba7402f51d32b33f336fb19f10fe8d62b110"
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
