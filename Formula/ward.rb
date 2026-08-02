class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.868.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.868.0/ward-darwin-arm64"
      sha256 "e7f030b6226575b1cbbce3fa345d7ebd00f15da3390dd6721857750cae1cce23"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.868.0/ward-linux-arm64"
        sha256 "0bce98ac1beee581c8a575925b6268c43bad6ccd1f8a6e3b29d6ac365dbc1169"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.868.0/ward-darwin-amd64"
      sha256 "99e2271f43af3fb45a679f30b48bb2b682381c0b6361143ae4ce24fb04114ffc"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.868.0/ward-linux-amd64"
        sha256 "c13a0989551bc49efe116865d7113056aa9009d2743d4fe2cbfe634c1710c2c9"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.868.0/ward-linux-arm64"
      sha256 "0bce98ac1beee581c8a575925b6268c43bad6ccd1f8a6e3b29d6ac365dbc1169"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.868.0/ward-linux-amd64"
      sha256 "c13a0989551bc49efe116865d7113056aa9009d2743d4fe2cbfe634c1710c2c9"
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
