class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.258.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aos-darwin-arm64"
      sha256 "05f0d5cda1e0daae29ee215b37ca6b32590453ddf68fdf668cc498282d793926"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aoscompose-darwin-arm64"
        sha256 "05f0d5cda1e0daae29ee215b37ca6b32590453ddf68fdf668cc498282d793926"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aosward-darwin-arm64"
        sha256 "05f0d5cda1e0daae29ee215b37ca6b32590453ddf68fdf668cc498282d793926"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aosguard-darwin-arm64"
        sha256 "c893e7e0e40a5f1ce83f2eb442a4592560f383137cd3384d2f7de91cf5682775"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aterm-darwin-arm64"
        sha256 "80aafcefc3295ba7f1f841d209f8a7ee6efcb65292a2a59ab096fa1adfb7605e"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aos-linux-amd64"
      sha256 "a8ba73dea541e7e2022fbb81f41b5c57c5232c7f3725fd3a39ac6b84604c07d8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aoscompose-linux-amd64"
        sha256 "a8ba73dea541e7e2022fbb81f41b5c57c5232c7f3725fd3a39ac6b84604c07d8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aosward-linux-amd64"
        sha256 "a8ba73dea541e7e2022fbb81f41b5c57c5232c7f3725fd3a39ac6b84604c07d8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aosguard-linux-amd64"
        sha256 "a3f087262762271edbe12ae8f5d3152025b9c097a493cd703afcfd7db29d99b1"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aterm-linux-amd64"
        sha256 "8134e12747e8ea9d2e87dd5559ea83301831d970ddc8bcf510a6416d07870f71"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aos-linux-arm64"
      sha256 "f6794cc9a3bbb8227de42e1f19b0bfb9fd56f434d1d2962e772ddde328fa4195"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aoscompose-linux-arm64"
        sha256 "f6794cc9a3bbb8227de42e1f19b0bfb9fd56f434d1d2962e772ddde328fa4195"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aosward-linux-arm64"
        sha256 "f6794cc9a3bbb8227de42e1f19b0bfb9fd56f434d1d2962e772ddde328fa4195"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aosguard-linux-arm64"
        sha256 "d7c9b1a81e341c132a4f9fe64a26684301a74505bcd2ee31c8a3e616798829cc"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.258.0/aterm-linux-arm64"
        sha256 "1b03781aea6b92ea297ec603b3c116b2fcdbefa18331702b795e87e9da03e865"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
