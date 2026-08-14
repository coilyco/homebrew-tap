class Ward < Formula
  desc "A contributor-facing umbra consumer"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/ward"
  version "0.884.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.884.0/ward-darwin-arm64"
      sha256 "ccc5b909cee298f1e8de5c27c401316a4d4cc766f1e853458a812ea5c3a62bf0"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.884.0/ward-linux-arm64"
        sha256 "6c145e05d033c842d6b754712e3c963bf18f04c166fca43d8fd97e1085b26ff7"
      end
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.884.0/ward-darwin-amd64"
      sha256 "1acfe37c2fd8e8fa24092823694cda5f6874978a00b5e623b1fd72cf4aafe3a9"
      resource "ward-linux" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.884.0/ward-linux-amd64"
        sha256 "9e83296e136cc917a329fd7b5f3e9959fab9e8a938090f710fdb25d1c9f536b1"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.884.0/ward-linux-arm64"
      sha256 "6c145e05d033c842d6b754712e3c963bf18f04c166fca43d8fd97e1085b26ff7"
    else
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/ward/releases/download/v0.884.0/ward-linux-amd64"
      sha256 "9e83296e136cc917a329fd7b5f3e9959fab9e8a938090f710fdb25d1c9f536b1"
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
