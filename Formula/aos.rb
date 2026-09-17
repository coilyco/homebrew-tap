class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.339.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aos-darwin-arm64"
      sha256 "658766f260f59f8c9d41af3850fd92009715bab6341145cd26679a5f9ff83406"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aoscompose-darwin-arm64"
        sha256 "658766f260f59f8c9d41af3850fd92009715bab6341145cd26679a5f9ff83406"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aosward-darwin-arm64"
        sha256 "658766f260f59f8c9d41af3850fd92009715bab6341145cd26679a5f9ff83406"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aosguard-darwin-arm64"
        sha256 "34727b0e2369b6fb1d8e4630f251e32b8acaf02e270d7dcc53f64f95d4d43521"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aterm-darwin-arm64"
        sha256 "b47c60b0583876f94c1d22dcd6d018b53d7ea1a00638907c3b384c40c1ecd052"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aos-linux-amd64"
      sha256 "6b3a70d37bc06bd367e2bf02347b61e31cbf86a3c1173a924d3c74f9f2d006a1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aoscompose-linux-amd64"
        sha256 "6b3a70d37bc06bd367e2bf02347b61e31cbf86a3c1173a924d3c74f9f2d006a1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aosward-linux-amd64"
        sha256 "6b3a70d37bc06bd367e2bf02347b61e31cbf86a3c1173a924d3c74f9f2d006a1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aosguard-linux-amd64"
        sha256 "2461fa69ff0af575915f2e8c6287dea69ddbd95e69d393a547acce733f366a99"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aterm-linux-amd64"
        sha256 "511ad80f5d1e816c54787a45602e8622fa82832ba101a8482cc64f3ba3963dfe"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aos-linux-arm64"
      sha256 "dc558ebde08039c2187d85218db89630d404ffdd1aff944b24ae24c3f851d80c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aoscompose-linux-arm64"
        sha256 "dc558ebde08039c2187d85218db89630d404ffdd1aff944b24ae24c3f851d80c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aosward-linux-arm64"
        sha256 "dc558ebde08039c2187d85218db89630d404ffdd1aff944b24ae24c3f851d80c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aosguard-linux-arm64"
        sha256 "c99fe38a348b51e0c50be429518642d08db70041007bfa9e5a052940fd61eafb"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.339.0/aterm-linux-arm64"
        sha256 "6dc7b4699fa9446f5bc1c89fd8e9375ede852b2b4b251c831a08f808b3057b7c"
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
