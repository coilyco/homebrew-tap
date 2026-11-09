class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.546.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.546.0/aos-darwin-arm64"
    sha256 "d72538d00f2edd87e85eb53a21ea26c3c0845212c438bea73d9a520f58aa3e98"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.546.0/aoscompose-darwin-arm64"
      sha256 "d72538d00f2edd87e85eb53a21ea26c3c0845212c438bea73d9a520f58aa3e98"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.546.0/aosguard-darwin-arm64"
      sha256 "527ec1c3dcdb70bdb462ffb73233f6ba65033b9302da72a64843f1256c319813"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.546.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "3b1baff987e2b69d449bd1e13d06053054461d159e15fcfb76bcd0724860b93a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.546.0/aos-linux-amd64"
      sha256 "d50e10e1abd576fb2156b5aa25721565973e96fc964042b9ef33847a8f45e832"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.546.0/aoscompose-linux-amd64"
        sha256 "d50e10e1abd576fb2156b5aa25721565973e96fc964042b9ef33847a8f45e832"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.546.0/aosguard-linux-amd64"
        sha256 "bf86257d72d00beca90278ef1d1bd60223363b7bf5d926457a5e950cc36ccc75"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.546.0/aterm-linux-amd64"
        sha256 "4bbe5e778a3e0a86035e7b6ece4e5cb550f2479d8d1f38067a777aef67fbff3f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.546.0/aos-linux-arm64"
      sha256 "68f16f647c9f01f3f4ccb3777e0f6df1d0e0296e225b203a8438e2f02de3ef79"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.546.0/aoscompose-linux-arm64"
        sha256 "68f16f647c9f01f3f4ccb3777e0f6df1d0e0296e225b203a8438e2f02de3ef79"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.546.0/aosguard-linux-arm64"
        sha256 "c80f3ada1775e22174ab68ec28f9b809e62198ac5665766af87a7b9e731efb75"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.546.0/aterm-linux-arm64"
        sha256 "845593e9b171400a600aaa4d6f13e538871d208aca61d130588189edabb7f550"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    # macOS installs the signed bundle, whole (:nounzip) because a stage would
    # step into it, and links bin/aterm to its executable. See docs/aos-cli.md.
    if OS.mac?
      resource("aterm").stage do
        system "tar", "-xzf", Dir["*.tar.gz"].first, "-C", prefix
      end
      bin.install_symlink prefix/"Treehouse.app/Contents/MacOS/aterm"
    else
      resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
