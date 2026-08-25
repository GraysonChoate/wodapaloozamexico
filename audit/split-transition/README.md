# Beat 7 → Beat 8 — the street opens like a book, then every sheet gets its word

## Three changes

**1. The street opens instead of vanishing.** Masking a band out of the middle made it
disappear in place. It is now **two halves that travel outward** — `.b7half-l` to the left,
`.b7half-r` to the right, nothing moving vertically. That is the whole gesture.

They are a **still of the beat's last frame**, not a second decode. By the time the split runs,
Beat 7's travel is spent and its video is frozen on exactly that frame, so swapping the live
plate for two stills is invisible and costs nothing.

**2. The frame comes forward as the sheets come off.** Beat 8's plate now carries a `--grow`
that rises across the beat — measured 1.000 at the first sheet, 1.079 by `COMIENZA`, capped at
1.13 because beyond that the contained sheet starts losing its edges. The reader is drawn in
rather than held at a fixed distance.

**3. Every word, not just the first.** Four sheets, four words, one technique repeating:
outlined, forward, gone — then he drops the paper and the next one takes its place.

| word | clip | Beat 8 `--p` |
|---|---:|---|
| `RECUERDA` | 0.30–1.15s | 0.020–0.084 |
| `EL ONLINE QUALIFIER` | 2.10–4.35s | 0.157–0.328 |
| `COMIENZA` | 4.80–7.15s | 0.362–0.541 |
| `ES DEL 18 AL 26 DE AGOSTO` | 7.60–10.80s | 0.575–0.957 |

Windows were located in the clip and mapped back through Beat 8's `0.60,0.71` warp, so each
word rides its own sheet rather than a guessed scroll position. Measured firing one at a time:
`[0.58,0,0,0]` → `[1,0,0,0]` → `[0,0.49,0,0]` → `[0,0,0.04,0]`.

Repeating it is what makes it a device rather than an effect used once.

## Unchanged from the previous fix

Beat 8 still starts a viewport early and pins **behind** Beat 7, so there is no second frame
arriving. Beat 7 still does not dissolve while it splits. The printed field still meets the
paper so the sides are never black.

## Deliverables

`book-{1440,375}-{fwd,rev}.mp4` — the opening plus all four sheets at normal speed.
`states.jpg`. Visual proof only; no full regression until the composition is accepted.
