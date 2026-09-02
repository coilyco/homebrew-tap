class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.296.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aos-darwin-arm64"
      sha256 "349b04d088cc0b592489076ef54a0f6d8e375150410d8fbf6a9ff2c1dedf9d45"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aoscompose-darwin-arm64"
        sha256 "349b04d088cc0b592489076ef54a0f6d8e375150410d8fbf6a9ff2c1dedf9d45"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aosward-darwin-arm64"
        sha256 "349b04d088cc0b592489076ef54a0f6d8e375150410d8fbf6a9ff2c1dedf9d45"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aosguard-darwin-arm64"
        sha256 "e6d2f6a03d0ad07e23a7f3fab8b09ffc6ecfb22188d9662feea39e80c2ad8ef6"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aterm-darwin-arm64"
        sha256 "c81ae99a862c9165d16cf48a2b50c138cd9d70df4f597933f3a653c36d356730"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aos-linux-amd64"
      sha256 "a0d6b6036a571feca5f4b83be1e601656c92bf4d4382170fd95f03b0a7b642e9"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aoscompose-linux-amd64"
        sha256 "a0d6b6036a571feca5f4b83be1e601656c92bf4d4382170fd95f03b0a7b642e9"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aosward-linux-amd64"
        sha256 "a0d6b6036a571feca5f4b83be1e601656c92bf4d4382170fd95f03b0a7b642e9"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aosguard-linux-amd64"
        sha256 "369ec64f9fdc12e1343cd439da6cd2f235abb56488f9d077dedcf88f086aae33"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aterm-linux-amd64"
        sha256 "5c7d682ac2d365758ce296f1ebf1b3764ddcc6988853f9cc4a478d01d8a369b9"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aos-linux-arm64"
      sha256 "8751e11e51fa055da1d28cefc86f6bb52edf6498f17a404686e379513a103d0b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aoscompose-linux-arm64"
        sha256 "8751e11e51fa055da1d28cefc86f6bb52edf6498f17a404686e379513a103d0b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aosward-linux-arm64"
        sha256 "8751e11e51fa055da1d28cefc86f6bb52edf6498f17a404686e379513a103d0b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aosguard-linux-arm64"
        sha256 "9d334d9708619ec1ce215d0d91a43c6dd92658523393df58b5c664213a74fdc5"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.296.0/aterm-linux-arm64"
        sha256 "f896e9cf6a2cfbe15d571fd0993c5ffb6878eb294640123936d8e1cc15f6fd48"
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
