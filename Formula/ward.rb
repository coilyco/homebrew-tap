class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.874.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.874.0/ward-darwin-arm64"
      sha256 "ec5495d574ae31b6627979c9972a3500e21536e1abfae21e59de01700d6b3f30"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.874.0/ward-linux-arm64"
        sha256 "a0375f9e04aa058a0c7b8c2fe5b694e4bfc6eca2a95835225c193102e59edebc"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.874.0/ward-darwin-amd64"
      sha256 "21c85e2edf548d6ff26a9a1126858e18978c07945de90fa2f2795f31682ff670"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.874.0/ward-linux-amd64"
        sha256 "995d45da3a96edcfe79f0be3f0291286575cec093f612bb80bc5c5e466fedb4b"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.874.0/ward-linux-arm64"
      sha256 "a0375f9e04aa058a0c7b8c2fe5b694e4bfc6eca2a95835225c193102e59edebc"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.874.0/ward-linux-amd64"
      sha256 "995d45da3a96edcfe79f0be3f0291286575cec093f612bb80bc5c5e466fedb4b"
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
