class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.418.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aos-darwin-arm64"
      sha256 "b82673f3d72579826500517f126601b3a6226b226abf92878f4cb74d5dea79fb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aoscompose-darwin-arm64"
        sha256 "b82673f3d72579826500517f126601b3a6226b226abf92878f4cb74d5dea79fb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aosward-darwin-arm64"
        sha256 "b82673f3d72579826500517f126601b3a6226b226abf92878f4cb74d5dea79fb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aosguard-darwin-arm64"
        sha256 "e669a1448ca90774e4dd79f75b1091bc98d2a51d41fe33258243cb7e4b5b82f8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aterm-darwin-arm64"
        sha256 "802e00c111acb70942c4c2f5431187e6b721287e7d713a0f532ab941eb942ffb"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aos-linux-amd64"
      sha256 "b897b212ab3978098387387407fb412fecf987594ce4c7f48773271de17bcbed"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aoscompose-linux-amd64"
        sha256 "b897b212ab3978098387387407fb412fecf987594ce4c7f48773271de17bcbed"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aosward-linux-amd64"
        sha256 "b897b212ab3978098387387407fb412fecf987594ce4c7f48773271de17bcbed"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aosguard-linux-amd64"
        sha256 "13492c50be71e7f4524fd60c061fbf7b7da65f3c0f0589db380c93619bc90a1a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aterm-linux-amd64"
        sha256 "9ed46679f41264e117bf91c34826f129268662879258a1357200389d3fe409ff"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aos-linux-arm64"
      sha256 "1f1c066b5b2f05b46f9e097844e3b2f05ed0367b1bdf41bc811718fa91552185"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aoscompose-linux-arm64"
        sha256 "1f1c066b5b2f05b46f9e097844e3b2f05ed0367b1bdf41bc811718fa91552185"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aosward-linux-arm64"
        sha256 "1f1c066b5b2f05b46f9e097844e3b2f05ed0367b1bdf41bc811718fa91552185"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aosguard-linux-arm64"
        sha256 "02395ce3bb3df3bdd3f7a05a1d9556b73045d1ccec4f95167ed2c1a7169821fa"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.418.0/aterm-linux-arm64"
        sha256 "a7743690368009dc2dac909f5f6ea52cb710ddff436eb6d4a273cbcb0ee28e1c"
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
