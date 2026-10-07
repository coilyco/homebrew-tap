class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.439.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aos-darwin-arm64"
      sha256 "74c6002c7ada2788650cc79994314640859bc241b8a2ee6aa297a3ac8797a791"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aoscompose-darwin-arm64"
        sha256 "74c6002c7ada2788650cc79994314640859bc241b8a2ee6aa297a3ac8797a791"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aosward-darwin-arm64"
        sha256 "74c6002c7ada2788650cc79994314640859bc241b8a2ee6aa297a3ac8797a791"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aosguard-darwin-arm64"
        sha256 "3480ec5979e3e5f864d5777c6227f0aebb141567e377fcfc28a4e6d10940f75e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aterm-darwin-arm64"
        sha256 "f59d5031cd0acbc47bddc08314a9c2c6ae196849e56c2b999d41a3d82e48150e"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aos-linux-amd64"
      sha256 "4649e454b1c3ebd091628be559f2cf64d5819501757316dd9ccac952575fa071"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aoscompose-linux-amd64"
        sha256 "4649e454b1c3ebd091628be559f2cf64d5819501757316dd9ccac952575fa071"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aosward-linux-amd64"
        sha256 "4649e454b1c3ebd091628be559f2cf64d5819501757316dd9ccac952575fa071"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aosguard-linux-amd64"
        sha256 "036da19e707da68c5e87f8d84930ac43b6b213b3df1a1f0f62d2f7669526af8a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aterm-linux-amd64"
        sha256 "510b2e307d406ab8e73bc8784c610fb0e225677e802ad8c29403f9b14220970b"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aos-linux-arm64"
      sha256 "4107ee39f640bc6507d05f1626d29c366e0d4b3281bc7a61075ef12f507469e7"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aoscompose-linux-arm64"
        sha256 "4107ee39f640bc6507d05f1626d29c366e0d4b3281bc7a61075ef12f507469e7"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aosward-linux-arm64"
        sha256 "4107ee39f640bc6507d05f1626d29c366e0d4b3281bc7a61075ef12f507469e7"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aosguard-linux-arm64"
        sha256 "59ecb7282f1482bff515bd69d042ec557ca6a61b993c3dc5c529e3e55b5cf160"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.439.0/aterm-linux-arm64"
        sha256 "93da31b812c8acb51413b6a75a66b71ae91bb142f0f5a5347d9a67ae42dd9dde"
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
