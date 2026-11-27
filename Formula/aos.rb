class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.636.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.636.0/aos-darwin-arm64"
    sha256 "b951782beb46e74ae5f204d6edc5e309a63df3d66dc38975ef347bbc6e820769"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.636.0/aoscompose-darwin-arm64"
      sha256 "b951782beb46e74ae5f204d6edc5e309a63df3d66dc38975ef347bbc6e820769"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.636.0/aosguard-darwin-arm64"
      sha256 "9c4327cefe2bcf6df940e651797e60387f2dd6a9f0f2cbcb4984a6f4092c0a98"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.636.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "87899c3466e1c16946b5e458d75352d2a12c72d77eec71e11fecc34dab02f030"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.636.0/aos-linux-amd64"
      sha256 "e9e83b7a9d0532a582a4abedc7dffaa6b6dfe2f9f88feaa5744521e672afe13d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.636.0/aoscompose-linux-amd64"
        sha256 "e9e83b7a9d0532a582a4abedc7dffaa6b6dfe2f9f88feaa5744521e672afe13d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.636.0/aosguard-linux-amd64"
        sha256 "d4a64be92ecadfcda0328bcafe4d7e58826bad6a8bc0d85e5383d7b604949efe"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.636.0/aterm-linux-amd64"
        sha256 "804466a7ce2489784079ee83be530865010cb6d1fffa6d6ea7a36c70906401ee"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.636.0/aos-linux-arm64"
      sha256 "f9f66e9988b4f96ab66b41ce6d798cfe7b2ad85a747d8cdaa37d9ba9b076ea50"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.636.0/aoscompose-linux-arm64"
        sha256 "f9f66e9988b4f96ab66b41ce6d798cfe7b2ad85a747d8cdaa37d9ba9b076ea50"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.636.0/aosguard-linux-arm64"
        sha256 "1643bdc51c5418f91289b643fa7276b340617e3f42ff4d4410d6ab05c3fe8c1e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.636.0/aterm-linux-arm64"
        sha256 "68d2a71e3e3ddbc487d8807a8dea298ec94212514632a5e5b431ea7ab1dcf6a9"
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
