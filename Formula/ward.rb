class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.870.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.870.0/ward-darwin-arm64"
      sha256 "38b27c6ad694d5d891497ce64763fd663dadaec69159c5dab99a7f4e4e0a14e1"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.870.0/ward-linux-arm64"
        sha256 "7478cb84da0edd046af09e2797866b630a4fe9ffcfa50a7d97740959769be437"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.870.0/ward-darwin-amd64"
      sha256 "aa12b1cea6185b5a1820c6ff6880729186eec800530e22f783f0d18119f10927"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.870.0/ward-linux-amd64"
        sha256 "adc244a4944e5ab90731eb0461dce0574be54d18f6b8846c163280d0eeb1cb34"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.870.0/ward-linux-arm64"
      sha256 "7478cb84da0edd046af09e2797866b630a4fe9ffcfa50a7d97740959769be437"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.870.0/ward-linux-amd64"
      sha256 "adc244a4944e5ab90731eb0461dce0574be54d18f6b8846c163280d0eeb1cb34"
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
