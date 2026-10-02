#!/usr/bin/env bash
# Ruby syntax check over every formula. The dev-base image ships no Homebrew,
# so this stands in for `just audit` in CI. See docs/FEATURES.md.
set -euo pipefail

if ! command -v ruby >/dev/null 2>&1; then
  apt-get update -qq
  apt-get install -y -qq ruby
fi

for ruby_file in Formula/*.rb lib/*.rb; do
  ruby -c "$ruby_file"
done

# The tailnet download strategy, against stand-ins for Homebrew's classes.
ruby scripts/test-tailnet-strategy.rb
