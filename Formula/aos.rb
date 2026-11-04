class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.514.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.514.0/aos-darwin-arm64"
    sha256 "994578591e80f5b627db688d3bfa0249230c02aab09f049ac529796b748b59cf"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.514.0/aoscompose-darwin-arm64"
      sha256 "994578591e80f5b627db688d3bfa0249230c02aab09f049ac529796b748b59cf"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.514.0/aosguard-darwin-arm64"
      sha256 "71aee9e58af5e0b1aaafe10577dbb0c1b8807f00e05af7c55d165b7738ec29f9"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.514.0/aterm-darwin-arm64"
      sha256 "f438234bac22e06030ce8130108f1b50d33928d8e0c66e28e004807c86d895fb"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.514.0/aos-linux-amd64"
      sha256 "47c749c420a77c455de51ee03bbcddc03375c3bcac216d553a6f4304b4b4b024"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.514.0/aoscompose-linux-amd64"
        sha256 "47c749c420a77c455de51ee03bbcddc03375c3bcac216d553a6f4304b4b4b024"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.514.0/aosguard-linux-amd64"
        sha256 "5331fc1a33b69733b6a29679cc2221f47cc90c266dfe70f156250b0115979f86"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.514.0/aterm-linux-amd64"
        sha256 "7a089618c29ace4cbc71de506fcbba419256c64d2694a3f127b0175f498c6719"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.514.0/aos-linux-arm64"
      sha256 "ce42710c282e661ed2ec3058fae4dc4d6f22afc6844c73182e0d2bcced423d33"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.514.0/aoscompose-linux-arm64"
        sha256 "ce42710c282e661ed2ec3058fae4dc4d6f22afc6844c73182e0d2bcced423d33"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.514.0/aosguard-linux-arm64"
        sha256 "798a596aff64cb12af1ce6c6d168495fa5516ef0847f829478ef57e30cf71b73"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.514.0/aterm-linux-arm64"
        sha256 "04c2ada59613274e44e29d9d32ef6a82ae5ad5e9a6680965bc6f6e1cf67b8273"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
