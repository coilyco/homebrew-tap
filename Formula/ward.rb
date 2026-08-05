class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.877.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.877.0/ward-darwin-arm64"
      sha256 "7f76aeb11fe85f5be275346acb5124323ead7fb2f95b8d3f5aaf30b127aab270"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.877.0/ward-linux-arm64"
        sha256 "5966704a0c28c780a2c1dba7a268c1880217300d02f22dbd440ad0cfb57b92bb"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.877.0/ward-darwin-amd64"
      sha256 "0a1cef27124e5bf802e83ab7dff9394c76f16e8abd210fd5cf5da32dbcca2b0f"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.877.0/ward-linux-amd64"
        sha256 "bf5b39a416277d12ef4ac27455c56f9b419bc2fea8676fb62bb5a68ecf3c78c0"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.877.0/ward-linux-arm64"
      sha256 "5966704a0c28c780a2c1dba7a268c1880217300d02f22dbd440ad0cfb57b92bb"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.877.0/ward-linux-amd64"
      sha256 "bf5b39a416277d12ef4ac27455c56f9b419bc2fea8676fb62bb5a68ecf3c78c0"
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
