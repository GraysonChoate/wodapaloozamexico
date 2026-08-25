# Civic flag — the city has public scale

Sprint step 2, built to `PROJECT-NERVOUS-SYSTEM.md` and the superprompt. **Beat 0 → 1 was not
touched** — that join is Codex's lane while the diagonal lab runs.

*A mark is placed in the city (Beat 7) → the city has public scale (here) → the message arrives
(Beat 8).*

## Source

`Other B-Roll/Screen Recording 2026-08-25 at 12.36.43 AM.mov`, window **2.6–5.9s**.
Cropped `1470×1960 @ 929,64` — a portrait slice with the mast as its axis. That crop removes the
macOS window chrome and the pillarboxing; **no player chrome enters the build.** Encoded
720×960, 15fps, all-keyframe, crf 27 → **773 KB**. Ungraded: no tint, no relight, no slogan.

## The move

Beat 7 now **closes back into the same vertical registration strip that opened it**, so the
device brackets the whole street occupation — and the strip it closes to is the vertical the flag
plate arrives out of. The pole becomes the plate's axis, so object and frame agree.

The plate arrives **off-axis** — low and right, rotated 2.2°, at 0.90 scale — and locks flat with
the fifth-power settle Beat 5 was approved with, so most of the travel is spent almost home and
the landing reads as *placed* rather than scaled up. It then holds flat and still from 0.34 to
0.72 while people and a vendor trike cross beneath the flag. The field steps out at 0.74–0.80,
leaving the plate alone on black — the same punctuation Beat 0 uses before the cockpit — and the
plate recedes slightly as Beat 8's paper message rises.

| state | `--flock` | `--fblack` | plate | video |
|---|---:|---:|---|---:|
| arrive | 0.537 | 0 | 293×387 | 0.36 |
| lock | 1.000 | 0 | 300×400 | 1.01 |
| hold | 1.000 | 0 | 300×400 | 1.50 → 2.15 |
| black | 1.000 | 0.833 | 300×400 | 2.60 |
| release | 1.000 | 1.000 | 288×384 | 3.09 |

## One correction made during the build

The field was first shown with `object-fit:cover`. `civic-flag-field-01.png` is a **portrait
sheet**, so covering it to a landscape viewport kept only its quiet middle band and the whole
thing read as a blank pale page — the one thing the Nervous System says this material must never
be. It is now **contained**: the sheet is visible as an object, its ink, halftone and
registration crosses all in frame, and the plate is visibly placed *on* something. The plate was
reduced to `min(21vw,300px)` so the sheet reads around it.

## Checks — fast policy, no full regression

| | desktop | mobile |
|---|---:|---:|
| seam Beat 7 → flag, dimmest p99 | **0.5224** | 0.5182 |
| seam flag → Beat 8, dimmest p99 | **0.5157** | 0.4848 |
| median frame interval | 16.7 ms (60fps) | 16.7 ms (60fps) |
| frames over 33 ms | **0** | 2 (0.3%) |
| first decoded frame | 0 ms | 0 ms |

Emptiness floor is 0.05, so **no blank frame at either new seam**. Forward and reverse recordings
at both viewports are included. First view 13.8 → **14.2 MB** (the 773 KB plate and 402 KB field).

Mobile shows 2 frames over 33 ms (worst 57 ms) where desktop shows none. Recorded, not chased —
no reader-facing defect is demonstrated and the policy says not to spend the window on it.

## Changed

`build/index.html` — new `#bf` section between Beat 7 and Beat 8, its CSS block, its timeline,
Beat 7's closing `--reg`, and `data-join-in` added to `#b8`'s section tag so the flag hands over
without a blank gap. **Beat 8's clip, warp, treatment, copy and Spanish legibility are
untouched.** New media: `bf_flag.mp4`, `bf_flag.jpg`, `civic-flag-field-01.jpg`.

Stopping for review.
