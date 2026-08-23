# homebrew-tap

The Homebrew tap for every `coilyco-flight-deck` CLI. One tap to add, and each
tool installs by name from there. macOS and Linux.

## Install

The tap lives on Forgejo rather than github.com, so brew cannot resolve the URL
from the tap name. Spell it out once:

```sh
brew tap coilyco-flight-deck/tap https://forgejo.coilysiren.me/coilyco-flight-deck/homebrew-tap
```

Then install whichever tools you want:

```sh
brew install coilyco-flight-deck/tap/ward
brew install coilyco-flight-deck/tap/specgen
brew install coilyco-flight-deck/tap/agent-compose
brew install coilyco-flight-deck/tap/aos
```

`brew upgrade` picks up new versions once an upstream release lands its bump
here. Windows users take the same tools from the sibling
[scoop-bucket](https://forgejo.coilysiren.me/coilyco-flight-deck/scoop-bucket).

## What is in the tap

- [`ward`](Formula/ward.rb) - governed execution layer for coding agents. Runs
  agent work in fresh least-access containers and records a durable
  issue-to-landing trail. From
  [ward](https://forgejo.coilysiren.me/coilyco-flight-deck/ward).
- [`specgen`](Formula/specgen.rb) - generates a standalone guarded CLI from KDL
  policy plus a committed lock, with no hand-written Go. From
  [umbra](https://forgejo.coilysiren.me/coilyco-flight-deck/umbra).
- [`agent-compose`](Formula/agent-compose.rb) - composes the role, doctrine,
  and skill context an agent harness loads. Also installs `acompose`. From
  [agent-compose](https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose).
- [`aos`](Formula/aos.rb) - the agent runtime composition root. Also installs
  `aoscompose` and `aosward`. From
  [agentic-os](https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os).

Every formula downloads and checksum-verifies a tagged release binary. None
builds from source, so no toolchain is required to install.

## How a version bump lands here

An upstream repo cuts a tag, and its own release pipeline rewrites the matching
formula in this repo through the Forgejo Contents API, refreshing the
release-asset URLs and the per-platform checksums. Once that bump lands on
`main`, `brew upgrade` sees it.

This tap holds no release pipeline. It is only ever the write target for the
upstream ones, so an agent working here does not hand-edit a version pin to
race ahead of the pipeline. Install and test logic in a formula is owned here
and is fine to edit.

## Commands

Dev verbs live in the [`justfile`](justfile). Run `just` alone to list them,
and `just audit` to run `brew audit --strict` across the tap.

## See also

- [AGENTS.md](AGENTS.md) - agent-facing operating rules.
- [docs/FEATURES.md](docs/FEATURES.md) - inventory of what ships today.
- [docs/homebrew-build.md](docs/homebrew-build.md) - build-time notes (GOPROXY bypass).
- [.ward/ward.yaml](.ward/ward.yaml) - catalog metadata only.
