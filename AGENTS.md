---
ward:
  workflow: merge-remote-main
---
# Agent instructions for `coilyco-flight-deck/homebrew-tap`

Orientation for fresh Claude / mobile sessions. Keep this short.

## Scope

The centralized Homebrew tap for `coilyco-flight-deck/*` tools. Most `Formula/*.rb` files point at a tag + revision on their upstream forgejo repo; `Formula/ward.rb` tracks tagged release binaries instead.

## Project shape

Active formulae:

- `Formula/ward.rb` - tracks `coilyco-flight-deck/ward` releases by downloading the tagged platform binaries and verifying them.
- `Formula/repo-recall.rb` - tracks `coilyco-flight-deck/repo-recall` releases.
- `Formula/session-lattice.rb` - tracks `coilyco-flight-deck/session-lattice` releases.
- `Formula/session-lattice-puller.rb` - companion service formula; pinned in lockstep with `session-lattice.rb`.

## Release

Upstream repos cut a tag. Their release pipeline rewrites the matching formula here via the forgejo Contents API. `ward` refreshes its release-asset URLs and checksums; the other formulae still pin upstream tag + revision. Once the bump lands on `main`, `brew upgrade` picks it up. This repo holds no release pipeline of its own - it is the write target for the upstream ones.

## Repo boundaries

This repo is the write target for upstream release pipelines, never a source of
one. Formula install and test logic is owned here. The version pin is not.

## Forbidden ops

- Do not hand-edit a formula's `url` / `tag` / `revision` to race ahead of the upstream release pipeline. The pipeline is the source of truth for the version pin.
- Do not bypass commit hooks (`--no-verify`).

Editing the install/test logic of a formula (e.g. build flags, staging files) is fine. The upstream pipeline only rewrites the version-pin `url` line.

## Safety

Nothing privileged is hardcoded here. Formula sources are public tags and
release assets, verified by checksum.

## Privileged ops

Anything privileged routes through `ward` (contributor verbs: exec/git/pkg/audit/hook) or `ward-kdl ops` (operator surface: aws/ssm, tailscale, kubectl, forgejo). Bare `brew`, `gh`, `aws`, `kubectl`, etc. are denied by the harness.

## Cross-repo contracts

Upstream `coilyco-flight-deck/*` repos rewrite their own formula here through
the forgejo Contents API. This repo never reaches back into them.

## Validation

Run `pre-commit run --all-files` before committing. The catalog suite is
consumed by upstream ref and never forked.

## Agent rules

Use she/her for Kai. No em dashes, italics, or semicolons in prose. Name the
actor in every action sentence.

## Git workflow

- Commit to `main`, push after each commit. No PRs unless asked.
- Canonical history lives on forgejo; the GitHub mirror (if any) stays PR-gated.

## Commands

Route every dev command through ward, which reads [`.ward/ward.yaml`](.ward/ward.yaml). Add new verbs to that file before invoking them.

## Checkout residency

This repo is not in Agent Compose's `repository-plan.yaml`, so it has no
resident checkout under `~/projects/<owner>/`. That is intentional. Work it
from a task-scoped temporary clone, and remove that clone once the work lands.

A temporary root can be purged at any time, so commit and push before pausing,
switching tasks, or ending a session. The remote is the only durable artifact.

## See also

- [README.md](README.md) - human-facing intro and install steps.
- [docs/FEATURES.md](docs/FEATURES.md) - inventory of what ships today.
- [.ward/ward.yaml](.ward/ward.yaml) - allowlisted commands. Agents route through ward, not bare `brew`.
