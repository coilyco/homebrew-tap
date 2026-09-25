class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.375.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aos-darwin-arm64"
      sha256 "4439238c4498d41059e26214f9c3e6803df772bb54a7e48cb985847876e920bb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aoscompose-darwin-arm64"
        sha256 "4439238c4498d41059e26214f9c3e6803df772bb54a7e48cb985847876e920bb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aosward-darwin-arm64"
        sha256 "4439238c4498d41059e26214f9c3e6803df772bb54a7e48cb985847876e920bb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aosguard-darwin-arm64"
        sha256 "26a0dc16135ad0f63eb8fa54e7a0f2dd572629d7d76661da3eb0dd662b028110"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aterm-darwin-arm64"
        sha256 "5aca67b85b230e70cb82cfc7631e42a74cbb8cc2dd2e5141ba7c97c3ba0d3136"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aos-linux-amd64"
      sha256 "b8aca5eff590414904518b9c961501dbf5cbf481bec9edf93b427ead7d618d39"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aoscompose-linux-amd64"
        sha256 "b8aca5eff590414904518b9c961501dbf5cbf481bec9edf93b427ead7d618d39"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aosward-linux-amd64"
        sha256 "b8aca5eff590414904518b9c961501dbf5cbf481bec9edf93b427ead7d618d39"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aosguard-linux-amd64"
        sha256 "dd4bc4b4de558260ca9252975330ac6240eb6bd5a64d5cd685605c19aded7b83"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aterm-linux-amd64"
        sha256 "8df6acad2430f8ecc7ce2bfd13393cde53af1a3198522589fa9644509cf9c03e"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aos-linux-arm64"
      sha256 "d4b2a126819d3e58759cb3e5d55b31ab770efc9b8d918fcccd331dceb9dbf9b7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aoscompose-linux-arm64"
        sha256 "d4b2a126819d3e58759cb3e5d55b31ab770efc9b8d918fcccd331dceb9dbf9b7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aosward-linux-arm64"
        sha256 "d4b2a126819d3e58759cb3e5d55b31ab770efc9b8d918fcccd331dceb9dbf9b7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aosguard-linux-arm64"
        sha256 "1c4b7f9baba7d3d9c2f7452e049f4c243c869e527c4604983013105ec62111be"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.375.0/aterm-linux-arm64"
        sha256 "5049264b698e7f068b7ca99f37725b5225259cfb608b798ddd27b7e3acd3599e"
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
