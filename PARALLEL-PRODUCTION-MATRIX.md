# PARALLEL PRODUCTION MATRIX

Use this during the sprint to avoid serial work and conflicting edits.

| Lane | Owner | Scope now | Never touch |
|---|---|---|---|
| Live cinematic build | Claude | `build/`: functional utility/rail integration after opening checkpoint `379ca7f` | Beats 0–2 and the Beat 12 date study |
| Material/art direction | Codex | authored print fields, rail/frame visual kit, source selection, visual review | `build/` while Claude is implementing |
| Independent review | Codex | normal-speed recording review, choice between motion variants, reader-experience notes | Claude's in-progress files |
| Production coordination | Both | sprint order, factual/copy constraints, milestone decisions | rewriting each other's work without a named handoff |

## Immediate overlap

- Codex: reviews the saved opening and supplies material/source direction without editing Claude's
  functional pass.
- Claude: builds the functional layer only; the late-film date-to-venue treatment remains a saved
  approved study until a later named handoff.

## Handoff rhythm

1. Claude ships one visual milestone with a compact normal-speed recording.
2. Codex judges the experience, not just the checker output, and gives a precise proceed/revise
   call.
3. While Claude implements that call, Codex prepares the next source/material decision.

No lane waits on a full regression unless a demonstrated reader-facing defect requires it.
