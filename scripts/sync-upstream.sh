#!/usr/bin/env bash
# 从本地上游 clone 同步 ui-prototype（改名）
# 用法: bash scripts/sync-upstream.sh /path/to/upstream/clone
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
UPSTREAM="${1:-/tmp/emil-skills}"
SRC="$UPSTREAM/skills/prototype"
DST="$REPO_ROOT/skills/ui-prototype"
if [ ! -f "$SRC/SKILL.md" ] || [ ! -f "$SRC/PICKER.md" ]; then
  echo "error: 上游源不存在: $SRC" >&2
  exit 1
fi
mkdir -p "$DST"
cp "$SRC/SKILL.md" "$DST/SKILL.md"
cp "$SRC/PICKER.md" "$DST/PICKER.md"
sed -i 's/^name: prototype$/name: ui-prototype/' "$DST/SKILL.md"
echo "synced: $SRC -> $DST"
git -C "$REPO_ROOT" add -A
git -C "$REPO_ROOT" commit -m "sync: update ui-prototype from upstream" || echo "no changes to commit"
