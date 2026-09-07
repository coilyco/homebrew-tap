class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.312.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aos-darwin-arm64"
      sha256 "cf8bfdf276a63aada4549e64e562204bf3e224bbfd3a4cb3151e2cceef92b08c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aoscompose-darwin-arm64"
        sha256 "cf8bfdf276a63aada4549e64e562204bf3e224bbfd3a4cb3151e2cceef92b08c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aosward-darwin-arm64"
        sha256 "cf8bfdf276a63aada4549e64e562204bf3e224bbfd3a4cb3151e2cceef92b08c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aosguard-darwin-arm64"
        sha256 "1a45d4c8971ebefef787b56cf095bcc460099978f768a0e395d4ef8b8d14319c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aterm-darwin-arm64"
        sha256 "c62f81482587a4ac400e47a77478aafd614ad31584bde24b3892121f210bda0d"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aos-linux-amd64"
      sha256 "bc458428133cab2ac3e9f8aa6e2272e0571aa0209b720337aa4ba36373fcedec"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aoscompose-linux-amd64"
        sha256 "bc458428133cab2ac3e9f8aa6e2272e0571aa0209b720337aa4ba36373fcedec"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aosward-linux-amd64"
        sha256 "bc458428133cab2ac3e9f8aa6e2272e0571aa0209b720337aa4ba36373fcedec"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aosguard-linux-amd64"
        sha256 "2cd9162c96f55ee40e89b24e9b82712824f5d7030d644329c93718bf3132b33a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aterm-linux-amd64"
        sha256 "45406c06b8659c48c108b717793e24363f9d11dbb3b819e9314e09da9a9b515d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aos-linux-arm64"
      sha256 "07046679586fab4d5377a5a24c16ffb64d027879aefd440e80216c7386c54c50"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aoscompose-linux-arm64"
        sha256 "07046679586fab4d5377a5a24c16ffb64d027879aefd440e80216c7386c54c50"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aosward-linux-arm64"
        sha256 "07046679586fab4d5377a5a24c16ffb64d027879aefd440e80216c7386c54c50"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aosguard-linux-arm64"
        sha256 "6fc9e05293ef4fa412ad8f42c962463cae21534c90a9b18e78a7b025d97f27cf"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.312.0/aterm-linux-arm64"
        sha256 "8aca23e248c37cadca4ff7e70f2eebc41f709285d77a7241a049792dbee019f4"
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
