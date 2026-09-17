# Features

Baseline inventory of what this tap ships today. Update the relevant section
whenever a formula is added, removed, or materially reshaped.

## Formulae

Tap with `brew tap coilyco-flight-deck/tap <forgejo-url>`, then install with
`brew install coilyco-flight-deck/tap/<formula>`. Every formula downloads and
verifies tagged release binaries from its upstream repo. None builds from
source.

- **[aos](../Formula/aos.rb)** - the agent runtime composition root, from
  `coilyco-flight-deck/agentic-os`. Ships `aoscompose` and `aosward` alongside
  the `aos` binary.
- **[agent-compose](../Formula/agent-compose.rb)** - Core Roster context
  composition for native agent harnesses.
- **[umbra](../Formula/umbra.rb)** - generates guarded CLIs from KDL policy and
  committed API locks, from `coilyco-flight-deck/umbra`. Was `specgen` to v0.191.0.

## Release bump automation

Each upstream tool's release pipeline writes its own version-pin bump here
through the forgejo Contents API, rewriting the release-asset URLs and
checksums of its matching formula. This repo holds no release pipeline of its
own and is only ever the write target.

## Forgejo CI

[.forgejo/workflows/ci.yml](../.forgejo/workflows/ci.yml) is the tap audit
surface. The dev-base image ships no Homebrew, so it runs Ruby syntax checks
across `Formula/*.rb` pending a move to `just audit`.

## See also

- [README.md](../README.md) - human-facing intro and quickstart.
- [AGENTS.md](../AGENTS.md) - agent-facing operating rules.
- [justfile](../justfile) - dev verbs, and [.ward/ward.yaml](../.ward/ward.yaml) - catalog metadata only.
