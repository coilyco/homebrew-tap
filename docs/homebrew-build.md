# Homebrew build notes

## GOPROXY bypass

cli-guard has no semver tags yet, so source-built consumers pin via
pseudo-version. `proxy.golang.org` 403s the fresh pseudo-version on
first fetch even though the upstream tarball is reachable. Affected
formulae set `GOPROXY=direct` and `GOSUMDB=off` in the brew sandbox to
bypass the proxy for module fetches.

## Tailnet-only downloads

agent-compose downloads from the coilyco Forgejo, which answers only on the
tailnet. Its formula loads `lib/tailnet_download_strategy.rb` and names it on every
`url` with `using:`, so an outsider gets "only available on the coilyco tailnet"
within 3 seconds instead of a curl timeout. A download already in the cache skips
the probe. `scripts/test-tailnet-strategy.rb` runs in CI. The formula is rendered by
agent-compose's `scripts/render-packaging.sh`, so a change here belongs there too.
