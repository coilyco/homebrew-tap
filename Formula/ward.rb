class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.865.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.865.0/ward-darwin-arm64"
      sha256 "66453e81e69648906ce29d07564b339f6b3faca2eedd1acb406e64bd3188adba"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.865.0/ward-linux-arm64"
        sha256 "c9de2a0451abbdbc773ab6146ae61fba16cadd6911e75199d53b4b55cf9c0fcd"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.865.0/ward-darwin-amd64"
      sha256 "c03bf5a0d608ec68aeb694fb167ed112b9ca108c5581bafb99d8c82f2c8448eb"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.865.0/ward-linux-amd64"
        sha256 "cb68f7eb247fbed7b757cb8fab1853f601eeb212e5c48e86229bc724cd0a0fa2"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.865.0/ward-linux-arm64"
      sha256 "c9de2a0451abbdbc773ab6146ae61fba16cadd6911e75199d53b4b55cf9c0fcd"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.865.0/ward-linux-amd64"
      sha256 "cb68f7eb247fbed7b757cb8fab1853f601eeb212e5c48e86229bc724cd0a0fa2"
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
