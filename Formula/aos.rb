class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.282.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aos-darwin-arm64"
      sha256 "62ce977f65456124d13fce1ab2a96862af559c2ef56b27b2bfba85d21c2c3c81"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aoscompose-darwin-arm64"
        sha256 "62ce977f65456124d13fce1ab2a96862af559c2ef56b27b2bfba85d21c2c3c81"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aosward-darwin-arm64"
        sha256 "62ce977f65456124d13fce1ab2a96862af559c2ef56b27b2bfba85d21c2c3c81"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aosguard-darwin-arm64"
        sha256 "cf3542086e333172cc2787d7e3efb98e62711020d09d301e3eafb7615af42d8f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aterm-darwin-arm64"
        sha256 "146efd60103a89deb1b349b5c68f188e1efd7edb3e5a5b666403771c7ab432a0"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aos-linux-amd64"
      sha256 "b7c97a5e0455af0224101f40f858e650d777b1aaca0cdc3bbf6e74269b97d1cc"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aoscompose-linux-amd64"
        sha256 "b7c97a5e0455af0224101f40f858e650d777b1aaca0cdc3bbf6e74269b97d1cc"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aosward-linux-amd64"
        sha256 "b7c97a5e0455af0224101f40f858e650d777b1aaca0cdc3bbf6e74269b97d1cc"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aosguard-linux-amd64"
        sha256 "de8c74c4f06eb021a2e62298d893bfb09ab3e070df018978e7212bb133ca9659"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aterm-linux-amd64"
        sha256 "68e16a17cacf828f32a45c7c4ffd349525dbc2f4435d9cb22c3615ab68b03bac"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aos-linux-arm64"
      sha256 "f6e34a2950ec423224613a821f3661a11048c890624a302ab63b47bb6ed7ac3a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aoscompose-linux-arm64"
        sha256 "f6e34a2950ec423224613a821f3661a11048c890624a302ab63b47bb6ed7ac3a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aosward-linux-arm64"
        sha256 "f6e34a2950ec423224613a821f3661a11048c890624a302ab63b47bb6ed7ac3a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aosguard-linux-arm64"
        sha256 "258f8657b1afbd92f4c7929a18e62cd0b05710b19c676705cd35ba9fd97c810c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.282.0/aterm-linux-arm64"
        sha256 "6cc7444ae6a0ce6bc1b032f0679c3aed8aec49c922581619b7be156a0743756a"
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
