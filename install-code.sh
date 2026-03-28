#!/bin/bash
# Install Hoffman skills as symlinks in ~/.claude/skills/
# Safe to re-run — skips skills that are already linked

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"
TARGET_DIR="$HOME/.claude/skills"

mkdir -p "$TARGET_DIR"

echo "Installing Hoffman skills to $TARGET_DIR..."

for skill_dir in "$SKILLS_DIR"/hoffman-*/; do
  skill_name=$(basename "$skill_dir")
  link="$TARGET_DIR/$skill_name"

  if [ -L "$link" ]; then
    echo "  ~ $skill_name (already linked)"
  elif [ -e "$link" ]; then
    echo "  ! $skill_name (exists but not a symlink — skipping)"
  else
    ln -s "$skill_dir" "$link"
    echo "  ✓ $skill_name"
  fi
done

echo ""
echo "Done. Start a new Claude Code session to pick up the skills."
