# PAUSE / RESUME HANDOFF — WODAPALOOZA MEXICO

Read this entire instruction before acting.

We are pausing the production sprint after context ingestion. Do **not** begin the next build,
retune the live film, add effects, run long capture jobs, or push a speculative change in this
handoff. The goal is a clean, exact restart point.

## Ingest in this order

1. `PRODUCTION-SPRINT-SUPERPROMPT.md`
2. `CREATIVE-CONTROL.md`
3. `CLAUDE_HANDOFF.md`
4. `MOTION-REFERENCE-PLAYBOOK.md`
5. `TRANSITION-PASS-BRIEF.md`
6. `MIDFILM-FRAME-SELECTION.md`
7. `reference/FUNCTIONAL-WEB-LAYER.md`

The sprint prompt is the active production order. These documents collectively preserve the
creative and technical constraints; do not reconstruct direction from earlier chat summaries.

## Do only these actions now

1. Confirm the actual current Git HEAD and working-tree state. Do not alter either.
2. Confirm whether the Beat 0 → 1 and Beat 6 → 7 work at `ecc539b` is present in the current
   build and whether it awaits visual review or has been superseded by a later committed change.
3. Confirm the next build task is the contained civic-flag interruption between Beat 7 and Beat
   8, not a general transition sweep, navigation build, Reforma time-lapse, or another texture
   pass.
4. Identify any uncommitted or running work that a resuming builder must know about. Do not
   “clean up” or modify it.

## Reply with one compact restart card

- **Current head:** [actual commit]
- **Working tree:** [clean / exact files changed]
- **Last completed visual milestone:** [one sentence]
- **Next build:** [one sentence]
- **Then:** [the next two milestones from the sprint]
- **Open dependency:** [only if real; otherwise “none”]

Then stop and wait. Do not add commentary, further audits, or code changes. On resume, continue
from `PRODUCTION-SPRINT-SUPERPROMPT.md` at the stated next build task.
