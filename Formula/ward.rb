class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.869.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.869.0/ward-darwin-arm64"
      sha256 "ea4b6354f0a1452ecd632b37e30e47ba6a9c7e4fea04f27692cf572837c221ee"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.869.0/ward-linux-arm64"
        sha256 "5bc1b086f546f4127fe0fd4e8052e09da962b08f5e177bc7d9b0b62bfd60fe57"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.869.0/ward-darwin-amd64"
      sha256 "a0bf18da421700283c4e73aa0c10b0d4cf14eef5d981be21efbdfcd16a8b682b"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.869.0/ward-linux-amd64"
        sha256 "574374d43ab3ffd965ea4ef1f541b212b1639a3e362bf838904af43236b79e04"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.869.0/ward-linux-arm64"
      sha256 "5bc1b086f546f4127fe0fd4e8052e09da962b08f5e177bc7d9b0b62bfd60fe57"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.869.0/ward-linux-amd64"
      sha256 "574374d43ab3ffd965ea4ef1f541b212b1639a3e362bf838904af43236b79e04"
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
