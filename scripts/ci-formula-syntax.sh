#!/usr/bin/env bash
# Ruby syntax check over every formula. The dev-base image ships no Homebrew,
# so this stands in for `just audit` in CI. See docs/FEATURES.md.
set -euo pipefail

if ! command -v ruby >/dev/null 2>&1; then
  apt-get update -qq
  apt-get install -y -qq ruby
fi

for formula in Formula/*.rb; do
  ruby -c "$formula"
done
