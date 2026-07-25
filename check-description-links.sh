#!/usr/bin/env bash
#
# check-description-links.sh
#
# DESCRIPTION link-integrity guard for a RagedUnicorn WoW AddOn *-meta repo.
#
# The store descriptions (DESCRIPTION*.md) are published verbatim to CurseForge
# and Wago, and every image they embed is a raw.githubusercontent.com URL that
# points back into this repo's own assets/. If an asset is renamed or removed
# without updating the description, the live store pages silently break. This
# script fails when any embedded raw URL points at a file that does not exist in
# the working tree (the state about to be published), so the break is caught in
# the same commit rather than on the live page.
#
# Canonical copy lives in the wow-media-capture skill at
# reference/meta-repo/check-description-links.sh. Copy it verbatim into each
# meta repo root; see that directory's README.md for the install steps.
#
# Exit status: 0 = every link resolves; 1 = one or more missing, or no
# DESCRIPTION*.md found.

set -euo pipefail

# Operate from the repo root (this script's own directory), so it works the same
# whether CI runs `bash check-description-links.sh` from the checkout root or a
# developer runs it by absolute path.
cd "$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"

shopt -s nullglob
description_files=(DESCRIPTION*.md)

if [ ${#description_files[@]} -eq 0 ]; then
  echo "check-description-links: no DESCRIPTION*.md found in $(pwd)" >&2
  exit 1
fi

checked=0
missing=0

for file in "${description_files[@]}"; do
  # Pull every raw.githubusercontent URL out of the markdown. The character
  # class stops at whitespace and the markdown/HTML delimiters ) " < > so an
  # ![alt](url) link or an <img src="url"> attribute yields a clean URL.
  while IFS= read -r url; do
    [ -n "$url" ] || continue
    # Strip protocol, host, owner, repo and branch, leaving the repo-relative
    # path: https://raw.githubusercontent.com/<owner>/<repo>/<branch>/<path>
    path=$(printf '%s' "$url" \
      | sed -E 's#^https://raw\.githubusercontent\.com/[^/]+/[^/]+/[^/]+/##')
    checked=$((checked + 1))
    if [ ! -e "$path" ]; then
      echo "MISSING: $file -> $path"
      missing=$((missing + 1))
    fi
  done < <(grep -oE 'https://raw\.githubusercontent\.com/[^[:space:]")<>]+' "$file" | sort -u)
done

if [ "$missing" -gt 0 ]; then
  echo "check-description-links: $missing missing asset link(s) across ${#description_files[@]} DESCRIPTION file(s)" >&2
  exit 1
fi

echo "check-description-links: OK ($checked link(s) across ${#description_files[@]} DESCRIPTION file(s) resolve)"
