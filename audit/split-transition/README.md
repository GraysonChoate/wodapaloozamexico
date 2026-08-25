# Beat 7 → Beat 8 — the badge comes straight at the reader

## The badge, finally

Twice I built this with `perspective()` plus `translateZ` while also animating `left`/`top`, and
twice it drifted off to the side. The reason: **a perspective push magnifies about the element's
own transform-origin**, so moving the element and projecting it at the same time are two
transforms fighting over the same axis. Nudging `left` toward centre did not cancel that; it
added to it.

A flat badge gains nothing from a real Z push that a scale cannot give it. So it is now a plain
`scale()` about a box pinned to the exact centre of the viewport, with the only other movement
being the small registration offset that puts it on the sticker at rest — and that offset runs
to zero as the push begins.

Measured, 1440×900 (viewport centre is 720,450):

| push | badge centre | width | opacity |
|---:|---|---:|---:|
| 0 | 691,432 | 490 | 0 |
| 0.04 | 696,435 | 625 | 1 |
| 0.13 | 707,442 | 950 | 1 |
| **0.31** | **720,450** | 1569 | 1 |
| 0.60 | **720,450** | 2557 | 1 |
| 0.82 | **720,450** | 3292 | 0.70 |
| 0.94 | **720,450** | 3706 | 0.24 |
| 1.00 | **720,450** | 3916 | 0 |

It leaves the sticker, locks to the centre line by a third of the way through, and stays there
for the whole rest of the travel — eight times its size, covering the screen, then dissipating.
It cannot go anywhere but at the reader.

## Everything else, unchanged

No vertical travel. `.b7strip` clears at the split. The street opens flat, two halves outward.
Beat 8 pins behind so no second frame arrives. The frame grows 1 → 1.30 across the sheets. Four
words, set as written: `EL ONLINE / QUALIFIER`, `ES DEL / 18 AL 26 / DE AGOSTO`.

## Deliverables

`seq-{1440,375}-{fwd,rev}.mp4` — full pass at normal speed. `badge-push.jpg` — eight frames
across the push. Visual proof only; no full regression until the composition is accepted.
