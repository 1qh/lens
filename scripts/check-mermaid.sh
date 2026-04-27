#!/usr/bin/env bash
# Render-check every mermaid block in every changed (or all) .md file.
# Usage:
#   ./scripts/check-mermaid.sh           # check all .md files in repo
#   ./scripts/check-mermaid.sh --staged  # check only staged .md files
#   ./scripts/check-mermaid.sh path...   # check specific files
#
# Requires: mmdc (mermaid-cli). Install: brew install mermaid-cli

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

if ! command -v mmdc >/dev/null 2>&1; then
  echo "mmdc not found. install: brew install mermaid-cli" >&2
  exit 2
fi

files=()

if [[ "${1:-}" == "--staged" ]]; then
  while IFS= read -r f; do files+=("$f"); done < <(git diff --cached --name-only --diff-filter=ACMR | grep -E '\.md$' || true)
elif [[ $# -gt 0 ]]; then
  files=("$@")
else
  while IFS= read -r f; do files+=("$f"); done < <(git ls-files '*.md')
fi

if [[ ${#files[@]} -eq 0 ]]; then
  echo "no .md files to check"
  exit 0
fi

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

fail=0
total=0
seq=0

for f in "${files[@]}"; do
  [[ -f "$f" ]] || continue

  # extract mermaid blocks into numbered files in tmpdir
  awk -v dir="$tmpdir" -v file="$f" '
    /^```mermaid[[:space:]]*$/ {inblock=1; idx++; out=sprintf("%s/block-%s.mmd", dir, ++seq); origin[seq]=file ":" idx; print "ORIGIN " seq " " file ":" idx > (dir "/index"); next}
    /^```[[:space:]]*$/ && inblock {inblock=0; next}
    inblock {print > out}
  ' "$f"
done

# render each block
for block in "$tmpdir"/block-*.mmd; do
  [[ -f "$block" ]] || continue
  total=$((total + 1))
  seq_num="$(basename "$block" .mmd | sed 's/block-//')"
  origin="$(grep "^ORIGIN $seq_num " "$tmpdir/index" 2>/dev/null | awk '{print $3}')"
  out_svg="${block%.mmd}.svg"
  puppeteer_cfg=""
  [[ -f "${REPO_ROOT:-.}/.puppeteer.json" ]] && puppeteer_cfg="-p ${REPO_ROOT:-.}/.puppeteer.json"
  if ! mmdc $puppeteer_cfg -i "$block" -o "$out_svg" -q 2>"$block.err" >/dev/null; then
    fail=$((fail + 1))
    echo "FAIL: $origin"
    sed 's/^/  /' "$block.err" >&2
    echo "  --- block content ---"
    sed 's/^/  /' "$block"
    echo
  fi
done

echo "checked $total mermaid block(s), $fail failure(s)"
[[ $fail -eq 0 ]]
