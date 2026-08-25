# Beat 7 → Beat 8 — the badge comes through, the street opens, every word arrives

## Four notes, four changes

**1. No vertical travel.** Two bugs, both mine, both about the same thing.

The halves were `position:absolute` inside a sticky stage that is *releasing* while the split
runs, so they rode upward with it. I counter-translated them downward — which looked right on
paper and was wrong in the frame, because `.stage` carries `overflow:clip`: pushing them back
down moved them out of its box and they were cut off from the bottom, which reads as the street
climbing into the top corners.

They are now `position:fixed`, anchored to the viewport, so the stage slides underneath without
touching them. That still didn't work at first, because I had put `perspective` on `#b7 .stage`
for the badge — and **perspective makes an element a containing block for fixed descendants**,
which quietly re-anchored the halves to the sliding stage. The perspective now lives on the
badge's own transform. The gesture is purely horizontal.

**2. The badge comes off the pole and past the camera.** It is the official mark asset, already
transparent, registered exactly on top of the sticker it duplicates — so at rest it is invisible
and the only thing that happens is that it leaves. `perspective(1200px)` with a 1050px push is an
eight-fold blow-up, so it genuinely passes the reader. It clears before the book has finished
opening, so the two overlap rather than queue.

**3. The frame keeps growing.** Beat 8's `--grow` was 1 → 1.13; it is now 1 → **1.30**, rising
the whole way. Measured 1.000 at the first sheet, 1.033 at `COMIENZA`, 1.182 by the fourth.

**4. The words come all the way through.** They were fading at 70% of their window and scaling
only 1.16 — a polite drift, not a push. Perspective is 1050 and the push now reaches **880**,
which is a six-fold magnification: the outline arrives at the reader and passes them. Opacity
holds until the last tenth, by which point the word is already larger than the frame.

## Unchanged

Beat 8 still pins behind Beat 7 so no second frame arrives. Beat 7 still does not dissolve while
it splits. Four sheets, four words, windows mapped through Beat 8's warp. The printed field still
meets the paper.

## Deliverables

`push-{1440,375}-{fwd,rev}.mp4` — badge, book and all four sheets at normal speed.
`opening-states.jpg` — twelve frames across the opening. Visual proof only; no full regression
until the composition is accepted.
