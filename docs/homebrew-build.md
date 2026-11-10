# Homebrew build notes

## GOPROXY bypass

cli-guard has no semver tags yet, so source-built consumers pin via
pseudo-version. `proxy.golang.org` 403s the fresh pseudo-version on
first fetch even though the upstream tarball is reachable. Affected
formulae set `GOPROXY=direct` and `GOSUMDB=off` in the brew sandbox to
bypass the proxy for module fetches.

## Private releases

agent-compose ships from the private `coilyco/treehouse-servers` (COI-3301), so its release urls answer 404 to anyone without access. The formula loads `lib/private_github_release_download_strategy.rb` and names it on every `url` with `using:`. The strategy finds the asset through the GitHub API and downloads it with Homebrew's own credentials: `HOMEBREW_GITHUB_API_TOKEN`, then a `gh` login, then the keychain. The token goes through a 0600 header file, never argv, and no token is stored here. With none, it says to run `gh auth login`. `scripts/test-private-release-strategy.rb` runs in CI against stand-ins. Each release needs its formula bumped by hand until the release workflow pushes it (COI-3302).

`lib/tailnet_download_strategy.rb` is unused since the Forgejo host went away.
