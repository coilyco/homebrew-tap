class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.299.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aos-darwin-arm64"
      sha256 "dc9c925df799018b9cde2b211955b309c2a208b841dd0c799278810aca0f0d52"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aoscompose-darwin-arm64"
        sha256 "dc9c925df799018b9cde2b211955b309c2a208b841dd0c799278810aca0f0d52"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aosward-darwin-arm64"
        sha256 "dc9c925df799018b9cde2b211955b309c2a208b841dd0c799278810aca0f0d52"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aosguard-darwin-arm64"
        sha256 "1973e18662323f7992cb55c2dea70fff054fca7d4bbf63f50260323c122e0062"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aterm-darwin-arm64"
        sha256 "b491c5c682c2f32bd50679809eb2a7e6ae6b4ecc7730bff80adf60abfeeceac2"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aos-linux-amd64"
      sha256 "7aa514c2ff973a268bc3c39479be584384afb0d2986a6cb96d2fbd7de39de450"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aoscompose-linux-amd64"
        sha256 "7aa514c2ff973a268bc3c39479be584384afb0d2986a6cb96d2fbd7de39de450"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aosward-linux-amd64"
        sha256 "7aa514c2ff973a268bc3c39479be584384afb0d2986a6cb96d2fbd7de39de450"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aosguard-linux-amd64"
        sha256 "2d69be92b518e8e6cb5213f0459b0749b1d175ee019c26b82d3b08c2820769fc"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aterm-linux-amd64"
        sha256 "6606248ca6ed9d17a4f9943aeca6e0c247faf44b7728cea9b1b26bcd6941810d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aos-linux-arm64"
      sha256 "22adf5e8614d41f347577dfbab5b1ddc19b1c6aebb12cc778fc4a5682d5a51b0"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aoscompose-linux-arm64"
        sha256 "22adf5e8614d41f347577dfbab5b1ddc19b1c6aebb12cc778fc4a5682d5a51b0"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aosward-linux-arm64"
        sha256 "22adf5e8614d41f347577dfbab5b1ddc19b1c6aebb12cc778fc4a5682d5a51b0"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aosguard-linux-arm64"
        sha256 "1d994b05d2c2217ea46cbc325f8d0a27cabab0e32e2fd7041b7b11ba548de4c2"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.299.0/aterm-linux-arm64"
        sha256 "9ef2154129e3b1c40c54cc3a4eb1f4ac1cb79f40f004ab966db27162189319b8"
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
