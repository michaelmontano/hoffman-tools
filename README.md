# Hoffman Process Integration Skills for Claude

A set of 19 AI-powered skills for integrating the [Hoffman Process](https://www.hoffmaninstitute.org/) into daily life, built for [Claude Code](https://claude.ai/code) and Claude's skill system.

If you've completed the Hoffman Process, these skills give you a deeply personalized integration companion — a coach who knows the framework inside and out, plus standalone tools for every practice you learned during your week.

## What's Included

### Skills (19)

| Skill | Trigger | What it does |
|-------|---------|-------------|
| `hoffman-coach` | Emotional patterns, relationships, growth | Orchestrator — knows you deeply, suggests the right tool at the right moment, maintains session memory |
| `hoffman-recycling` | "I'm stuck in a pattern" | Full 12-step Embodied Recycling practice |
| `hoffman-precycling` | "I can feel it coming" | Quick pattern interruption before it plays out |
| `hoffman-quadrinity` | "Check in with myself" | Guided check-in with Body, Emotional Child, Intellect, Spiritual Self |
| `hoffman-transference` | "I'm reacting to someone" | Negative Transference Exploration worksheet |
| `hoffman-vicious-cycle` | "I keep ending up in the same place" | Map pattern chains and find the exit ramp |
| `hoffman-morning` | "Morning practice" | Personalized morning grounding practice |
| `hoffman-evening` | "Evening practice" | Day review, pattern awareness, gratitude |
| `hoffman-gratitude` | "Appreciation practice" | From surface gratitude to embodied appreciation |
| `hoffman-self-compassion` | "I'm being hard on myself" | Kristin Neff's 3 components + Hoffman deepening |
| `hoffman-compassion` | "I'm judging someone" | Compassion & forgiveness for others |
| `hoffman-new-ways` | "What would my spiritual self do?" | Explore Right Road alternatives to patterns |
| `hoffman-dark-side-stomp` | "I need to let this out" | Embodied expression — move energy through the body |
| `hoffman-hand-on-heart` | "I need to ground" | Quick centering and self-soothing |
| `hoffman-pattern-trace` | "Where does this come from?" | Deep pattern archaeology — trace to childhood origin |
| `hoffman-spiritual-teacher` | "I need guidance" | Message from your High Spiritual Teacher / Spiritual Self |
| `hoffman-truce` | "My parts are in conflict" | Truce Agreement renewal between Quadrinity parts |
| `hoffman-left-road` | "Am I doing this right?" | Post-process pitfall awareness |
| `hoffman-family-roles` | "I'm playing a role" | Explore childhood roles still active in your life |

### Reference Materials

| File | Description |
|------|-------------|
| `references/hoffman-toolkit.md` | Complete tools & practices with step-by-step instructions |
| `references/hoffman-glossary.md` | Core Hoffman vocabulary and concepts |
| `references/pattern-catalog.md` | Full Negative Love Syndrome pattern taxonomy (30 categories, 500+ patterns) |

## Architecture: Three Layers

Each skill has three layers that are cleanly separated:

1. **Skill** (this repo) — The Hoffman tool/practice itself. Generic, shareable, works for anyone.
2. **Personal data** (`personal/` directory, gitignored) — Your specific patterns, wounds, family history, session notes. Private.
3. **Personalized build** — What you actually experience. The skill reads your personal data at runtime and adapts.

When you share this repo with a friend who's done Hoffman, they bring their own `personal/` directory. The skills auto-personalize.

## Setup

### 1. Clone

```bash
git clone https://github.com/michaelmontano/hoffman-tools.git ~/Dev-personal/Hoffman
```

### 2. Create your personal profile

Create a `personal/` directory with your data:

```bash
mkdir -p ~/Dev-personal/Hoffman/personal/sessions
```

Then create `personal/profile.md` with your Hoffman landscape. You can do this manually, or use Claude to extract it from your prep work:

```
# Using Claude Code
cd ~/Dev-personal/Hoffman
claude "Read all the photos in my-prep-photos/ and build personal/profile.md with my
Hoffman landscape: core wound, patterns from each parent (adopted, reactive, rebellious),
12 worst patterns, family details, emotional landscape, vision, Spiritual Self qualities,
and Truce Agreement."
```

Your profile should include:
- Core wound and cascade pattern
- Patterns from each parent (adopted, reactive, rebellious)
- 12 worst patterns with parent attribution
- Family details
- Emotional landscape
- Vision and goals
- Spiritual Self qualities
- Truce Agreement

### 3. Install skills

Symlink each skill into Claude's skills directory:

```bash
for skill in ~/Dev-personal/Hoffman/skills/hoffman-*/; do
  ln -sf "$skill" ~/.claude/skills/$(basename "$skill")
done
```

### 4. Verify

Start a new Claude Code session and try:

```
/hoffman-coach
/hoffman-recycling
/hoffman-morning
```

## Usage

### With the coach

Just talk to Claude about what's going on. The coach skill triggers on emotional patterns, relationship dynamics, parenting, self-worth, and personal growth. It will suggest specific tools when appropriate.

### Standalone tools

Invoke any tool directly:

- "I want to do a recycling practice"
- "Let's do a quadrinity check-in"
- "I'm triggered by someone — help me explore the transference"
- "Morning practice"
- "Hand on heart — I need to ground"

### Memory and continuity

The coach writes session notes to `personal/sessions/` and updates `personal/integration-journal.md` after meaningful exchanges. This means continuity across conversations — it picks up where you left off.

## For Hoffman Graduates

These skills are built from the complete Hoffman Process curriculum (Rev. 09/25). They cover all practices, tools, and frameworks taught during the 7-day intensive. They are not a substitute for the Process itself — they are an integration companion for those who have already done the work.

If you haven't done the Hoffman Process, these tools may still be useful for self-reflection, but the full experience of the Process provides the embodied foundation that makes these tools truly powerful.

## License

MIT — share freely. The Hoffman Process framework belongs to the Hoffman Institute Foundation. These skills are personal integration tools, not official Hoffman materials.
