class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.871.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.871.0/ward-darwin-arm64"
      sha256 "0875496b36c6dfafa5b0b882db0e8532d4dbd219fbd52d8cf7d8bc3841a46011"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.871.0/ward-linux-arm64"
        sha256 "5f8590dd46218b2e3a83c50ec617e6457123149f17df5485203c2d35ab5abcbf"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.871.0/ward-darwin-amd64"
      sha256 "66941863591bd2b43ef152fad93fc5799fee11ca29323e1000977ea88e9d182d"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.871.0/ward-linux-amd64"
        sha256 "4e9578168c0e5f03863d2443f5c3d9dabd96e7fe4fb93672581d74c8adb6b356"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.871.0/ward-linux-arm64"
      sha256 "5f8590dd46218b2e3a83c50ec617e6457123149f17df5485203c2d35ab5abcbf"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.871.0/ward-linux-amd64"
      sha256 "4e9578168c0e5f03863d2443f5c3d9dabd96e7fe4fb93672581d74c8adb6b356"
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
