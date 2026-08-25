# First proof — full bleed → framed print object → hold → release

`build/proof-angel.html` · isolated prototype · **`build/index.html` is untouched**

This is the one move in the reference language the film has never made. Everything framed we
have built so far expands — a contained thing becomes the world. Nothing has ever collapsed.

Built to `reference/FRAMED-FOOTAGE-LEDGER.md` → *First proof — build next*.

## Source

| | |
|---|---|
| Clip | `Other B-Roll/Screen Recording 2026-08-25 at 12.33.00 AM.mov` |
| Window | **10.0–27.3s** (17.29s) |
| Content rect | `crop=3420:1568:0:154` — measured with `cropdetect`, no player chrome in 18 sampled frames |
| Encode | 1280×586, 24fps, all-keyframe (`-g 1 -keyint_min 1 -sc_threshold 0`), crf 27 → 9.2 MB |
| Derivative | `build/media/scrub/px_angel_pullback.mp4`, poster `build/media/poster/px_angel_pullback.jpg` |
| Ground | `print-field-01.png` → `build/media/print/print-field-01.jpg` (1536px, 554 KB) |

**The ledger names 9.4s. The clean pull-back does not start until ~9.8s** — 9.4 is still inside
the whip transition out of the overhead orbit, and the first build opened full bleed on a
smeared gold blur. Started at 10.0s instead. This is the only deviation from the ledger and it
is a correction, not a preference.

## The mechanic

The print field is **not faded in**. It is present from the first frame, behind and outside the
image, and at full bleed the plate simply covers it. The contraction *uncovers* it — the way
making a photograph smaller uncovers the page it is printed on. Nothing about the paper animates
its own opacity. That is the ledger's requirement and it is implemented literally.

The second effect is the one worth keeping: the source is **2.184:1** and the viewport is not.
At full bleed `object-fit:cover` crops the sides away. As the plate contracts to the source
aspect, cover becomes contain and those sides come back. **The picture does not only get
smaller — it gets more complete.** The recession down Reforma is at its widest at the moment the
image is at its smallest, which is the whole argument for framing it.

## Timeline — measured, desktop 1440×900

| scroll | `--c` | plate | video t |
|---:|---:|---|---:|
| 0.00 | 0.000 | 1440×900 | 0.04 |
| 0.16 | 0.616 | 1085×592 | 2.79 |
| 0.32 | 1.000 | 864×396 | 5.55 |
| 0.45 | 1.000 | 864×396 | 7.78 |
| 0.58 | 1.000 | 864×396 | 10.02 |
| 0.74 | 0.548 | 1124×627 | 12.77 |
| 0.92 | 0.000 | 1440×900 | 15.87 |

Contract 0.10→0.32, hold to 0.70, release 0.70→0.92. The caption lives strictly inside the hold
(in 0.28→0.38, out 0.62→0.70) so it is never settling while the frame is still settling.

`--c` is one value built from two opposing ramps rather than a three-stop keyframe list, so the
hold is simply the stretch where the first has finished and the second has not begun. It cannot
drift out of sync with itself.

## Two bugs found by measuring, not by looking

**1. Type ran off the left edge.** The first version put the copy in the left and right margins.
It *looked* fine in a contact sheet. Probing the real geometry showed `sideL` starting at
**−91px** — two words were simply not on screen, because `22ch` was deciding the width and only
225px of margin existed. `max-width` is now bound to the same expression that positions it:
`calc(50vw - var(--pw)/2 - 2.4vw - 26px)`.

**2. The margins are where this paper is loudest.** `print-field-01`'s quiet zone is its centre,
and the centre is exactly what the plate occupies. "El Ángel" landed on the cyan brush and the
metadata landed on black ink — both measured as decoration rather than as words. The copy moved
to a **caption beneath the plate, aligned to its own left edge**, which is both legible and the
correct editorial object: a plate on a page is captioned under itself. It carries the film's
local-ground treatment inverted — same five-stop falloff, paper-coloured instead of dark.

## Gates

| Gate | Result |
|---|---|
| Byte ranges on the new clip | **206** |
| Contrast | **15.50:1** capmeta / **15.68:1** capname desktop; **15.71:1** both mobile |
| Overflow, 320→1920, 12 widths | **nothing clipped at any width** |
| Perf desktop | median 16.7 ms (60 fps), worst 19.2 ms, **0 frames over 33 ms** |
| Perf mobile | median 16.7 ms (60 fps), worst 19.1 ms, **0 frames over 33 ms** |
| Console | clean (one `favicon.ico` 404 only) |
| Reverse + fast fling | **identical state at all 7 stops** — `--c`, plate width and video time all match |
| No JS | resolves to the held state: `--c:1`, poster visible, caption readable |
| Reduced motion | beat collapses to natural height (743px), plate 1120×513, no sideways scroll |

## Open questions for review

1. **Is the paper too loud at the hold?** The plate reads as placed on a poster. The alternative
   grounds now exist — `action-paper-01.png` is deliberately quiet — but the ledger specifies the
   print field for a contained frame, so this was built to spec rather than to taste.
2. **The release currently returns to the same full bleed it came from.** In the film it would
   hand to the next beat; standalone it simply restates. If the collapse is meant to *change*
   what follows, the release is where that gets decided.
3. **Scroll cost.** 520svh for one framed moment. Whether that earns its distance is a
   whole-film question, not a prototype question.

## Provenance

Recording 1 is a screen capture of a YouTube video titled "Mexico City". Approved as working
material for this phase by `8def022`. It is not client footage and not cleared production media;
if this treatment is adopted, the original source and web-use permission are still required.
