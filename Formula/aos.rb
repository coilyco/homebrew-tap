class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.261.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aos-darwin-arm64"
      sha256 "9505509141cc8d2ec8ab3d172b943089e29a170bb50e88954e3a4f504df9a34d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aoscompose-darwin-arm64"
        sha256 "9505509141cc8d2ec8ab3d172b943089e29a170bb50e88954e3a4f504df9a34d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aosward-darwin-arm64"
        sha256 "9505509141cc8d2ec8ab3d172b943089e29a170bb50e88954e3a4f504df9a34d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aosguard-darwin-arm64"
        sha256 "fc933fdc7114e7750085ee28082dea40e06ba1911fdf9aa3d8f853d1b4216205"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aterm-darwin-arm64"
        sha256 "090f6b33117899a13c4930974ba98265c94d1b958278d83c5de69c840d64f552"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aos-linux-amd64"
      sha256 "844bd332e5212f6f7d125817d9f3afbf9b0109bc8a1b10372a9ea626a7c1c432"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aoscompose-linux-amd64"
        sha256 "844bd332e5212f6f7d125817d9f3afbf9b0109bc8a1b10372a9ea626a7c1c432"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aosward-linux-amd64"
        sha256 "844bd332e5212f6f7d125817d9f3afbf9b0109bc8a1b10372a9ea626a7c1c432"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aosguard-linux-amd64"
        sha256 "1cda24ca5ee5e10c7b5dc6550bef44b4ebd5067df78c479e851508d88d0947c2"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aterm-linux-amd64"
        sha256 "c661f9e5e3d97b8cb1c605ef6b856f6b7e7d748a8b12df3bbbc3ae7152a2df9c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aos-linux-arm64"
      sha256 "7023d957505a00feadde5fd36b6117a76b6edfeffc744fcf1f885c09ed41ce72"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aoscompose-linux-arm64"
        sha256 "7023d957505a00feadde5fd36b6117a76b6edfeffc744fcf1f885c09ed41ce72"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aosward-linux-arm64"
        sha256 "7023d957505a00feadde5fd36b6117a76b6edfeffc744fcf1f885c09ed41ce72"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aosguard-linux-arm64"
        sha256 "6560c2336606bc5b4345301220e3a20bc5164cea8d08802037d9fc468d7c28bf"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.261.0/aterm-linux-arm64"
        sha256 "8bbdbfec314e01e8ddd8f85228d69f9f770770caa458c8c63eaf626d4080d8c1"
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
