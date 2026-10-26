class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.479.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.479.0/aos-darwin-arm64"
      sha256 "e1ce9a66414a6c14aa37ba04ce09162b00bc9261b3fa9aca49617dc02c46ae9a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.479.0/aoscompose-darwin-arm64"
        sha256 "e1ce9a66414a6c14aa37ba04ce09162b00bc9261b3fa9aca49617dc02c46ae9a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.479.0/aosguard-darwin-arm64"
        sha256 "abd88aa6456e25a4702905e82e0d4f95e96f32cfeb93c72604db3a5e57d5c1cc"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.479.0/aterm-darwin-arm64"
        sha256 "a740c2b359dd99554acc9d24b537bfd691e271f8763d94c30501c50ac963896f"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.479.0/aos-linux-amd64"
      sha256 "ff7d52d148f432897f7f7a254bedfc4d5f4b7e126521419d36290af189e440f8"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.479.0/aoscompose-linux-amd64"
        sha256 "ff7d52d148f432897f7f7a254bedfc4d5f4b7e126521419d36290af189e440f8"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.479.0/aosguard-linux-amd64"
        sha256 "8edb2f9b73760f50e3b70e7f32b7677e7527ce8b46c733d72c35645a5e4cb0aa"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.479.0/aterm-linux-amd64"
        sha256 "e94a073e0111dd45ca60ee75a1b5d269bdfb7cd53c266f6ea76454a4518eeaff"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.479.0/aos-linux-arm64"
      sha256 "9ad0ace84247b2eb39136a535b77a79d50b229109757098cace3cfa0db95c3c6"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.479.0/aoscompose-linux-arm64"
        sha256 "9ad0ace84247b2eb39136a535b77a79d50b229109757098cace3cfa0db95c3c6"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.479.0/aosguard-linux-arm64"
        sha256 "325939e10cb61104cc819aaf2b87ab576d91dc9d2cd85af4d7503a7fea0f7b45"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.479.0/aterm-linux-arm64"
        sha256 "b37a318a7d553bc9c1caa77cb3b43dcff9994e7c6022902be1ccd5a1e98fc5b1"
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
