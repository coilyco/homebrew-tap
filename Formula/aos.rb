class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.486.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.486.0/aos-darwin-arm64"
    sha256 "c5f18110ddc0a0014665b7273e81bc2404c4f4bfa064769d3ff9ecee85c72975"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.486.0/aoscompose-darwin-arm64"
      sha256 "c5f18110ddc0a0014665b7273e81bc2404c4f4bfa064769d3ff9ecee85c72975"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.486.0/aosguard-darwin-arm64"
      sha256 "185dd1a4949834c8acf7854120ecdfb906bb12cc58fa40f91e51e601faf79c5b"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.486.0/aterm-darwin-arm64"
      sha256 "b63246dcd3acbbce91458072c94c4859a46cd9e8c3ea64605995b52a45103821"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.486.0/aos-linux-amd64"
      sha256 "4a97b920d701c239eb5176f4880c1b14dbb8b7c81c8c675f31e2e09829d173b3"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.486.0/aoscompose-linux-amd64"
        sha256 "4a97b920d701c239eb5176f4880c1b14dbb8b7c81c8c675f31e2e09829d173b3"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.486.0/aosguard-linux-amd64"
        sha256 "43ec72f3037239f7e76888847ac823183b1230886f314de55888982a85050164"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.486.0/aterm-linux-amd64"
        sha256 "ea6f13ac16661e2d68e001e47700fc70ced3ccb5071e5d9dd868b27c6d37fa74"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.486.0/aos-linux-arm64"
      sha256 "c82d6725d32de0a48c39b7e91004f2d7bc7ae1b0afc404ad1ba39640bb5ebd2f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.486.0/aoscompose-linux-arm64"
        sha256 "c82d6725d32de0a48c39b7e91004f2d7bc7ae1b0afc404ad1ba39640bb5ebd2f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.486.0/aosguard-linux-arm64"
        sha256 "b2b8ef35141f0340a32642c8121ad83a8abd7bc42d92924bb36c6f228a1c8a8f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.486.0/aterm-linux-arm64"
        sha256 "31ef88ef6a17242e973ff7cfbf0388ae85e06b0d4835a3b17dcab2bf0806923e"
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
