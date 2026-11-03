class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.490.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.490.0/aos-darwin-arm64"
    sha256 "98b8580c072fc3a7abd02996cde9b64407ef6dc45ef964186e78fc15b0f41128"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.490.0/aoscompose-darwin-arm64"
      sha256 "98b8580c072fc3a7abd02996cde9b64407ef6dc45ef964186e78fc15b0f41128"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.490.0/aosguard-darwin-arm64"
      sha256 "7ab8dec76392bbee452bc136effdcebe0a7613210d58db7d3b4ef6ac48a6d7c2"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.490.0/aterm-darwin-arm64"
      sha256 "86e19879b304b5d7a6c304a87324d1b7c3f9284b07861b1b5fc780c236a70fe0"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.490.0/aos-linux-amd64"
      sha256 "d0ddbb20fc0a51fbf4b9f729c7b28d37a5462a028dbe077380ca06ee388b1e73"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.490.0/aoscompose-linux-amd64"
        sha256 "d0ddbb20fc0a51fbf4b9f729c7b28d37a5462a028dbe077380ca06ee388b1e73"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.490.0/aosguard-linux-amd64"
        sha256 "f4665f2bb26135c53d2789d0ae94afa9ebe8de8c281a249304166052319ac16b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.490.0/aterm-linux-amd64"
        sha256 "47d240839a092548f88d63b1a6894912047c68f53838747e2a853d1070826251"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.490.0/aos-linux-arm64"
      sha256 "266b77fc72ebac9dfd9bf27c7f229adb625f0b99bc182e695f3246031ea8e128"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.490.0/aoscompose-linux-arm64"
        sha256 "266b77fc72ebac9dfd9bf27c7f229adb625f0b99bc182e695f3246031ea8e128"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.490.0/aosguard-linux-arm64"
        sha256 "c3ff357f1fb763ffabcd1e1a8bc83fa1f4fcacf51bc016629e289a2f2f852524"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.490.0/aterm-linux-arm64"
        sha256 "f7437943e9d17b77a63ea1bb859d6f1bd51e9a602d0fa23d5e5182d2fa3f14b8"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
