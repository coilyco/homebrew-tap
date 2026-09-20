class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.347.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aos-darwin-arm64"
      sha256 "fe7e8a9402e5989196357cfbd23473fa988566e11fa897e0f5e49fd0aa6eec1f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aoscompose-darwin-arm64"
        sha256 "fe7e8a9402e5989196357cfbd23473fa988566e11fa897e0f5e49fd0aa6eec1f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aosward-darwin-arm64"
        sha256 "fe7e8a9402e5989196357cfbd23473fa988566e11fa897e0f5e49fd0aa6eec1f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aosguard-darwin-arm64"
        sha256 "f7482d942f061c198080a720f8dc7eae5de19e829713cd11c9f41c5dd9cfdc27"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aterm-darwin-arm64"
        sha256 "a1c198c807b91b12c2cd32f8deb6ccdc46c052b1813b1fa7482b312e85b70a18"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aos-linux-amd64"
      sha256 "c20a2f873e7aca9161bc155568ed733a286ab48cfb45e927b37cab8e29d7a7bc"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aoscompose-linux-amd64"
        sha256 "c20a2f873e7aca9161bc155568ed733a286ab48cfb45e927b37cab8e29d7a7bc"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aosward-linux-amd64"
        sha256 "c20a2f873e7aca9161bc155568ed733a286ab48cfb45e927b37cab8e29d7a7bc"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aosguard-linux-amd64"
        sha256 "d6a2974b690ad23300847d42e489e7951d64451a0da9306d112f273fb37fc3d5"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aterm-linux-amd64"
        sha256 "e59254727459d7e9c4dfbb9f00038e316d93e1e732e63c2d311d3ba79d013f2b"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aos-linux-arm64"
      sha256 "2c9c1661ec79fc5373634d91fdd065fc0166c1ed6bbf9efbde299170f30565be"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aoscompose-linux-arm64"
        sha256 "2c9c1661ec79fc5373634d91fdd065fc0166c1ed6bbf9efbde299170f30565be"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aosward-linux-arm64"
        sha256 "2c9c1661ec79fc5373634d91fdd065fc0166c1ed6bbf9efbde299170f30565be"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aosguard-linux-arm64"
        sha256 "ca17eddc34c0b437b0c9cef53adb86bd77c20bf22d6153725ebfa684cb2aa570"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.347.0/aterm-linux-arm64"
        sha256 "64cecbfe1a18aeff1253b63c55b534b1b0ddb3194f79d9538df0f07213079c9b"
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
