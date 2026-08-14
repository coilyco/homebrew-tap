class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.883.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.883.0/ward-darwin-arm64"
      sha256 "455e92b46c78bc5416e1a20107d4f6a4384186eaf670b1a9793e62a10753e7a4"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.883.0/ward-linux-arm64"
        sha256 "151047eb12e0882a3f921cf1507cb88ca97056353fe3a0d7927ef9ce8f12c43c"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.883.0/ward-darwin-amd64"
      sha256 "38ea9d8837d59d3f4454bfc3dc5b107bd378356b1818a8dd4455dcf6bec37ed6"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.883.0/ward-linux-amd64"
        sha256 "062c9b0a3f3c0dc9545106f90f83dcecc674544b20bb9e56786071bc4af955f9"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.883.0/ward-linux-arm64"
      sha256 "151047eb12e0882a3f921cf1507cb88ca97056353fe3a0d7927ef9ce8f12c43c"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.883.0/ward-linux-amd64"
      sha256 "062c9b0a3f3c0dc9545106f90f83dcecc674544b20bb9e56786071bc4af955f9"
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
