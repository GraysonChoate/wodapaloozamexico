# The opening — Beat 0, the city as a printed object

Live in `build/index.html`. The film no longer opens inside the aircraft. It opens above the
city, and the first thing that happens is that the city stops being a place and becomes a thing
you can hold. **City observed, then entered.**

Built to Codex's audit of `audit/proof-angel-collapse/`: keep the contraction and the held print
composition exactly as approved, replace the repeated Ángel expansion with a handoff into the
existing cockpit descent, and compress to 320–360svh.

## What changed from the approved prototype

| | proof | live |
|---|---|---|
| Height | 520svh | **340svh** |
| Arrival at full bleed | 10% of travel | **18%** |
| Contraction | 0.06→0.30 | 0.18→0.40 |
| Hold | 0.32→0.70 | 0.40→0.78 |
| Ending | released back to full-bleed Ángel | **paper steps to black, plate remains, cut to cockpit** |
| Encode | 1280×586 @24fps, 6.7 MB | **1600×734 @12fps, 6.6 MB** |

The contraction, the plate geometry, the caption and the print field are untouched.

## The handoff

The paper leaves as a **step**, not a fade — three per cent of the beat, which at reading pace is
a cut. What survives it is the lit plate alone in black.

That is already the shot Beat 1 opens on: **a wide bright band inside a dark frame.** The
cockpit windshield is the same shape in the same place. The printed city becomes the windshield.
Beat 1 itself is completely untouched — the match is made by arriving at its composition, not by
modifying it.

## Two things the descent needed

**The altimeter no longer lies.** It used to map from scroll 0, so inserting a beat ahead of the
cockpit would have had it counting metres down over a printed page. It now runs from Beat 1's
top to `data-ground`. Measured: **2,240 held flat across the whole of Beat 0**, then 2,228 →
2,130 as the cockpit takes over.

**The HUD belongs to the flight.** The mark and the altimeter are absent over the paper and
arrive with the aircraft — `--hud` measured 0.00 through every stop of Beat 0, then 0.92 → 1.00
across the handoff.

## Encode: the opening was the softest asset in the film

The proof encoded at 1280×586. At full bleed on a 1440×900 desktop, `cover` fills 900 tall,
which is a **1.54× upscale** — and the first image of the entire film was visibly mushy in the
statue's face, the drapery and the trees. Every other beat is 1280×720 and upscales only 1.25×,
so Beat 0 was well below the film's own floor.

Fixed by encoding taller and paying for it in temporal sampling. At 340svh the travel is 2,160px,
so 208 frames is one new frame every **10.4px of scroll** — far finer than perception at any real
scroll speed, and the previous 24fps was simply oversampled.

`1600×734 @12fps` → **1.23× upscale, 6.6 MB** — sharper than before and 0.1 MB lighter.
`crop-ba.png` is the same rendered crop before and after.

## A dead end, recorded so it is not retried

`preload="metadata"` on Beat 0 to reduce first-view weight **made everything worse**: first view
went 12.9 → 18.7 MB and total traffic 53.2 → 135.3 MB, because the seek pump then re-fetches
ranges continuously instead of holding the file. Reverted to `auto`.

## A tool that was lying

`perf.sh` hardcoded `#b1` for its "first decoded frame" metric. The moment a beat was inserted
ahead of it, it measured an offscreen beat and reported **NEVER** for a page whose opening frame
was decoding in 42 ms. It now asks the DOM for the first beat. A gate that names a beat stops
being a gate.

## Gates — full regression, `regress.sh`

| Gate | Result |
|---|---|
| Byte ranges | 206 |
| Source rules | 14/14 ok |
| Scrub, desktop + mobile | every beat tracks, **b0 17.24s across the beat**; every playhead returns on the way up |
| Contrast | every element clears its floor at every stop, both viewports |
| Overflow 320→1920 | nothing clipped at any of 12 widths |
| Perf desktop | 60 fps median, worst 19.9 ms, **0 frames over 33 ms** |
| Perf mobile | 60 fps median, worst 21.6 ms, **0 frames over 33 ms** |
| First decoded frame | 42 ms desktop / 0 ms mobile |
| Total after full scroll | 53.1 MB (unchanged from before Beat 0) |

**LOCKED · every gate green.**

## Open, and deliberately not decided here

**First-view weight went 6.4 MB → 12.8 MB.** This is inherent: the opening beat is the one beat
that cannot be lazy-loaded, so it always pays its full weight up front, and it is a 6.6 MB clip.
The encode is already at the film's quality floor and lighter than the version Codex approved.
Reducing it further means either a shorter footage range — which would change approved material —
or a softer opening image. Flagged rather than silently chosen.

**The pull-back now scrubs 1.75× faster than the approved prototype.** 17.3s of footage over
240svh of travel instead of 420svh. That is a direct consequence of the requested compression and
the footage range was left intact rather than trimmed to compensate; if the reveal now reads as
hurried, trimming the clip is the lever.

## Provenance

Recording 1 is a screen capture of a YouTube video titled "Mexico City", approved as working
material by `8def022`. Not client footage, not cleared production media. Original source and
web-use permission still required before this ships anywhere public.
