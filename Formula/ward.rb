class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.882.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.882.0/ward-darwin-arm64"
      sha256 "eda3f994a38dbcdd2574d750a80527f7f042513475beb627e154ef150ef82d98"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.882.0/ward-linux-arm64"
        sha256 "654dee076966f15d9cc771030ab50a97e39ba61feb95c293a71570e374968efe"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.882.0/ward-darwin-amd64"
      sha256 "8840c136a8046297674216cab9eb027a055fbffe7347e3a350894f93b3dabf9a"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.882.0/ward-linux-amd64"
        sha256 "bcbe5d1ce969ba7438dca513271805605c7feccec5ab6226b82c06d0e546327a"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.882.0/ward-linux-arm64"
      sha256 "654dee076966f15d9cc771030ab50a97e39ba61feb95c293a71570e374968efe"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.882.0/ward-linux-amd64"
      sha256 "bcbe5d1ce969ba7438dca513271805605c7feccec5ab6226b82c06d0e546327a"
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
