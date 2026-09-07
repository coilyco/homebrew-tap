class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.309.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aos-darwin-arm64"
      sha256 "ab2d52d0689408abf55ca7ac1676ece1f9d73a6a49c14162a99dbc218149572f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aoscompose-darwin-arm64"
        sha256 "ab2d52d0689408abf55ca7ac1676ece1f9d73a6a49c14162a99dbc218149572f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aosward-darwin-arm64"
        sha256 "ab2d52d0689408abf55ca7ac1676ece1f9d73a6a49c14162a99dbc218149572f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aosguard-darwin-arm64"
        sha256 "5320a288d3ebbd10289fc90efdab22ec38a55307766b81d198e1fee6bc606e88"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aterm-darwin-arm64"
        sha256 "8cd35fa3570d16c15b8bd75bc508633dc47b3ad7ca7781b17d52f80116460b82"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aos-linux-amd64"
      sha256 "d2a11ef81ec7879b15f788da6863e447b06e9b0d3c7af40172f94303834040c6"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aoscompose-linux-amd64"
        sha256 "d2a11ef81ec7879b15f788da6863e447b06e9b0d3c7af40172f94303834040c6"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aosward-linux-amd64"
        sha256 "d2a11ef81ec7879b15f788da6863e447b06e9b0d3c7af40172f94303834040c6"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aosguard-linux-amd64"
        sha256 "f47a68346a6349a87e5c0ea56f3d94e5a62365d49e487fafa6c75ef6b165ff13"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aterm-linux-amd64"
        sha256 "9be69b93f662a1ab84bda46d9411dc0f831a3aec2cc89cdaa611f633c5bee71f"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aos-linux-arm64"
      sha256 "1bf2da60c644fb9bc6ba9803da2f4361fe9b1096f318718b0bc972cbe239a7fd"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aoscompose-linux-arm64"
        sha256 "1bf2da60c644fb9bc6ba9803da2f4361fe9b1096f318718b0bc972cbe239a7fd"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aosward-linux-arm64"
        sha256 "1bf2da60c644fb9bc6ba9803da2f4361fe9b1096f318718b0bc972cbe239a7fd"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aosguard-linux-arm64"
        sha256 "73e2f08baeec603174b9bc9a68799a6b795059045f39a5299d92877b7b4b2f78"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.309.0/aterm-linux-arm64"
        sha256 "36fa6499a65a9aaded241cdc80a0059765424cab0b4d075b62aa7050b0f5887d"
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
