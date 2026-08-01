class Ward < Formula
  desc "A contributor-facing cli-guard consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.867.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.867.0/ward-darwin-arm64"
      sha256 "a98b00937c48e05d7050ee9ffecd922f54105f6f58bf1343a9b39fe40313ee6f"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.867.0/ward-linux-arm64"
        sha256 "a9cb8c3a51c51ef4c79cca3d0c8b0dd252266cf7db7f44f42f3ed2e4226809e7"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.867.0/ward-darwin-amd64"
      sha256 "b7b48f75ee70b3ceb633c216e72ef5cf1e2b1eb980f9d63ea086e99b6cbd6234"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.867.0/ward-linux-amd64"
        sha256 "e6418ade343df74462265535ff40697259f42a325b2736250cb2f42b0c6c51e6"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.867.0/ward-linux-arm64"
      sha256 "a9cb8c3a51c51ef4c79cca3d0c8b0dd252266cf7db7f44f42f3ed2e4226809e7"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.867.0/ward-linux-amd64"
      sha256 "e6418ade343df74462265535ff40697259f42a325b2736250cb2f42b0c6c51e6"
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
