class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.875.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.875.0/ward-darwin-arm64"
      sha256 "6fb89fb7bac093c8614cefa0aee9b2cd02661ada15bec562ddd174d670cbd289"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.875.0/ward-linux-arm64"
        sha256 "671e9581581b100c9dc7d356513b25272fd6960936673f2bdea6a35ef6f7d9a5"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.875.0/ward-darwin-amd64"
      sha256 "3fb9df87937d154522199013b79551b6bc876e289467e725e1dbf1f570014144"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.875.0/ward-linux-amd64"
        sha256 "d88005af5bf55289a004b3a77ba4be50f72f90582ff7dba72ce1d1182fea4ac0"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.875.0/ward-linux-arm64"
      sha256 "671e9581581b100c9dc7d356513b25272fd6960936673f2bdea6a35ef6f7d9a5"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.875.0/ward-linux-amd64"
      sha256 "d88005af5bf55289a004b3a77ba4be50f72f90582ff7dba72ce1d1182fea4ac0"
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
