class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.226.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aos-darwin-arm64"
      sha256 "860f07e9d4b4b7a388fff71f06689068cd82f1a80d3ce476daa5f48d121108a9"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aoscompose-darwin-arm64"
        sha256 "860f07e9d4b4b7a388fff71f06689068cd82f1a80d3ce476daa5f48d121108a9"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aosward-darwin-arm64"
        sha256 "860f07e9d4b4b7a388fff71f06689068cd82f1a80d3ce476daa5f48d121108a9"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aosguard-darwin-arm64"
        sha256 "3ac9f9c2071d592af70dcf170ee0f429cc27937c1847dd50539a75a1bd63d948"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aterm-darwin-arm64"
        sha256 "46d8d0d8d505bad4f003a6c1cfb9d6a8754ea835fa72f563d6ef0528a9103a58"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aos-linux-amd64"
      sha256 "75390807d91b3b9cc6026ff631fb1d44c1d917a78c3594b5767244fdd81347e2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aoscompose-linux-amd64"
        sha256 "75390807d91b3b9cc6026ff631fb1d44c1d917a78c3594b5767244fdd81347e2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aosward-linux-amd64"
        sha256 "75390807d91b3b9cc6026ff631fb1d44c1d917a78c3594b5767244fdd81347e2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aosguard-linux-amd64"
        sha256 "8eed6ad0e106052ec8caaee57b9aff35b234c8da9a1bbabe1dc804cfe748254f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aterm-linux-amd64"
        sha256 "5fd797b7162e10753b28522a6bf76f08cb48e4b3c72d77647dab01c9b3c7daf8"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aos-linux-arm64"
      sha256 "a0f26d6404b445ec75024b88e6241db3a2208baa0b25ef54f1c2925493ca04d2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aoscompose-linux-arm64"
        sha256 "a0f26d6404b445ec75024b88e6241db3a2208baa0b25ef54f1c2925493ca04d2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aosward-linux-arm64"
        sha256 "a0f26d6404b445ec75024b88e6241db3a2208baa0b25ef54f1c2925493ca04d2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aosguard-linux-arm64"
        sha256 "c856e4d98727c7006fc604ad5e1c229d29929fa65e6003b20f2e5301bd4d3fbc"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.226.0/aterm-linux-arm64"
        sha256 "16ec47de4da25fb2e38e7c39aec4708f8a087ccdc4b84e19a84cb23ff6273fc8"
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
