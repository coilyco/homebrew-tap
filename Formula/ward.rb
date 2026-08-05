class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.876.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.876.0/ward-darwin-arm64"
      sha256 "6c1e2677f63971d0f12707bf0e33132a35ff137ecbbcdc90a00a6f1795ea97ae"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.876.0/ward-linux-arm64"
        sha256 "060825902c51b77c5b39161cabd5a60ee93f0cb039f456df1cd415cf9653206c"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.876.0/ward-darwin-amd64"
      sha256 "a4ee87e90498e02304a3e8a31878a0baba1e4fad80db4293ba3f7dc98ed34fb0"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.876.0/ward-linux-amd64"
        sha256 "16464ecb85a94ffde8455b0ed4f8a89d912e5efb59dff919a92b9005cf18bb81"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.876.0/ward-linux-arm64"
      sha256 "060825902c51b77c5b39161cabd5a60ee93f0cb039f456df1cd415cf9653206c"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.876.0/ward-linux-amd64"
      sha256 "16464ecb85a94ffde8455b0ed4f8a89d912e5efb59dff919a92b9005cf18bb81"
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
