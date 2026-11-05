class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.530.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.530.0/aos-darwin-arm64"
    sha256 "2a4364dcbd8e6c704695c5e98b737776b879091bcd48a78dd1a2531003d5c996"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.530.0/aoscompose-darwin-arm64"
      sha256 "2a4364dcbd8e6c704695c5e98b737776b879091bcd48a78dd1a2531003d5c996"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.530.0/aosguard-darwin-arm64"
      sha256 "d0453d4903a5a6866822212172d92f39cc4c4fa3d970635768e54a4b4fe62158"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.530.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "99e238288c2e75dd9a66e4e6055162fdc866761411582cb08dc71308314e20c4"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.530.0/aos-linux-amd64"
      sha256 "8fa5402c6f4c25615a469f3369b073db40d989094d46cac083edc174b6a7632c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.530.0/aoscompose-linux-amd64"
        sha256 "8fa5402c6f4c25615a469f3369b073db40d989094d46cac083edc174b6a7632c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.530.0/aosguard-linux-amd64"
        sha256 "a29e7c52e38ca3808690858ea9554b3bb4bee8f2c99b7f5b1845ebdd7ddb20e4"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.530.0/aterm-linux-amd64"
        sha256 "c9be2017fe476938ee8223e71423ede2612855c64f8e116bcaa7169bf9434905"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.530.0/aos-linux-arm64"
      sha256 "85f0e9d9c8902a6c2561ae77cefa87496da5b2c40cabf1933a5059f30841965f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.530.0/aoscompose-linux-arm64"
        sha256 "85f0e9d9c8902a6c2561ae77cefa87496da5b2c40cabf1933a5059f30841965f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.530.0/aosguard-linux-arm64"
        sha256 "8881e0dbdd37ff82f3b9e1720e5531bc14ce3a9e9d896857f7a8f14f8b8d88a0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.530.0/aterm-linux-arm64"
        sha256 "e9b042de3880a2307e285aa510373d4b1a7226a7f988247e9b7fb671e8d85ba4"
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
