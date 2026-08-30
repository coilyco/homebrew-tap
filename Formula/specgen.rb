class Specgen < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra"
  version "0.187.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.187.0/specgen-darwin-amd64"
      sha256 "5088aab48176d2e97b54a4816df9c0cda8b93dc52b2a2df4fc7164407e7156d7"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.187.0/specgen-darwin-arm64"
      sha256 "45bd53b6b3ffc73458f81ca4a79c42504666dde097e9292af78e42aab6244587"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.187.0/specgen-linux-amd64"
      sha256 "f66c12b489f30eed95139fd1d07ed57e605a30b7c8ef73626f0a57b078c5805c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/umbra/releases/download/v0.187.0/specgen-linux-arm64"
      sha256 "f8b448b484eb8c28da757b2a9c8a1af5a27d9639d759fe1cb0f21276c7af9d66"
    end
  end

  def install
    bin.install Dir["specgen-*"].first => "specgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/specgen --version")
  end
end
