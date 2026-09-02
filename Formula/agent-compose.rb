class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.95.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.95.0/agent-compose-roster.tar.gz"
    sha256 "140da4029b159e1c18dd424cacf579dd3babb5bed09f82beeeebab16578aa5f8"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.95.0/agent-compose-bundles.tar.gz"
    sha256 "b0bedc35f322025daa7140ca483614e1d3fa4f333f752a1113cda7e3d3333daf"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.95.0/agent-compose-darwin-arm64"
      sha256 "0dc00539154ddaad809d528cfeb582c6003feb0a697050692cf69ca1f3c031e4"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.95.0/agent-compose-linux-amd64"
      sha256 "149e2105f9ef49f7cebb42c8ebf48fc5d3c438cdf877e98ef02ccbf2dd97292e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.95.0/agent-compose-linux-arm64"
      sha256 "d0a84bcc50e70f8935289af705ceb73fe338ffca7d49a53e3bc65c18a79dbbc8"
    end
  end

  def install
    bin.install Dir["agent-compose-*"].first => "agent-compose"
    bin.install_symlink "agent-compose" => "acompose"
    resource("roster").stage do
      (share/"agent-compose").install "roster"
    end
    resource("bundles").stage do
      (share/"agent-compose").install "bundles"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-compose version")
  end
end
