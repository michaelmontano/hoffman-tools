#!/bin/bash
# Build .skill packages for Cowork installation
# Run from the Hoffman root directory

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIST_DIR="$SCRIPT_DIR/dist"
SKILLS_DIR="$SCRIPT_DIR/skills"

mkdir -p "$DIST_DIR"

echo "Building .skill packages..."

for skill_dir in "$SKILLS_DIR"/hoffman-*/; do
  skill_name=$(basename "$skill_dir")
  output="$DIST_DIR/$skill_name.skill"

  # Each .skill is a zip of the skill directory contents (SKILL.md at root)
  (cd "$skill_dir" && zip -q "$output" SKILL.md)

  echo "  ✓ $skill_name.skill"
done

echo ""
echo "Built $(ls "$DIST_DIR"/*.skill | wc -l | tr -d ' ') skills to dist/"
echo ""
echo "To install in Cowork:"
echo "  Settings → Skills → Install from file → select each .skill from dist/"
echo ""
echo "To install symlinks for Claude Code (run once):"
echo "  ./install-code.sh"
