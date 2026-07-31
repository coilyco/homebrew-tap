class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.866.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.866.0/ward-darwin-arm64"
      sha256 "f2579525a6579f523702fc505a05852d153ba53e7323cd75ac50d1ffa232d525"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.866.0/ward-linux-arm64"
        sha256 "1e8dd9853e2b4a450b3f68ffe1734ffb25e64f5f4fede0cedb2a1ea94f924441"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.866.0/ward-darwin-amd64"
      sha256 "7ccaf5af085f0420052d4c9553e9b5f7e0479f4acc936dd3c317db96224ded4d"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.866.0/ward-linux-amd64"
        sha256 "2f2c527975189ae6c7da8b9e4ef19535575777daf5afef9cf5feedb690d9693f"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.866.0/ward-linux-arm64"
      sha256 "1e8dd9853e2b4a450b3f68ffe1734ffb25e64f5f4fede0cedb2a1ea94f924441"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.866.0/ward-linux-amd64"
      sha256 "2f2c527975189ae6c7da8b9e4ef19535575777daf5afef9cf5feedb690d9693f"
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
