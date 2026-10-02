class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.414.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aos-darwin-arm64"
      sha256 "7fadd4ffc17d442239a23606ffd103f56f2d7a3ed8c5ab7fa76b268cd3376ea0"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aoscompose-darwin-arm64"
        sha256 "7fadd4ffc17d442239a23606ffd103f56f2d7a3ed8c5ab7fa76b268cd3376ea0"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aosward-darwin-arm64"
        sha256 "7fadd4ffc17d442239a23606ffd103f56f2d7a3ed8c5ab7fa76b268cd3376ea0"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aosguard-darwin-arm64"
        sha256 "d96035ce33684327012c3c8800b2a2c768dac482be7f791bc3cad3dd0a40266e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aterm-darwin-arm64"
        sha256 "56fc09eb0d41a38c06a13a5f1600a10af2f9f6111095026b258433d33811a55e"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aos-linux-amd64"
      sha256 "82628629eb8aa6ffb18f37301fd86f76451984da687716ec55cb1b0ec6d4751b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aoscompose-linux-amd64"
        sha256 "82628629eb8aa6ffb18f37301fd86f76451984da687716ec55cb1b0ec6d4751b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aosward-linux-amd64"
        sha256 "82628629eb8aa6ffb18f37301fd86f76451984da687716ec55cb1b0ec6d4751b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aosguard-linux-amd64"
        sha256 "8912ba75e725f13b9e933fb9fb93841b60dda1305fc7395ddf349c434fd2c5ec"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aterm-linux-amd64"
        sha256 "eae05a0933467aca8022caddd0ebdca531e7b5c16973f51cdc6b7f3a7195529a"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aos-linux-arm64"
      sha256 "da038f55b68b14df69452ef4766efb9841cddefd919c1ba272c90b04eabae763"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aoscompose-linux-arm64"
        sha256 "da038f55b68b14df69452ef4766efb9841cddefd919c1ba272c90b04eabae763"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aosward-linux-arm64"
        sha256 "da038f55b68b14df69452ef4766efb9841cddefd919c1ba272c90b04eabae763"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aosguard-linux-arm64"
        sha256 "f407d0240ffd22c75701a3da7ca250171afe9dcb6e156ed9998d4930f5cec1e2"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.414.0/aterm-linux-arm64"
        sha256 "8494ee4b894345f1b8e034baa6428e75d3eae33895ecd2a48079c5a8534b16a9"
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
