# WODAPALOOZA MEXICO — PROJECT NERVOUS SYSTEM

**Read this first before proposing, building, auditing, or handing off work.** It is the shared
current-state brain for Codex and Claude. Detail documents remain evidence; this file records the
live decisions, work split, and non-negotiable direction.

## The outcome

Build a premium cinematic event website — not a video that happens to scroll. The reader moves
through a film, but also encounters designed places: framed moving objects, physical campaign
surfaces, readable information, orientation, and real actions.

`film → graphic object / moving frame → readable pause or choice → purposeful release → film`

Fullscreen footage is a deliberate high-impact state, never the automatic layout.

## Reference roles — do not blend them into one style

| Reference | Use it for | Do not borrow |
|---|---|---|
| Motion Frame / Sea Serenade / AI Film Studio | authored trajectories: off-axis entries, rotation/registration, crop windows, spatial planes, contained↔full-bleed changes, black breath | generic template boxes or their visual skin |
| Posh | discovery → pause → action; a sequence of web “places” | nightlife/product UI |
| Wodapalooza SoCal / Cali | compact event clarity, restrained utility labels, useful proof/partner or information rails | SoCal colours/layout or invented sponsor content |
| Mexico campaign art | tactile graphic world: paper, black ink, cyan/magenta/yellow spray, halftone, dry brush, misregistration, sign geometry | a blanket filter over film |
| Spider-Verse | confidence, print energy, surprising spatial graphic transitions | imitation or all-over maximalism |

## Motion law

Every scene change earns a relationship. Use a small authored vocabulary: diagonal/asymmetric
recession, shallow orbital or spiral lock, rotation that registers flat, shared-aperture
replacement, scale-through, crop/registration, and intentional black breath.

- “A box closes in the centre, then a new scene appears” is **not** enough by itself.
- Generic dip-to-black is never the default; use it only when black is the actual editorial punctuation.
- A hard step is valid only if the two frames already make one visual sentence.
- Judge at normal scrolling speed, desktop and mobile — contact sheets alone cannot approve a transition.
- Every transition should feel authored in its direction, angle, crop, and arrival; no one global template.

### Immediate creative exception: Ángel → cockpit

The currently integrated windshield-lock join fixes the empty seam but is **not final artistic
approval**. Codex owns a non-conflicting live study at
`build/angel-cockpit-diagonal-lab.html`: the city must recede through an asymmetric diagonal,
then the cockpit must first replace it **inside the same moving aperture** before that aperture
normalizes. It must not read as a cockpit sitting behind a shrinking city picture.

Claude must not alter Beat 0 → 1 until Codex hands off the selected motion and exact integration
instructions.

## Material world

Use print language as designed page-owned objects around film and held copy. Never grade,
relight, or impersonate the photographed footage.

Current approved kit:

- `reference/authored-materials/v1/print-field-01.png`
- `reference/authored-materials/v1/ink-gesture-01.png`
- `reference/authored-materials/v1/poster-edge-vertical-01.png`
- `reference/authored-materials/v1/action-paper-01.png`
- `reference/authored-materials/v1/civic-flag-field-01.png`
- `reference/authored-materials/v1/editorial-rail-field-01.png`

Use texture to make a plate, rail, frame edge, pause, or action feel physical. It is not filler,
not a full-page empty field, and not decoration on every beat. New original assets are welcome
when a named moment needs one; they must contain no invented facts, logos, or copy.

## Functional website layer

This is required after the mid-film flag interruption; it is not a last-minute generic nav bar.

- compact persistent mark/home control;
- one real `QUALIFIER ↗` escape hatch;
- quiet current-place/progress readout;
- small editorial index that links only to real held places;
- final action index as the rich destination;
- three one-time factual editorial rails: qualifier/date/proof.

The Cali lesson is useful utility and clarity, not permanent clutter: no invented sponsor grid,
no made-up partner logos, no generic ticker. If verified sponsor/partner facts arrive later, they
may become one purposeful rail or banner with a reason to exist.

## Source, truth, and accessibility

- Footage keeps source-native colour. UI remains neutral/green-to-blue; discrete print objects may use campaign colours.
- The supplied `Other B-Roll/` is approved working material. Exclude player chrome/end screens for visual quality.
- Every useful clip has an intentional home, but never a meaningless flash.
- Never invent venue, sponsor, date, schedule, attendance, or destination facts.
- Pre-Registro stays visibly disabled/unlinked until its complete official URL exists.
- Preserve readable copy, mobile, reduced motion, and reversible scroll.

## Current production state and owners

**Base:** 13-beat film plus the closing action index is intact. Beats 2, 5, 8, 9, and 12 remain
locked pending a real review request. Beat 13 → action uses true black breath and the flight HUD
releases before the action paper arrives.

| Now | Owner | Scope |
|---|---|---|
| Refine and select an authored Ángel → cockpit transition | Codex | standalone diagonal lab only; no live `build/index.html` edits while Claude works |
| Civic-flag interruption between Beats 7 and 8 | Claude | tall contained flag plate on `civic-flag-field-01.png`; public scale → real Spanish paper message |
| Integrate the selected Beat 0 → 1 result | Claude after explicit Codex handoff | live `build/index.html` only |
| Functional layer / information rails | Claude after flag | follow `reference/FUNCTIONAL-WEB-LAYER.md` |
| Material kit / independent review / precise next handoff | Codex | assets, labs, review, current direction |

No one edits the same live file concurrently. A completed visual decision is handed off with a
short sentence, visual target, exact file/asset, and acceptance check.

## Speed and review policy

The production window is short. Do not burn it on repeated whole-site gate runs or debugging test
infrastructure unless a reader-facing defect is shown. Per milestone: normal-speed desktop/mobile,
forward/reverse, no unwanted empty frame, and one performance check. Full regression once at a
review-ready milestone and once at major integration.

## Update protocol

When direction changes, update this file first, then the affected detailed document(s):
`CREATIVE-CONTROL.md`, `CLAUDE_HANDOFF.md`, `PRODUCTION-SPRINT-SUPERPROMPT.md`, and/or
`PARALLEL-PRODUCTION-MATRIX.md`. Do not treat old handoffs, screenshots, or audit prose as active
authority after this document supersedes them.
