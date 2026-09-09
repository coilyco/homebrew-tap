class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.320.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aos-darwin-arm64"
      sha256 "7b9efcf31082f0c8b5d0fa5693b00226ec7608d88ee168fb913411d8eeb9381d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aoscompose-darwin-arm64"
        sha256 "7b9efcf31082f0c8b5d0fa5693b00226ec7608d88ee168fb913411d8eeb9381d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aosward-darwin-arm64"
        sha256 "7b9efcf31082f0c8b5d0fa5693b00226ec7608d88ee168fb913411d8eeb9381d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aosguard-darwin-arm64"
        sha256 "9f6cd641a0b9cdac2cdf49fbbccff78c947744ffe5db8f1ee15ece5ba7aa5af6"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aterm-darwin-arm64"
        sha256 "6f164cca8f33b05ce5400db0eb3d021a964395d1fb21fb1589de6b637389a529"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aos-linux-amd64"
      sha256 "8f54e01a68f8c5c821d801cc4399d45ef7b32f79d1f7bac5e103bcd76785090e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aoscompose-linux-amd64"
        sha256 "8f54e01a68f8c5c821d801cc4399d45ef7b32f79d1f7bac5e103bcd76785090e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aosward-linux-amd64"
        sha256 "8f54e01a68f8c5c821d801cc4399d45ef7b32f79d1f7bac5e103bcd76785090e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aosguard-linux-amd64"
        sha256 "2db6b7057219dbaf28f4d381ff78984015d7f736420e90df3bdeca92832d2339"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aterm-linux-amd64"
        sha256 "4202faae55bbe36df1d9537f2ffef780fdbc731ce4cade0124661b898ec6b815"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aos-linux-arm64"
      sha256 "b6728373c8c51c252b57b88b68fe1618d33e0835e0d2afcecd0bb72639ffab15"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aoscompose-linux-arm64"
        sha256 "b6728373c8c51c252b57b88b68fe1618d33e0835e0d2afcecd0bb72639ffab15"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aosward-linux-arm64"
        sha256 "b6728373c8c51c252b57b88b68fe1618d33e0835e0d2afcecd0bb72639ffab15"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aosguard-linux-arm64"
        sha256 "73930b6e7a06f09f858c060e1e3b22d6addf04ffdf105219943478e8af117db0"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.320.0/aterm-linux-arm64"
        sha256 "48572361a9dbf16c11b2ab7f7ab1d0f312d3df3866e5ca8293657ca41d5afe38"
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
