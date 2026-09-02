class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.291.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aos-darwin-arm64"
      sha256 "8b561b6fb8d5e3cdc36cdd745df0d24764f6cdb8f2b78bf1e5caad25d6ccaff2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aoscompose-darwin-arm64"
        sha256 "8b561b6fb8d5e3cdc36cdd745df0d24764f6cdb8f2b78bf1e5caad25d6ccaff2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aosward-darwin-arm64"
        sha256 "8b561b6fb8d5e3cdc36cdd745df0d24764f6cdb8f2b78bf1e5caad25d6ccaff2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aosguard-darwin-arm64"
        sha256 "31cb99ac3f910c125714571d21c3ecf24df6aaf3383005971d93fe2cf51234d4"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aterm-darwin-arm64"
        sha256 "75d709140b1c56b70fb9e740db693dc9bd2982f2d905d3b92794550e9a5a851e"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aos-linux-amd64"
      sha256 "f04a6fb4d1a183f4d6478413ad3bef59283dae234c6ce9a212970feac6b519bc"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aoscompose-linux-amd64"
        sha256 "f04a6fb4d1a183f4d6478413ad3bef59283dae234c6ce9a212970feac6b519bc"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aosward-linux-amd64"
        sha256 "f04a6fb4d1a183f4d6478413ad3bef59283dae234c6ce9a212970feac6b519bc"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aosguard-linux-amd64"
        sha256 "2711b41b369d5091ad82f6b4b87377bd67c525bd07699c5fd605cee842dce291"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aterm-linux-amd64"
        sha256 "89b7277584db03977e0e5ebad10bffc7a8940448cd11feb5232cd7eb04f94626"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aos-linux-arm64"
      sha256 "31d48e5d8834a3049b7a7fe41ccf94df4b75f7b5e9f10c840205fa636bb8aa92"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aoscompose-linux-arm64"
        sha256 "31d48e5d8834a3049b7a7fe41ccf94df4b75f7b5e9f10c840205fa636bb8aa92"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aosward-linux-arm64"
        sha256 "31d48e5d8834a3049b7a7fe41ccf94df4b75f7b5e9f10c840205fa636bb8aa92"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aosguard-linux-arm64"
        sha256 "03734bceafd3a25e407ade9b0d33a4bf48b3cc325908abbe71c6fbdd0345a867"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.291.0/aterm-linux-arm64"
        sha256 "b23052ae65f8b98d7e7ff4c0eb6d41782bd33732575e6eb0bce9bfa04aafce46"
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
