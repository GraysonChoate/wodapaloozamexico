# PARALLEL PRODUCTION MATRIX

Use this during the sprint to avoid serial work and conflicting edits.

| Lane | Owner | Scope now | Never touch |
|---|---|---|---|
| Live cinematic build | Claude | `build/`: join variants, civic-flag insertion, then utility/rail integration | Codex-authored source assets and direction docs unless explicitly instructed |
| Material/art direction | Codex | authored print fields, rail/frame visual kit, source selection, visual review | `build/` while Claude is implementing |
| Independent review | Codex | normal-speed recording review, choice between motion variants, reader-experience notes | Claude's in-progress files |
| Production coordination | Both | sprint order, factual/copy constraints, milestone decisions | rewriting each other's work without a named handoff |

## Immediate overlap

- Claude: compare the four Beat 0 → 1 motion forms and retain the strongest visible transition.
- Codex: supplies `civic-flag-field-01.png`, reviews the selected join, and prepares the next
  visual decision while Claude works on the civic-flag integration.

## Handoff rhythm

1. Claude ships one visual milestone with a compact normal-speed recording.
2. Codex judges the experience, not just the checker output, and gives a precise proceed/revise
   call.
3. While Claude implements that call, Codex prepares the next source/material decision.

No lane waits on a full regression unless a demonstrated reader-facing defect requires it.
