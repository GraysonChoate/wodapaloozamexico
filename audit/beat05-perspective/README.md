# Beat 5 — identity grid in perspective

Prototype 1 of the enhancement order. **Beat 5 only.** No other beat was touched.

Narrative job, unchanged: *one anonymous figure → many city claims → one competing body.*

## What changed

The nine panels were already a 3×3 grid scaled about its own centre. They were coplanar tiles
with a 2D drift. They are now **planes in space**.

- `perspective` lives on the sheet, so the nine cells share **one camera** rather than each
  faking its own.
- The 3D transform is on the **cell**, not on the media inside it. A plane in perspective has
  to carry its whole frame, edges included; on the media it reads as a picture sliding inside
  a fixed box.
- Each panel carries an authored Z, pitch and yaw — never random, so the sheet registers
  identically on every frame and every reload.
- **The centre panel never moves.** The dive goes through it, so it sits exactly where it will
  end up from the very first frame.
- Depth is deliberately shallow, and scaled down on a phone (`perspective: 760px`), because a
  phone shows the same nine at a third the size and the same Z reads as a far bigger throw.
  Deep Z makes near panels swell over their neighbours and it becomes a template carousel.

## The lock is exact, and that is measured

Registration now finishes at **p 0.62**; the dive does not begin until **0.74**. That twelve
percent is the lock — the grid is exact and completely still before it moves.

Previously registration ran to 0.72 against a dive at 0.74, so the sheet was still settling as
it began to move and never read as one precise object.

Measured at p 0.68, all nine cells:

    distinct cell transforms : 1
    value                    : 0.00px  0.0px  0.00deg  0.00deg
    computed matrix          : matrix(1, 0, 0, 1, 0, 0)

A true identity — no residual sub-pixel offset, nothing left to wobble.

The easing into the lock is `1 - (1-t)^5`. A symmetric ease drifts into place and the grid
never feels like it *arrives*; this one lands.

## Preserved

- The uneven real panel motion: eight clips looping at 0.78×–1.18×, so the nine breathe out of
  sync. Untouched.
- The existing athlete match cut at p 0.88 — a step, not a ramp.
- Reverse and fast scroll: everything is position-derived, so it plays backwards identically.
- Reduced motion: perspective off, transforms off, the plain grid remains.
- No Three.js. CSS 3D only.

## Verification

All six gates green, including 60fps with **1 frame over 33ms out of 720** on desktop and
**zero** on mobile, and nothing clipped from 320px to 1920px.

## What to look at

    CONTACT-desktop-1440x900.jpg   eight states
    CONTACT-mobile-375x812.jpg     the same eight
    scroll-forward.webm            normal pace, down
    scroll-reverse.webm            normal pace, up
    scroll-fast.webm               a fling

`03-planes-arriving` is where the perspective is visible. `05-locked-grid` is the exact state.
