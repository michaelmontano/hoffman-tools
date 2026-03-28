#!/bin/bash
# Install the Hoffman plugin for Claude Code
# Creates a symlink so Claude Code discovers the plugin automatically

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_DIR="$HOME/.claude/plugins"
LINK="$PLUGIN_DIR/hoffman"

mkdir -p "$PLUGIN_DIR"

if [ -L "$LINK" ]; then
  echo "  ~ hoffman plugin already linked → $(readlink "$LINK")"
  echo "  To reinstall, remove it first: rm $LINK"
elif [ -e "$LINK" ]; then
  echo "  ! $LINK exists but is not a symlink — skipping"
else
  ln -s "$SCRIPT_DIR" "$LINK"
  echo "  ✓ Installed hoffman plugin → $SCRIPT_DIR"
fi

echo ""
echo "Start a new Claude Code session to pick up the plugin."
echo "Skills are invoked as /hoffman:coach, /hoffman:recycling, etc."
