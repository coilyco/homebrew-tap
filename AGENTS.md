---
ward:
  workflow: pull-request-and-merge
---
# Agent instructions for `coilyco-flight-deck/homebrew-tap`

Orientation for fresh Claude / mobile sessions. Keep this short.

## Scope

The centralized Homebrew tap for `coilyco-flight-deck/*` tools. Every `Formula/*.rb` file downloads and checksum-verifies tagged release binaries from its upstream release. None builds from source.

## Project shape

Active formulae:

- `Formula/umbra.rb` - tracks `coilyco-flight-deck/umbra` releases. Named `specgen` until the driver took the framework's name; the old formula is gone rather than aliased.
- `Formula/agent-compose.rb` - tracks `coilyco-flight-deck/agent-compose` releases, and installs `acompose` alongside.
- `Formula/aos.rb` - tracks `aos-v*` releases from `coilyco-flight-deck/agentic-os`, and installs `aoscompose` and `aosward` alongside.

The `repo-recall`, `session-lattice`, `session-lattice-puller`, and `ward` formulae are gone, because their upstream repos are archived.

## Release

Upstream repos cut a tag. Their release pipeline rewrites the matching formula here via the Contents API, refreshing the release-asset URLs and the per-platform checksums. Once the bump lands on `main`, `brew upgrade` picks it up. This repo holds no release pipeline of its own, so it is only ever the write target for the upstream ones.

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

Repository dev verbs run through the [`justfile`](justfile). Operator verbs (aws/ssm, tailscale, kubectl, forgejo) run through `aosguard ops <area>`. Enumerate them with `aosguard ops <area> describe` rather than guessing. Bare `brew`, `gh`, `aws`, and `kubectl` are denied by the harness.

## Cross-repo contracts

Upstream `coilyco-flight-deck/*` repos rewrite their own formula here through
the Contents API. This repo never reaches back into them.

## Validation

Run `pre-commit run --all-files` before committing. The catalog suite is
consumed by upstream ref and never forked.

## Agent rules

<!-- BEGIN managed by agentic-os/scripts/apply-git-workflow.py -->
### Git workflow

**This repo runs the `pull-request-and-merge` lane**, declared as `ward.workflow` in this file's frontmatter. The agent commits to a task branch, pushes it, opens a GitHub pull request, and **merges that pull request itself** once it is green. The author of the code is the one who merges it. Opening the pull request is a step, never the stopping point.

The fleet runs one lane, and it authorizes the agent end to end. Pushing straight to `main` is over: `merge-remote-main` is retired, so no repo can declare its way back to one.

* `pull-request-and-merge` - the agent commits to a task branch, pushes it, opens a pull request, and merges that pull request itself once it is green.

**Every lane slug names what the AGENT does, never what someone else does.** `pull-request-and-merge` carries the merge because the agent that authored the code merges its own pull request. `pull-request` drops `-and-merge` because the author stops at the pull request and the director merge lane takes over. Reading `pull-request-and-merge` as "someone else merges it later" inverts the two and leaves finished work sitting unmerged.

**These actions are pre-authorized on every lane, and the agent MUST take them without asking first.** Committing, creating a branch, pushing a branch, pushing the lane's own destination, and opening a pull request are ordinary reversible work, not the destructive wall that earns a question. Stopping to ask is how a turn ends with the work stranded in a dirty worktree.

* **ALWAYS commit** in-scope work and **ALWAYS push** it to the canonical remote before pausing, reporting a checkpoint, handing off, or ending a turn. A local-only commit is not a checkpoint.
* **ALWAYS open the pull request** in the same turn as the branch's first push, on every lane except `remote-branch-only`. A pushed branch with no pull request is litter nobody reviews.
* **NEVER `--no-verify`** and **NEVER force-push**. Those two are the real walls, and they stay closed.
* **ALWAYS merge your own pull request on `pull-request-and-merge`**, in the same turn, as soon as it is green. Reporting it as open and awaiting someone is the failure this lane exists to prevent.
* **A merge refused because the head branch is behind the base branch is yours to fix, never a reason to ask.** Update the branch yourself, with `gh pr update-branch <number> --repo <owner>/<repo>` or by merging `origin/main` into it and pushing, never by force. Wait for green, then merge with `gh pr merge <number> --repo <owner>/<repo> --squash`. The guarded `gh` refuses a pull-request verb that names no `--repo`.
* **NEVER merge on `pull-request` or `remote-branch-only`.** Those two stop where they stop, and the director merge lane carries a `pull-request` from there.
<!-- END managed by agentic-os/scripts/apply-git-workflow.py -->

Use she/her for Kai. No em dashes, italics, or semicolons in prose. Name the
actor in every action sentence.

## Git workflow

- Commit to `main`, push after each commit. No PRs unless asked.
- Canonical history lives on GitHub (COI-2945). The Forgejo copy is no longer mirrored from here.

## Commands

Route every dev command through the [`justfile`](justfile). Add new verbs to that file before invoking them.

## Checkout residency

This repo is not in Agent Compose's `repository-plan.yaml`, so it has no
resident checkout under `~/projects/<owner>/`. That is intentional. Work it
from a task-scoped temporary clone, and remove that clone once the work lands.

A temporary root can be purged at any time, so commit and push before pausing,
switching tasks, or ending a session. The remote is the only durable artifact.

## See also

- [README.md](README.md) - human-facing intro and install steps.
- [docs/FEATURES.md](docs/FEATURES.md) - inventory of what ships today.
- [justfile](justfile) - dev verbs.
- [.ward/ward.yaml](.ward/ward.yaml) - catalog metadata only. Agents route through ward, not bare `brew`.
