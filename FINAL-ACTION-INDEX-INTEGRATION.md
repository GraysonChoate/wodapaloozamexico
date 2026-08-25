# Final Action Index — Integration Brief

**Tracks:** campaign-print/material world · official event/action system · whole-film pacing/QA

## Purpose

Replace Beat 13's current small floating link cluster with a true ending destination. The film
must still end itself; the index begins only after its footage has reached genuine black.

The approved visual study is `reference/prototypes/final-action-index.html`.

## Exact handoff

1. **Beat 13 stays source-honest.** Keep `b13_close.mp4`, its existing scrub warp, and the
   footage-supplied fade to black. Do not overlay the paper surface on the monument or fade
   the video early to make space.
2. **Remove the current `.b13out` link cluster** from the final experience. It is a temporary
   functional placeholder, not the final action system.
3. **After Beat 13 completes**, add one separate end section, beginning on the same black:
   - desktop/mobile scroll length: start at `300svh`; adjust only after real review;
   - first 6%: black hold, very short—no black void;
   - 6–33%: action-paper object rises from below with restrained perspective/scale;
   - 33–47%: it settles into its final box and the index becomes readable;
   - remainder: stable, interactive action destination. It does not exit or fade away.
4. The return-to-top control appears after lock and remains present to the end.

There must be no perceptible cut between Beat 13's final black frame and the new section's black
opening. The first visible page-owned colour is the green→blue hairline; campaign-print cyan,
magenta, yellow, and black belong only to the paper object itself.

## Content and interaction

Use only this inventory:

| Number | Label | State |
|---:|---|---|
| 01 | Pre-Registro | visibly disabled; `Próximamente`; do not invent an href |
| 02 | Inscríbete en el Online Qualifier | live CompetitionCorner link |
| 03 | Dudas y preguntas, aquí te ayudamos | live HubSpot link |
| 04 | Rulebook WZA CDMX | live Drive link |

Secondary only: `@wodapaloozamexico` and an Asdeporte organizer credit. No extra tickets,
venue, travel, schedule, sponsor grid, merch, or generic motivational CTA.

`THE INDEX.` and `Choose your way in` are approved prototype copy, not locked final copy. Keep
them while integrating; revise only after the whole ending can be judged in context.

## Visual system

- Use `reference/authored-materials/v1/action-paper-01.png` as the quiet reading ground.
- Use the clean official logo asset—not a typed approximation or a repeated watermark.
- The paper is a large editorial object, not a rounded UI card. No radius, glass, dashboard
  widgets, or all-page texture.
- Hover/focus may invert an individual row to black/white and nudge it slightly. Keep the
  complete list readable at rest.
- Mobile changes to one column and may suppress secondary utility copy; it never reduces the
  main action labels to icons or hides the primary actions.

## Required verification

- Headed desktop 1440×900 and mobile 375×812.
- Normal downward scroll, reverse scroll, stopped state, fast scroll, no-JS and reduced motion.
- All live links open their intended destination; disabled Pre-Registro is not focusable/clickable.
- Action text remains readable and the return control persists at the deepest state.
- Verify the Beat 13 fade stays fully black before the index enters.

## Boundary

Claude integrates this into the live build only after the isolated Ángel full-bleed → contained
frame prototype has been reviewed. Codex audits the integrated ending in full-sequence context.
