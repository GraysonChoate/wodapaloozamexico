# Beat 7 → Beat 8 — the street splits and the message is behind it

The civic-flag scene is **removed entirely** — section, CSS, timeline, media references. Zero
tokens remain. Beat 0 → 1 untouched; that lane is Codex's.

## What was wrong with the old join

Beat 7 collapsed into a thin centred strip and a textured frame arrived on top of it. That
made the stickers look bad on the way out and produced empty space on the way in.

## What it does now

Reference 1's split is the model: the frame divides into panels and a real object in the
footage is the seam. Here **Beat 7's pole and Beat 8's tower are both centred verticals**, so
the object that divides the frame exists in both shots.

1. **The badge comes forward** — Beat 7's plate advances from scale 1.08 to 1.17 across its
   last 14%, so the sticker moves toward the reader instead of shrinking away.
2. **The street splits down the pole** — a band is masked out of the middle of Beat 7's plate
   and widens to a full 50vw half-gap. The two halves are made by masking, not by duplicating
   the video: one decode, one element, and the gap is a real hole.
3. **The message is already behind it** — Beat 8's first sheet, `RECUERDA`, is held in a plate
   behind the street and is uncovered by the gap. It is presented `contain`, exactly as Beat 8
   presents it, so what the gap reveals is the frame Beat 8 will keep rather than a blow-up.
4. **He swaps the sheet** — Beat 8's own stage takes over and the first swap happens:
   `RECUERDA` falls away, `EL ONLINE QUALIFIER` behind it.

At no point is the frame empty: street, gap-with-message, street.

## Two bugs found and fixed during the build

**The decoy plate stole the beat's scrub.** I placed the message plate first in the DOM. The
loader takes `b.querySelector('.plate video')` in document order, so the newspaper became Beat
7's scrub target — the stickers clip never got a `src` and the newspaper played across the whole
of Beat 7. Stacking is z-index's job, not the DOM's; the beat's own plate now comes first.

**An aperture that clipped nothing.** I gave Beat 8 a `clip-path` inset of 26% to "open on the
sheet swap". Beat 8's plate is `object-fit: contain`, so its paper is only 506px of a 1440
viewport — a 26% inset clips black, not picture. It was a no-op that added nothing and it has
been removed rather than tuned.

## Measured, both viewports

| state | gap | forward | Beat 7 stage | Beat 8 stage |
|---|---:|---:|---:|---:|
| street | 0 | 0.00 | 1.00 | 0 |
| forward | 14.8vw | 0.51 | 1.00 | 0 |
| split | 49.2vw | 0.99 | 1.00 | 0 |
| parted | 50vw | 1.00 | 0.81 | 0.44 |
| open | 50vw | 1.00 | 0 | 1.00 |

Identical at 1440×900 and 375×812.

## Deliverables

`split-1440-fwd.mp4`, `split-1440-rev.mp4`, `split-375-fwd.mp4`, `split-375-rev.mp4` — normal
speed across the join. `states.jpg`, `states-375.jpg` — six states.

Visual proof only; no full regression until the composition is accepted.
