# Beat 12 — architectural plate as reveal

Prototype 3. **Beat 12 only.** The existing empty → full hard replacement is unchanged.

## The sequence

1. **a photograph being considered** — the empty Zócalo opens contained on neutral black,
   carrying a hairline of its own
2. **one slow widen** — a single controlled move, no tilt, no 3D, no easing theatre
3. **locked empty at p 0.34** — exact, hairline gone, well before the step
4. **held empty** to p 0.56
5. **hard replacement** — the full square, identical box, a step
6. **the date arrives at p 0.62**, after the replacement, never competing with it

## Both plates occupy one box, measured

    empty plate at lock : [0, 45, 1440, 810]
    full plate at swap  : [0, 45, 1440, 810]
    identical           : true

## Why the plates were re-boxed

Both clips are 1280×720, so each plate is now sized to the source's own 16:9 rather than
letterboxed inside a viewport-shaped box. One specific reason: **the frame edge then sits
exactly on the picture**, so the hairline during the widen is the photograph's boundary rather
than a rectangle drawn some distance away from it. Bordering the old contain box would have
drawn a line 45px above and below the image on desktop — visibly not the photograph's edge.

At scale 1 the geometry is identical to the contain framing this beat already had, at every
viewport, which the measurement above confirms.

The starting size is **0.60 on desktop, 0.78 on a phone**. Same object, but 0.60 of a 375px
frame is a thumbnail, and the brief asks for an object.

## What the full plate does

Nothing. It never scales, never fades, is never animated, and carries no border. It arrives.

The whole argument of the beat is that the same city reads two ways; a crowd that grew in
would be a different and much weaker claim.

## Constraints held

`object-fit` preserved so the full bright source frame and its watermark stay whole — the
watermark is complete and unclipped in all eight states. Hairline is a 1px neutral `outline`:
no radius, no gradient, no shadow, no card. No synthetic texture, no colour treatment — the
dusk-to-night replacement is already the colour event. Reduced motion and no-JS fall back to
empty plate, full plate, date.

## Verification

Six gates green, 60fps with one frame over 33ms out of 720 on desktop and zero on mobile.

    CONTACT-desktop-1440x900.jpg  /  CONTACT-mobile-375x812.jpg
    scroll-forward.webm  /  scroll-reverse.webm  /  scroll-fast.webm

`01-photograph-considered` against `04-locked-empty` is the widen. `05` against `06` is the step.
