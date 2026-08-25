# Beat 0 → 1 — Diagonal Shared-Aperture Integration

**Status:** selected Codex motion study; integrate only after the civic-flag milestone is stopped
for review. Do not alter Beat 6 → 7 or any locked beat while doing this.

## One visual sentence

The Ángel city shot becomes a printed, off-axis object. The cockpit replaces it **inside the same
moving quadrilateral**, then that shared aperture resolves to the full cockpit.

This must read as a spatial handoff, not a city picture shrinking while a cockpit appears behind it.

## Use the study as the geometry/timing source

Reference implementation:

`build/angel-cockpit-diagonal-lab.html` at commit `f9e6421`

### State sequence

| Scroll phase | Required visual state |
|---|---|
| Arrival | Ángel is full bleed and dominant; no print surface competing with it. |
| Recession | Campaign-print field is uncovered; Ángel retreats upper-left with shallow perspective, roughly `-5°` roll / `13°` yaw, and an asymmetric four-corner crop. |
| Replacement | Cockpit fades in as Ángel fades out **within that exact same transformed and clipped plane**. The plane remains visibly skewed during the replacement. |
| Release | Only after the city has yielded, the shared cockpit plane returns to a full, flat viewport. |

### Do

- Keep the diagonal/asymmetric movement concise and legible; it is a single transition sentence.
- Use the existing campaign-print field as the surrounding page material.
- Preserve source-native footage colour.
- Keep the existing HUD/altimeter behavior: absent before cockpit, introduced with flight.
- Verify normal-speed desktop/mobile, forward/reverse, and no empty black frame.

### Do not

- Do not use a centred rectangular shrink.
- Do not reveal full-screen cockpit behind a still-visible city plate.
- Do not add decorative spiral motion, extra copy, invented light, or synthetic video grading.
- Do not reintroduce a generic dip-to-black.

## Fast acceptance check

At the replacement midpoint, pause the page: the cockpit must occupy the same skewed crop the
Ángel occupied one moment earlier. If it reads as two independent images layered together, revert
the implementation before requesting review.
