class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.370.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aos-darwin-arm64"
      sha256 "25cfb4080903d9ac18c827b62a27e74488bf4c560e0df7182fa8bf1bddc8890b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aoscompose-darwin-arm64"
        sha256 "25cfb4080903d9ac18c827b62a27e74488bf4c560e0df7182fa8bf1bddc8890b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aosward-darwin-arm64"
        sha256 "25cfb4080903d9ac18c827b62a27e74488bf4c560e0df7182fa8bf1bddc8890b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aosguard-darwin-arm64"
        sha256 "3a6f5e07d70cfeb2b5a19f0e3d588d6f511747c43fe78034df848a7d0b4cc222"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aterm-darwin-arm64"
        sha256 "2d13d161a5ba45fa3254a5483b695cb2cb680021da8b081555182a12b0fb2a80"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aos-linux-amd64"
      sha256 "bf7da479098be57dd26daaa6c952cc066b61eccceef69d7f850f468d9241b63b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aoscompose-linux-amd64"
        sha256 "bf7da479098be57dd26daaa6c952cc066b61eccceef69d7f850f468d9241b63b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aosward-linux-amd64"
        sha256 "bf7da479098be57dd26daaa6c952cc066b61eccceef69d7f850f468d9241b63b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aosguard-linux-amd64"
        sha256 "f6e79aa3c67b78711960c92f6e5bcee73703c8d792ac0a704e2ced472a80f30e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aterm-linux-amd64"
        sha256 "fb79f59dc8e82c8a05d9c394b92e9ca4e060f5c1e5b13453ea1a3c8b6509df6b"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aos-linux-arm64"
      sha256 "b0160ec4ed79e12f861840d0d20b9f7fdbb9851eefbb4cad684343c0ec5e2094"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aoscompose-linux-arm64"
        sha256 "b0160ec4ed79e12f861840d0d20b9f7fdbb9851eefbb4cad684343c0ec5e2094"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aosward-linux-arm64"
        sha256 "b0160ec4ed79e12f861840d0d20b9f7fdbb9851eefbb4cad684343c0ec5e2094"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aosguard-linux-arm64"
        sha256 "7add42a713b711916a99a06558a71c18f79500652d9bf276250297469faa071c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.370.0/aterm-linux-arm64"
        sha256 "1fb332de076c46a16611006395b6333906fa8e465c3dd4468d51fceada6b5743"
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
