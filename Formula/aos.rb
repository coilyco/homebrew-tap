class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.331.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aos-darwin-arm64"
      sha256 "37ae0d5597b25367d8d2fc62237caa0ec08973ebb142d8f449027f295cd67c33"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aoscompose-darwin-arm64"
        sha256 "37ae0d5597b25367d8d2fc62237caa0ec08973ebb142d8f449027f295cd67c33"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aosward-darwin-arm64"
        sha256 "37ae0d5597b25367d8d2fc62237caa0ec08973ebb142d8f449027f295cd67c33"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aosguard-darwin-arm64"
        sha256 "b51cda644c6cf23ab46f5ccb0ba2f2626fdcf9fdb7c9b6be768549734f0e4f66"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aterm-darwin-arm64"
        sha256 "6a541f8b06bee0b249a3da12eca72b4b0e00364ed12cf15b4ccc48e8b8a3beb8"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aos-linux-amd64"
      sha256 "2f3f1a009d42c537175073bf209e763d4b0b2026148b2f22b2c6d7b240052e55"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aoscompose-linux-amd64"
        sha256 "2f3f1a009d42c537175073bf209e763d4b0b2026148b2f22b2c6d7b240052e55"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aosward-linux-amd64"
        sha256 "2f3f1a009d42c537175073bf209e763d4b0b2026148b2f22b2c6d7b240052e55"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aosguard-linux-amd64"
        sha256 "25fce785045605f715fe82e1abaddbd083db541c01668034d87bcb139126a05c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aterm-linux-amd64"
        sha256 "bc91ee25abec3d569b07085ec66d841c9aab949358cc9740395908f08e11b627"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aos-linux-arm64"
      sha256 "adb17c2b6b7226912306c6cad050f6ccebd4058a94229f35683a1715d5c14861"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aoscompose-linux-arm64"
        sha256 "adb17c2b6b7226912306c6cad050f6ccebd4058a94229f35683a1715d5c14861"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aosward-linux-arm64"
        sha256 "adb17c2b6b7226912306c6cad050f6ccebd4058a94229f35683a1715d5c14861"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aosguard-linux-arm64"
        sha256 "1906842b3d2b0d9de0fed023d8f8f27ea3bd46c7cc198c05120e8f5e7e8c69de"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.331.0/aterm-linux-arm64"
        sha256 "af2da4c2152acf0587a3a503778ae120f6b251c8c6063c36cb0fe22182ebabcb"
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
