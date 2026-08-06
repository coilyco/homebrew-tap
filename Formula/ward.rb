class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.878.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.878.0/ward-darwin-arm64"
      sha256 "3ff063c9b064263b7399e56f51e1034a504542fccf7b05b145d45ca9f71f91cc"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.878.0/ward-linux-arm64"
        sha256 "96104ea411c1df098699e49a713af5eb4881fd48c0de76a3cd928c24e2db2d8f"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.878.0/ward-darwin-amd64"
      sha256 "cebacb751556157b1677e8617d91117ebb1fa4c92a1a7d32d318498faf8b8646"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.878.0/ward-linux-amd64"
        sha256 "f7aa3ff6b35b57908ceafa0c174df3fd1ffd7373c50b48a199c838a00a3e4b17"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.878.0/ward-linux-arm64"
      sha256 "96104ea411c1df098699e49a713af5eb4881fd48c0de76a3cd928c24e2db2d8f"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.878.0/ward-linux-amd64"
      sha256 "f7aa3ff6b35b57908ceafa0c174df3fd1ffd7373c50b48a199c838a00a3e4b17"
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
