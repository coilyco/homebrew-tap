class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.466.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aos-darwin-arm64"
      sha256 "579254906a0d0ca90ec6d351a6053bb80580371fa972a51dccca419d69327e77"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aoscompose-darwin-arm64"
        sha256 "579254906a0d0ca90ec6d351a6053bb80580371fa972a51dccca419d69327e77"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aosward-darwin-arm64"
        sha256 "579254906a0d0ca90ec6d351a6053bb80580371fa972a51dccca419d69327e77"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aosguard-darwin-arm64"
        sha256 "cbd4a6135dab4d7a0c3a262da24429bf2f6eac85c0a724291a854951c86cfcac"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aterm-darwin-arm64"
        sha256 "f6022fc8416aa55bcf191f144c4a409b2c33db4b5308e07590127ee088c5f87e"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aos-linux-amd64"
      sha256 "9cba1afb723648c1f90ad8a04895bf4e4c9547800043172b7ec6ae5df222981b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aoscompose-linux-amd64"
        sha256 "9cba1afb723648c1f90ad8a04895bf4e4c9547800043172b7ec6ae5df222981b"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aosward-linux-amd64"
        sha256 "9cba1afb723648c1f90ad8a04895bf4e4c9547800043172b7ec6ae5df222981b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aosguard-linux-amd64"
        sha256 "74ce60025d4cd362369a544d42a73c3c9bea317181d870ce9fa8689991603652"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aterm-linux-amd64"
        sha256 "b19d1807060fc30d7caf365d040549c75da55fcefcb6533e4748e3166c988cdc"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aos-linux-arm64"
      sha256 "b7e67799307993e7709244a330c147a78c89d45b0bd2bc61e46f4860b2117d60"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aoscompose-linux-arm64"
        sha256 "b7e67799307993e7709244a330c147a78c89d45b0bd2bc61e46f4860b2117d60"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aosward-linux-arm64"
        sha256 "b7e67799307993e7709244a330c147a78c89d45b0bd2bc61e46f4860b2117d60"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aosguard-linux-arm64"
        sha256 "4d8cfce370c8809bd222ac7cd448cc8b653e4adbe7663758598e591d77d1f1c2"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.466.0/aterm-linux-arm64"
        sha256 "ec75cdabcd69a8b70fd6ddc23711e5df10ce246e7a7ed8a6c62ad6f3d9e4bdaa"
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
