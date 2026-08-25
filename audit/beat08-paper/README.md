# Beat 8 — paper as an object

Prototype 2. **Beat 8 only**, and within Beat 8 only the **first two releases**. Everything
from `COMIENZA` onward — and the long held date above all — is byte-for-byte what it was.

## The roll is measured, not chosen

The paper's own top edge was tracked across the clip:

    RECUERDA              +0.65°  +2.58°  +1.02°  +0.36°  +1.73°  -0.30°
    EL ONLINE QUALIFIER   -1.33°  +0.20°  -0.15°  +0.29°  +0.69°  +0.00°

**2.58° is the entire range**, and card two settles to **0.00°** once it is held. A real sheet
held up in the street barely tilts, and it locks flat by itself.

So the treatment does what the paper does: a small settle that resolves to a true flat lock.
Anything larger would be inventing physics this footage does not contain.

## What was built, and one thing that was corrected

The plate arrives **contained** — slightly inset — with a small settle, then grows to its exact
size and exactly zero rotation.

The first attempt used the full measured 2.4°. It was wrong, and not because it exceeded the
source: **rolling the plate rolls the whole photograph** — the buildings, the street, the
person — and against the black letterbox edges even a couple of degrees reads as a tilted
picture rather than as a sheet of paper. The roll is now 1.1°, felt in motion rather than seen
in a still, and **containment does the work**: the sheet is presented small and arrives at its
exact place.

## The rest of the beat is provably untouched

Sampled at p 0.25, 0.45, 0.70, 0.90 and 1.00, the plate reports one value:

    matrix(1, 0, 0, 1, 0, 0)

No tilt, no scale, no parallax on the held date. It remains the stillest thing in the film.

## What was not done

No synthetic paper grain. No card stack. No English overlay on the Spanish sheets. No palette
wash on the newsprint. No cropped message. No fake tear.

**No added shadow.** The clip already casts a real one onto the body and the street; a second,
invented one would be imitating photographed light, which the brief rules out and which the
source makes unnecessary.

## Verification

Six gates green, 60fps with **zero** frames over 33ms at both viewports.

    CONTACT-desktop-1440x900.jpg   eight states
    CONTACT-mobile-375x812.jpg     the same eight
    scroll-forward.webm  /  scroll-reverse.webm  /  scroll-fast.webm

Compare `01-recuerda-arriving` against `03-recuerda-locked`, and `05-qualifier-arriving`
against `06-qualifier-locked`. `08-the-held-date` is the untreated control.
