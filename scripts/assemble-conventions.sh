#!/usr/bin/env bash
# Assemble the root CONVENTIONS.md from conventions/ modules.
# The root file is the full display version (general + all language modules)
# with a custom header for the GitHub org page.

set -euo pipefail

cd "$(dirname "$0")/.."

header="# Code Conventions

Shared conventions for all tskovlund repositories. The canonical source is
[\`conventions/\`](conventions/) in this repo. This file is assembled from
\`conventions/general.md\` + all language modules for display. Edit the source
files in \`conventions/\`, not this file directly."

# Start with the header, then general.md content (skip its first 3 lines: title + blank + subtitle)
echo "$header" > CONVENTIONS.md
tail -n +4 conventions/general.md >> CONVENTIONS.md

# Append each language module in alphabetical order
for module in conventions/lean.md conventions/python.md conventions/qed.md conventions/typescript.md; do
  if [ -f "$module" ]; then
    echo "" >> CONVENTIONS.md
    cat "$module" >> CONVENTIONS.md
  fi
done
