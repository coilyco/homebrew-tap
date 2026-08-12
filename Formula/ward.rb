class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.881.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.881.0/ward-darwin-arm64"
      sha256 "f01249d9853c12b1454a80ca92926b600ed53e9a90afd3c00019cf6e2ca82111"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.881.0/ward-linux-arm64"
        sha256 "4b2840d4bf0c0653d37c5eca411baaa403580499c396495b9d58cd03dbab83b2"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.881.0/ward-darwin-amd64"
      sha256 "697b2581ac95b0a6ea49ad8c5e47d1e4ba1ad28f10b6b0b0bb1e902d698bdf32"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.881.0/ward-linux-amd64"
        sha256 "e1e1bc7338c434a5214dc91f5014221f3893a7be47ba4b5fa1ac287c063f8c22"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.881.0/ward-linux-arm64"
      sha256 "4b2840d4bf0c0653d37c5eca411baaa403580499c396495b9d58cd03dbab83b2"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.881.0/ward-linux-amd64"
      sha256 "e1e1bc7338c434a5214dc91f5014221f3893a7be47ba4b5fa1ac287c063f8c22"
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
