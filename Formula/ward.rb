class Ward < Formula
  desc "A contributor-facing umbra consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.890.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.890.0/ward-darwin-arm64"
      sha256 "f76ae9cc1f013f7c97059c7144714e8631a535e365a91609a34ca2db199b49f3"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.890.0/ward-linux-arm64"
        sha256 "97f04059908378d051cca377ae9057f7c4f82cd661b1f63641d783b4a320a71a"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.890.0/ward-darwin-amd64"
      sha256 "be94b7306c1ae9d7f831da62499409f9900894a4c8a605e436fe9fdef12dec63"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.890.0/ward-linux-amd64"
        sha256 "4db861852876f9a43eee37485f6a6e5fae5e028f41cb08987d1c39d4a51ce947"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.890.0/ward-linux-arm64"
      sha256 "97f04059908378d051cca377ae9057f7c4f82cd661b1f63641d783b4a320a71a"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.890.0/ward-linux-amd64"
      sha256 "4db861852876f9a43eee37485f6a6e5fae5e028f41cb08987d1c39d4a51ce947"
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
