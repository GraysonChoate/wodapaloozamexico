# The final action index — live at the bottom of the real film

Integrated into `build/index.html` to `FINAL-ACTION-INDEX-INTEGRATION.md`. Not a prototype:
these captures are the end of the actual thirteen-beat film, after Beat 13 has reached its own
black.

Beat 0 was not touched. No new effects were added anywhere else. No ticker, no permanent
navigation.

## Naming

`act-<viewport>-<percent through the section>.jpg` — 11 stops each at 1440×900 and 375×812,
plus `act-<viewport>-handoff-black.jpg`, captured 4px above the section's own top.

## What was removed

Beat 13's `.b13out` cluster is gone — markup, CSS, its entry in the dark-ground selector list,
and the `--outro` timeline that drove it. It was a research placeholder carrying the wrong
inventory (a qualifier date, an Instagram handle, an organiser credit) presented as though it
were the conversion hierarchy. Beat 13's clip, its scrub warp and its footage-supplied fade are
untouched.

## The seam

Measured 4px above the index, at both viewports:

```
b13 stage opacity   0
index opacity       0
#b13 .stage bg      rgb(0, 0, 0)
#action bg          rgb(0, 0, 0)
```

Both sides of the join are the same pure black and neither carries any picture, so there is no
perceptible cut. The film ends itself; the page then becomes paper.

## Timeline — forward and reverse, identical at all 11 stops

| through | signal | sheet | return | on screen |
|---:|---:|---:|---:|---|
| 0.00 | 0.000 | 0.000 | 0.000 | — |
| 0.04 | 0.167 | 0.000 | 0.000 | black, hairline arriving |
| 0.10 | 0.667 | 0.148 | 0.000 | sheet rising |
| 0.18 | 1.000 | 0.444 | 0.000 | |
| 0.26 | 1.000 | 0.741 | 0.000 | |
| 0.33 | 1.000 | **1.000** | 0.125 | locked |
| 0.42 | 1.000 | 1.000 | 0.688 | |
| 0.55–1.00 | 1.000 | 1.000 | **1.000** | stable, interactive |

After a hard fling to the very bottom and a walk back up, every stop returned the same values —
no drift. Nothing about this surface ever fades out again: it is the end of the road.

## Requirements, verified

| Requirement | Result |
|---|---|
| Beat 13 fade intact | clip, warp and fade untouched; seam measured pure black both sides |
| `.b13out` removed | 0 references remaining anywhere in the file |
| Real WZA mark | `media/logo/mark-gradient.png`, byte-identical to `assets/logos/LOGO_WZA1.png`; `mix-blend-mode:multiply` sets it into the sheet |
| Date and location | `Ciudad de México · 04 · 05 · 06 · Diciembre 2026` |
| Pre-Registro visibly disabled | a `<span aria-disabled="true">` with **no href** — absent from the tab order, not clickable, not focusable |
| Three working actions | CompetitionCorner, HubSpot, Drive — all `target="_blank" rel="noopener noreferrer"` |
| Instagram utility | present and linked |
| Persistent return-to-top | appears at 0.33 and holds **1.000 to the last pixel**; `href="#top"`, and an explicit `<span id="top">` anchor was added at document top so it survives any beat being renamed |
| Tab order | Qualifier → Dudas → Rulebook → Instagram. Pre-Registro correctly skipped |
| Reduced motion | section collapses to natural height, sheet and return forced visible, return becomes a normal block |
| No-JS | all 24 poster frames render; sheet defaults to its locked state |
| Console | clean apart from a `favicon.ico` 404 |

## A contrast failure that our gate could not see

`contrast.sh` passed this sheet completely. It was wrong, and it will always be wrong here:
it reads `getComputedStyle().backgroundColor` and walks up for the first opaque one. On a
campaign-print surface the ground is a background **image**, so the computed colour is
`rgba(0,0,0,0)` the whole way up and the gate measures dark type against whatever solid sits
behind the picture.

Measuring the real pixels found **"Próximamente" at 1.85:1** and its row number at 1.88:1 —
the word carrying the entire meaning of the disabled state was the least readable thing on the
page.

The cause was `opacity:.5` on the pending row. Opacity does not dim dark ink against a light
ground, it drags it *toward* the paper. Muted by chosen ink instead (`#4a4a4a`, which holds
5.8:1 even over the magenta halftone), with a boxed tag doing the work of saying "state" so
legibility no longer has to.

**`build/inkcheck.sh` is new and is now gate 5 in `regress.sh`.** It screenshots the real page,
samples actual pixels in a band around every run of type that sits on a printed ground, and
flattens the ink by its effective opacity before comparing. It reports **31 runs, all clear**.
It is not vacuous — the same algorithm produced the 1.85:1 finding above.

## A second tool that had gone stale

`scrub-audit.sh` asserted "total screens ≈ number of beats" under reduced motion. That proxy
broke the moment the page grew a section that is not a beat: a legitimate, fully-collapsed
action index read as a failure, and the message blamed the beats. It now measures the thing it
actually cares about — that no single section is still taller than 1.4 screens — and names the
offender. Reports **15.0 screens for 15 sections, no track over 1.4**.

## Gates

`regress.sh`, now seven gates: **LOCKED · every gate green.**

- 206 byte ranges · 14/14 source rules
- every beat's playhead tracks and returns on the way up, both viewports
- contrast floors clear at every stop
- nothing clipped 320→1920 across 12 widths
- 31 runs of type on a printed ground clear their floor
- 60 fps median, **0 frames over 33 ms** at both viewports
- 53.2 MB total after a full scroll

## Still needs a creative decision

1. **The HUD stays up over the sheet.** The film's mark sits top-left while the sheet carries
   its own badge — two Wodapalooza marks on screen at once — and the altimeter reads `FLOOR`
   top-right. `FLOOR` as a closing statement may be deliberate and good. The symmetric
   alternative is to fade the HUD out as the index locks, exactly as it fades in with the
   cockpit: it belongs to the flight, and the flight is over. **Not changed** — it is a
   judgement about whether the readout is furniture or an ending.

2. **"Organizado por Asdeporte" is plain text, not a link.** The brief asks for
   "Instagram/Asdeporte utility links"; the approved prototype has Asdeporte as a span, and
   `EVENT-ACTION-ARCHITECTURE.md` calls it "organizer credit". Left as approved.

3. **`THE INDEX.` / `Choose your way in` are English** on a sheet whose four actions are all
   Spanish. Codex flagged this as prototype copy to tune once it could be judged in context.
   It now can be.

4. **First view is 12.9 MB** (was 6.4 MB before Beat 0). Unchanged by this work and carried
   forward from `audit/opening-angel/`; the opening beat cannot be lazy-loaded.

## Provenance

Every destination in the sheet is a verified operator URL. Pre-Registro remains unlinked because
the Microsoft Forms URL was supplied only in truncated form, and a guessed href at the film's
climax would be a broken conversion action. Re-check all four immediately before launch.
