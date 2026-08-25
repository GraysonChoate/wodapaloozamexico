# Beat 2 — aperture parallax

Prototype 4. **Beat 2 only.** The word, the source window, and the desktop/mobile fit are
untouched.

## Measured against the stated baseline

The baseline was reproduced on the unmodified build first, so the comparison is valid:

| Metric | Stated baseline | Reproduced | **After** |
|---|---|---|---|
| Median luminance, start → end | 75 → 89 | 75 → 88 | **77 → 89** |
| Median floor | — | 70 | **73** |
| Highlights p95, start → end | 184 → 239 | 184 → 239 | **185 → 245** |
| p95 floor | — | 181 | **185** |
| Motion, last third | 31.9 | 33.2 | **33.9** |
| Motion, whole | — | 21.9 | **22.8** |

**Every value is equal or better.** Nothing was traded for the effect.

Method: 28 frames across the wide half of the beat (p 0.50 → 1.00) at 1440×900, sampling only
pixels above luminance 12 in the core band — the footage visible *inside* the glyphs, since
everything else is pure black.

## What the move is

The word is the aperture. It widens on the `wdth` axis; the city behind it travels and grows
**faster** than that outer geometry, so widening reads as *exposure* rather than as more room
for a video that was playing anyway.

    was   scale(1.06 + p·0.12)
    now   translate(p·1.1%, p·0.8%) scale(1.05 + p·0.155)

The rate is what creates the differential — 0.155 against 0.12 is about 29% faster — plus a
small diagonal drift. Everything is a source crop. No tilt, no rotation, no frame around the
word, no wash, and the black field never moves: the aperture is the word itself, not a panel
floating over a background.

**The drift is bounded by the crop.** Overflow per side is `(0.05 + 0.155p)/2`, so at p = 1
there is 10.3% of margin against a 1.1% travel. The frame edge can never enter the letters.

## One thing that had to be corrected

The first attempt drifted the other way — `translate(-1.4%, -1.0%) scale(1.04 + p·0.20)` — and
it **failed the brief's own test**: motion rose to 36.8, but median end fell 88 → 84 and p95
end fell 239 → 237. The heavier crop and the drift direction together were pushing the sampled
window into darker material.

Reversing the drift tracks toward the brighter part of the frame instead of away from it, and
easing the scale rate back kept the crop close to the approved framing. That is the version
here, and it improves every number rather than trading one for another.

## By design, invisible in a still

The three states show the width axis, which is the signature and is unchanged. The interior
travel is deliberately below the threshold of a screenshot — the brief asks for it to be felt
in motion, not seen when paused. The evidence is the table above and the recordings.

`IT WILL HAPPEN` is quiet and fixed, as before.

## Verification

Six gates green, 60fps with **zero** frames over 33ms at both viewports.

    CONTACT-desktop-1440x900.jpg  /  CONTACT-mobile-375x812.jpg   narrow · widening · widest
    scroll-forward.webm  /  scroll-reverse.webm  /  scroll-fast.webm
