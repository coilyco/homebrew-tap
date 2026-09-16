class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.148.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.148.0/agent-compose-roster.tar.gz"
    sha256 "6714251400e9b8f93a7f6d336f32d19d6512e1408681369f22d69ec57a269e1a"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.148.0/agent-compose-bundles.tar.gz"
    sha256 "9f4d83172c06ed854cfcdae706fa1a51e6ce1a0c0fb878dd4a950a068af5d906"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.148.0/agent-compose-darwin-arm64"
      sha256 "27836e8d3249cc38de97169ff1af5ff0ca3844e495c13c67fdaf96610ff1fe74"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.148.0/agent-compose-linux-amd64"
      sha256 "d0d1e2d790c888b9eb146176c09fb9ad7f2c5461f28ac93c04236950ca2fbf86"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.148.0/agent-compose-linux-arm64"
      sha256 "233b882e0861cefc382d6c307e7e856b0223822b2ffd55419269dfad67640f2e"
    end
  end

  def install
    bin.install Dir["agent-compose-*"].first => "agent-compose"
    bin.install_symlink "agent-compose" => "acompose"
    # Homebrew chdirs into a lone top-level directory before yielding a stage
    # block, so a block cannot name the directory it sits inside: agentic-os#6835.
    resource("roster").stage(share/"agent-compose"/"roster")
    resource("bundles").stage(share/"agent-compose"/"bundles")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-compose version")
  end
end
