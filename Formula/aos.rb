class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.294.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aos-darwin-arm64"
      sha256 "07618a8e27b9b874957d69ed4e27f191c6c66f031ebb973fb37259867901f8ad"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aoscompose-darwin-arm64"
        sha256 "07618a8e27b9b874957d69ed4e27f191c6c66f031ebb973fb37259867901f8ad"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aosward-darwin-arm64"
        sha256 "07618a8e27b9b874957d69ed4e27f191c6c66f031ebb973fb37259867901f8ad"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aosguard-darwin-arm64"
        sha256 "825808a8ff477812eefb2fea18cbaef64fdcb3b36f544d15f5224b2efeb50b70"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aterm-darwin-arm64"
        sha256 "c2be70385d5556a687677ae9b3de53591851b2bf7c42b16b0e9e4ef804918141"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aos-linux-amd64"
      sha256 "06106ed9ce19b003f897376a86909f61efdfa1f7a999fcbc6062f52c5dc32a2c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aoscompose-linux-amd64"
        sha256 "06106ed9ce19b003f897376a86909f61efdfa1f7a999fcbc6062f52c5dc32a2c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aosward-linux-amd64"
        sha256 "06106ed9ce19b003f897376a86909f61efdfa1f7a999fcbc6062f52c5dc32a2c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aosguard-linux-amd64"
        sha256 "a4ca32fcc48ec2116bec92f4b8344aca806aa12df7d7190513cee0022f80a4a6"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aterm-linux-amd64"
        sha256 "e5e3ffa2eb6a221a6ee59b7bb1bd7bc559b912f6161899b19d4ff44304a4e64e"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aos-linux-arm64"
      sha256 "4a2b21d99a9e29988a025abb9556dd9671ad097e64156b11621af19f2a6b667a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aoscompose-linux-arm64"
        sha256 "4a2b21d99a9e29988a025abb9556dd9671ad097e64156b11621af19f2a6b667a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aosward-linux-arm64"
        sha256 "4a2b21d99a9e29988a025abb9556dd9671ad097e64156b11621af19f2a6b667a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aosguard-linux-arm64"
        sha256 "36f692dfc7ab56e0c68d1cd01fe03c81b87f6fe3bf35cd120e69fc6da18ec590"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.294.0/aterm-linux-arm64"
        sha256 "fc97f0e70cbfaa2c5cbce754667a73eab45c437faffadd926b710508d78a3899"
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
