# PARALLEL PRODUCTION MATRIX

Use this during the sprint to avoid serial work and conflicting edits.

| Lane | Owner | Scope now | Never touch |
|---|---|---|---|
| Live cinematic build | Claude | `build/`: civic-flag insertion, then utility/rail integration | Beat 0→1 while Codex owns its diagonal-lab decision |
| Material/art direction | Codex | authored print fields, rail/frame visual kit, source selection, visual review | `build/` while Claude is implementing |
| Independent review | Codex | normal-speed recording review, choice between motion variants, reader-experience notes | Claude's in-progress files |
| Production coordination | Both | sprint order, factual/copy constraints, milestone decisions | rewriting each other's work without a named handoff |

## Immediate overlap

- Codex: refine/select the Beat 0 → 1 diagonal shared-aperture study in
  `build/angel-cockpit-diagonal-lab.html`; then issue a concise live-build handoff.
- Claude: after reading `PROJECT-NERVOUS-SYSTEM.md`, build the civic-flag interruption using
  `civic-flag-field-01.png` without touching Beat 0→1.

## Handoff rhythm

1. Claude ships one visual milestone with a compact normal-speed recording.
2. Codex judges the experience, not just the checker output, and gives a precise proceed/revise
   call.
3. While Claude implements that call, Codex prepares the next source/material decision.

No lane waits on a full regression unless a demonstrated reader-facing defect requires it.
