class Ward < Formula
  desc "A contributor-facing umbra consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.885.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.885.0/ward-darwin-arm64"
      sha256 "eaab53a6301062208b188fb6caa652b4d097e4dff7358dc04f2d6e9156c9bdc5"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.885.0/ward-linux-arm64"
        sha256 "55c10bfd285cb0a7598c85b6769fd1b6c618bf3376dc92764bef60b8f5b76426"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.885.0/ward-darwin-amd64"
      sha256 "363b03228d9decccb319dcaea6fc1d09c7ff7c73fcef6d7c1c9a03eab4ba98cb"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.885.0/ward-linux-amd64"
        sha256 "5f470cb916e785647c95a91ebdd0c8e2af4ea7cc1946db8222a2c72eaecdc480"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.885.0/ward-linux-arm64"
      sha256 "55c10bfd285cb0a7598c85b6769fd1b6c618bf3376dc92764bef60b8f5b76426"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.885.0/ward-linux-amd64"
      sha256 "5f470cb916e785647c95a91ebdd0c8e2af4ea7cc1946db8222a2c72eaecdc480"
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
