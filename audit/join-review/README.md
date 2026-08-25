# Join review — sprint step 1

Both joins in one normal-speed pass, plus the opening quality-bar comparison the brief made
binding. Full gate suite run once, at the end: **LOCKED, every gate green.**

## The opening quality bar

`TRANSITION-PASS-BRIEF.md` requires comparing three named motion forms before the Beat 0 → 1
boundary can be approved, and states a symmetric collapse into a centred box does not pass by
default. All three were built on identical material and timing in a scratch file
(`build/_variants.html`, deleted) and captured at 1440×900:

| form | result |
|---|---|
| **a · diagonal registration** | rejected — mid-wipe it reads as two overlapping pictures rather than one aperture |
| **b · recessed plate** | rejected — the off-centre anchor fights Beat 0's centred print composition |
| **c · windshield lock** | **chosen** |
| current centred collapse | rejected by the bar itself |

`opening-variants-full.jpg` is all four across the join; `opening-variants-compare.jpg` is the
opening stretch enlarged.

**Windshield lock:** the horizontal edges release first (`--oH`, 0.00–0.05), so the aperture
becomes a wide band before it becomes a frame — and that band is the windshield's own geometry.
The vertical edges follow (`--oV`, 0.04–0.14), overlapping slightly so the corners never read as
a stepped rectangle. The cockpit is already sitting in its own shape by the time the full frame
arrives.

## Evidence

- `joins-1440.mp4` — one continuous normal-speed pass from inside Beat 0 to past Beat 7's
  opening. Contains **both** joins. 341 frames at 25fps.
- `joins-375.mp4` — the same range at mobile.
- `joins-sheet.jpg` — that pass sampled: Ángel plate → cockpit in the windshield band → SUCEDERÁ
  → mark → car → identity grid → banner → **vertical registration strip** → pole → Beat 7.

## Blank-frame read

Dimmest 99th-percentile luminance across each join (empty would be < 0.05):

| | 0 → 1 | 6 → 7 |
|---|---:|---:|
| desktop | **0.2703** | **0.3214** |
| mobile | **0.1367** | **0.5404** |

Zero blank frames at either join, either viewport, with the new opening form.

## Gates

`regress.sh` once: LOCKED. No-JS renders all 25 posters; reduced-motion collapses to 15.0 screens
for 15 sections; contrast clear; nothing clipped 320→1920; 31 runs of type on a printed ground
clear; **60fps, 0 frames over 33ms at both viewports**; first view 13.8 MB.

## Changed

`build/index.html` only, +16 / −5: `#b1 .plate` clip-path now takes per-axis progress, and Beat
1's timeline drives `--oH` / `--oV` instead of a single `--open`. Beat 0, Beat 6, Beat 7 and the
6 → 7 registration strip are untouched. Scratch variant file deleted.
