# Beat 7 → Beat 8 — the street splits over a scene that is already there

## The second transition, and why it existed

The previous version was continuous in its *clip* — the transition ended at 1.95s and Beat 8
began at 1.97s — but it still showed a second transition, because the **stage** changed. Beat 7's
sticky stage released and slid up while Beat 8's slid in from below. In the screen recording that
is the whole composition rising off the top and a fresh one coming up from the bottom, three
seconds in, after the cut had already happened.

The film already knew this. Beat 9's own note says: *a match cut on a section boundary arrives as
a wipe, because a sticky stage releases and slides.* Beat 9 solved it by keeping its cut inside
the beat. This join was doing the opposite.

## The fix — architectural, not cosmetic

**Beat 8 now starts one viewport early and pins behind Beat 7** (`margin-top:-100svh`, Beat 7's
stage above it). Beat 8 is stationary and already running when the split begins, so there is
nothing to hand over and nothing to arrive:

- **No stand-in plate.** What the gap uncovers is Beat 8 itself. The duplicate newspaper plate,
  its second playhead and the `data-scrub-from` in-point are all deleted — they existed only to
  fake a scene that is now genuinely there.
- **The split runs on Beat 7's exit, not its `--p`**, because `--p` is pinned at 1 through the
  overlap and the overlap is exactly where Beat 8 is waiting.
- **A splitting beat no longer dissolves as well.** `data-split-exit` holds Beat 7 fully opaque
  while the mask removes it, so the street cuts cleanly through instead of ghosting over the
  newspaper. It is gone entirely by 0.72 of the overlap, so the stage slide that follows has
  nothing left to show.

The badge still comes forward, `RECUERDA` still comes off the paper as outlined type on the
peel, and the printed field still meets the paper so the sides are never black.

## Measured across the overlap, 1440×900

| state | gap | Beat 7 stage | Beat 8 stage | Beat 8 clip |
|---|---:|---:|---:|---:|
| street | 0 | 1.00 | **1.00** | 0.04 |
| fold | 0.5vw | 1.00 | 1.00 | 0.34 |
| peel | 4.4vw | 1.00 | 1.00 | 0.67 |
| drop | 12.6vw | 1.00 | 1.00 | 0.94 |
| handover | 30.9vw | 1.00 | 1.00 | 1.26 |
| continues | 50vw | 1.00 | 1.00 | 2.45 |

Beat 8's stage is at full opacity from the first sample — it never arrives, it was already there.
Beat 7 never fades. One clip runs, uninterrupted, from 0.04 onward.

## Deliverables

`split-{1440,375}-{fwd,rev}.mp4`, `states.jpg`. Visual proof only; no full regression until the
composition is accepted.
