class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.450.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aos-darwin-arm64"
      sha256 "95092ac370c832568069b49bd8cc8c1f57689478068915581460457b06e54705"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aoscompose-darwin-arm64"
        sha256 "95092ac370c832568069b49bd8cc8c1f57689478068915581460457b06e54705"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aosward-darwin-arm64"
        sha256 "95092ac370c832568069b49bd8cc8c1f57689478068915581460457b06e54705"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aosguard-darwin-arm64"
        sha256 "35d2d9863f49b9ce47b5edfbf895cf1c6281a87f6dd0da78e137cc1b881ee2dd"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aterm-darwin-arm64"
        sha256 "9035c92971d8e8cda156d9baad2bd3730c2608e164b7777d5bb51ac28a13af02"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aos-linux-amd64"
      sha256 "807fc5601e8ba1f50b9b7e485abb031d03fc1f2d5d7f15bf591c933331909e0f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aoscompose-linux-amd64"
        sha256 "807fc5601e8ba1f50b9b7e485abb031d03fc1f2d5d7f15bf591c933331909e0f"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aosward-linux-amd64"
        sha256 "807fc5601e8ba1f50b9b7e485abb031d03fc1f2d5d7f15bf591c933331909e0f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aosguard-linux-amd64"
        sha256 "ee52d9906038295453b7f21ba4f5a823d209b0cbd65f0e7695c83ca92b95f3e6"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aterm-linux-amd64"
        sha256 "9803c7d178623a70f7167bba29992328cfb005bdf10e35df0479b3d224e19401"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aos-linux-arm64"
      sha256 "65683223ab2a95d7cd549a9f374c9830562cea92b81fba0f7fca56395bd9700c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aoscompose-linux-arm64"
        sha256 "65683223ab2a95d7cd549a9f374c9830562cea92b81fba0f7fca56395bd9700c"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aosward-linux-arm64"
        sha256 "65683223ab2a95d7cd549a9f374c9830562cea92b81fba0f7fca56395bd9700c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aosguard-linux-arm64"
        sha256 "1f2b94d7d52280b0e2ba9692e9524c2d12337d3784569c18f11ddd4979973fe1"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.450.0/aterm-linux-arm64"
        sha256 "d43960a55d81c739c3a80068c01b174d097f64b94fa153552d90939b664dd941"
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
