class Ward < Formula
  desc "A contributor-facing umbra consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.889.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.889.0/ward-darwin-arm64"
      sha256 "8ad5e4a59e52e6755a7a7057905380b51918c269c82d1ab652fa798e875f6be2"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.889.0/ward-linux-arm64"
        sha256 "c147b8a0a37315cbf66c8b643a6f7490d456b5e7b2dc8ed7fb46e61ab9240077"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.889.0/ward-darwin-amd64"
      sha256 "f89d8246f30e67e52a8605b10c59c4cef8fcb57475153488d7944fe61765f289"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.889.0/ward-linux-amd64"
        sha256 "8e8060deaf4766be946628afea6f73c7a1a4a8b36020a2fc3bd510e78af0ec37"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.889.0/ward-linux-arm64"
      sha256 "c147b8a0a37315cbf66c8b643a6f7490d456b5e7b2dc8ed7fb46e61ab9240077"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.889.0/ward-linux-amd64"
      sha256 "8e8060deaf4766be946628afea6f73c7a1a4a8b36020a2fc3bd510e78af0ec37"
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
