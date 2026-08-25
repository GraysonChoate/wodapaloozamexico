# Civic flag — continuous-overlap rebuild

Rebuilt to `reference/CIVIC-FLAG-REBUILD-BRIEF.md` after `fa7cdce` was rejected. **Visual proof
only — no full regression, per the brief.** Beat 0 → 1 untouched; that lane is Codex's.

## What was wrong and what replaced it

The rejected build was a small poster on a pale page, a black void, then Beat 8. It passed a seam
metric and was a slideshow. **Every part of that mechanism is gone**: no `.bfblack`, no
`--fblack`, no flag-alone-on-black state. Zero legacy tokens remain. Black is never used here to
hide a handover.

The rebuild is **one continuous crop**:

- Beat 7 closes into a vertical registration strip at `inset(0 41% 0 41%)`. This beat's window
  **opens from exactly that geometry**, so the strip the street left behind is the flagpole axis.
- The window is a full-height vertical band that widens **asymmetrically** — the right edge leads
  the left by four per cent of the beat, because the flag flies right off the mast, so the city
  opens the way the picture already points.
- The print field is the **edge system**. Two bands sit hard against the window on both sides and
  are squeezed outward as it opens, so the city is literally parting the printed material. Their
  widths derive from the same two variables that drive the window, so field, window and strip are
  one composition.
- **Beat 8 arrives inside the window before the flag is gone** — the real Spanish paper message
  replaces the photograph in the same plane, then Beat 8's own stage takes the frame from
  underneath.

`#bf` is **200svh**, down from 300.

## Measured

| state | window | ink | message | video |
|---|---:|---:|---:|---:|
| strip | **18.0vw** | 1.00 | — | 0.17 |
| opening | 27.9vw | 1.00 | — | 0.69 |
| held | **52.0vw** desktop / **74.0vw** mobile | 1.00 | — | 1.40 → 2.18 |
| message | 52.0 / 74.0vw | 1.00 | **in** | 2.70 |
| handoff | 52.0 / 74.0vw | 0.63 | in | 3.12 |

Held sizes sit inside the brief's 45–60vw desktop and 68–78vw mobile. Seam p99: 0.5909 and
0.5210 desktop, 0.6296 and 0.5098 mobile — but the metric is not the argument this time; the
recordings are.

## A second correction inside the rebuild

The first attempt at this rebuild sized the plate to the whole stage and clipped it. A 3:4
photograph covering a 16:10 viewport is cropped to a 47% band, and that band landed on
**blown-out sky** — the flag and the people were both outside it. The media box is now the size
of the *held window* and sits centred, so the crop is only ever an uncovering and the photograph
never rescales between the strip and the held state.

## Deliverables

`flag2-1440-fwd.mp4`, `flag2-1440-rev.mp4`, `flag2-375-fwd.mp4`, `flag2-375-rev.mp4` — normal
speed across Beat 7 → flag → Beat 8. `states.jpg` — the six states.

## Acceptance

Read left to right in `states.jpg`: a narrow vertical crop on the marker, the city opening
asymmetrically around it, the flag at civic scale with the trike and pedestrians crossing, then
the real handwritten message taking the same window. No card, no void, no newspaper cut.

Full regression deliberately not run. Awaiting composition approval.
