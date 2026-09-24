class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.365.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aos-darwin-arm64"
      sha256 "b9a889e0a53aca168a7487d66be221fdd8f449de1895bdbd066db35d5f2a750d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aoscompose-darwin-arm64"
        sha256 "b9a889e0a53aca168a7487d66be221fdd8f449de1895bdbd066db35d5f2a750d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aosward-darwin-arm64"
        sha256 "b9a889e0a53aca168a7487d66be221fdd8f449de1895bdbd066db35d5f2a750d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aosguard-darwin-arm64"
        sha256 "1371176a6a77693984146a2eab69a37e2c412d4869d2e98e1a6588fabaf9a299"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aterm-darwin-arm64"
        sha256 "6ec65f30e2e2d0015f4fc58076fb13e980cc3dc3c2a34d2d0b1314f4335390c1"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aos-linux-amd64"
      sha256 "f97eaf10274500ff4f13d602ec9f3a1c75a05f8133052dad4af1bdc494d10013"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aoscompose-linux-amd64"
        sha256 "f97eaf10274500ff4f13d602ec9f3a1c75a05f8133052dad4af1bdc494d10013"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aosward-linux-amd64"
        sha256 "f97eaf10274500ff4f13d602ec9f3a1c75a05f8133052dad4af1bdc494d10013"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aosguard-linux-amd64"
        sha256 "784680a5d0a1dfa63fcd42c3ff2f5663d4ad5bbdec85b7b814e99a0fe04938da"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aterm-linux-amd64"
        sha256 "53a7422cffb5709615744bdb90edb01e5443b4a4bf45ea2aa1bad9d2b078a782"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aos-linux-arm64"
      sha256 "02601527ad97779417e9b4fca068e5516405a660fa301bee3c07115a0412e5a3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aoscompose-linux-arm64"
        sha256 "02601527ad97779417e9b4fca068e5516405a660fa301bee3c07115a0412e5a3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aosward-linux-arm64"
        sha256 "02601527ad97779417e9b4fca068e5516405a660fa301bee3c07115a0412e5a3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aosguard-linux-arm64"
        sha256 "72f86b0d57b35d566505ce15c3a92de0a24f007b760f45c7522e5ae69a4fa786"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.365.0/aterm-linux-arm64"
        sha256 "6736e45ba0bb56777564851cbb3250e7d8cce9341104ca32e1d83c9eb03ff0d7"
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
