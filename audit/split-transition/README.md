# Beat 7 → Beat 8 — one continuous unfold

The civic flag is gone. Beat 0 → 1 untouched (Codex's lane).

## The error this fixes

The previous version parked a **frozen** first frame in the gap and let Beat 8's separate stage
do the real motion afterwards — a static card, then a cut, then the guy actually moving. Two
events where there should be one.

## What it does now

1. **The badge comes forward** — Beat 7's plate advances rather than shrinking away.
2. **The street splits down the pole**, masked out of the middle so the gap is a real hole.
3. **What is inside the gap is already live and already mid-action.** The message plate scrubs
   **0.90s → 1.95s** of its own clip across the split: `RECUERDA` held, then the sheet folding
   down and dropping away to reveal `EL ONLINE QUALIFIER` behind it. The frame opens because he
   opens it.
4. **Beat 8 continues the same shot** — it now starts at **1.95s** via a new `data-scrub-from`
   in-point. Measured: transition ends at `1.95`, Beat 8 begins at `1.97`. **Nothing rewinds and
   there is no second arrival.**
5. **The word comes forward** — `RECUERDA` in outlined page-owned type, sized by the opening and
   pushed toward the reader on the same scroll that peels the sheet, gone before the next sheet
   is readable. It echoes the handwriting; it does not imitate it.
6. **No empty black.** The printed field sits behind the split as two edge bands whose width is
   derived exactly from Beat 8's contained paper — `(100vw − 100svh × 640/1138) / 2` — so the ink
   meets the paper, and the composition the gap reveals is the composition Beat 8 keeps.

## New machinery

`data-scrub-from` — a clip in-point in seconds. Without it a beat can only ever start a shot at
its first frame, so a transition that plays the opening of the next clip must rewind when that
beat arrives. That rewind was the cut being complained about.

## Measured, 1440×900 and 375×812

| state | gap | message clip t | Beat 8 clip t | word |
|---|---:|---:|---:|---:|
| street | 0 | 0.90 | 1.97 | 0 |
| fold | 25.7vw | 1.50 | 1.97 | 1.00 |
| peel | 47.1vw | 1.73 | 1.97 | 1.00 |
| drop | 50vw | 1.92 | 1.97 | 0.16 |
| handover | 50vw | **1.95** | **1.97** | 0 |

## Deliverables

`unfold-{1440,375}-{fwd,rev}.mp4`, `states.jpg`, `states-375.jpg`. Visual proof only; no full
regression until the composition is accepted.
