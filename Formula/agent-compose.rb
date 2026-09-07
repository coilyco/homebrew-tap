class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.104.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.104.0/agent-compose-roster.tar.gz"
    sha256 "246f268cddd341bb0045823b42f2fc27f5bfdbb7d819e450bced1ad08e6686c7"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.104.0/agent-compose-bundles.tar.gz"
    sha256 "a52ae2fa48e9267c95b059093573dfea9ecae55dba768c2bb81092f33b4d09de"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.104.0/agent-compose-darwin-arm64"
      sha256 "34d693fdb142dbf32e4d8e792860441c4091754fc7ad319637c765c00e7d6cf2"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.104.0/agent-compose-linux-amd64"
      sha256 "c00b3627980135b71e3f279f926f2501477a793ae86c03deb5e1079631a07402"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.104.0/agent-compose-linux-arm64"
      sha256 "17df85834e600d141201ca6f8990bc0b66836bc6dab91c7667d28dd50bcaeb97"
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
