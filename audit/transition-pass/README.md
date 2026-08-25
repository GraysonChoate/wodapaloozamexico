# Transition pass — two proofs

Built to `TRANSITION-PASS-BRIEF.md`. **Only these two boundaries were touched.** No other
boundary, copy, HUD, navigation, action index or texture surface was modified.

## One primitive, twice

Both joins use **an aperture that survives the boundary**. The outgoing beat closes to an
opening, the incoming beat opens from that same opening, and the content inside changes. The
frame is mostly black *by design* at the handover, so the black belongs to the aperture rather
than to a gap between two clips.

`clip-path: inset(...)` throughout — the plate is genuinely cropped, not covered by bars. No new
elements, and the stage's own black shows through the crop.

## Why an aperture alone was not enough

The dip is structural. Two sticky stages tile the viewport; the outgoing one clears over half a
viewport and the incoming one begins exactly where it finishes, so for an instant **both are at
zero opacity and nothing is behind either**. Closing a crop does not help when both layers are
invisible — measured, the frame was still 99.8% black.

The fix is an **overlapping enter**, opt-in via `data-join-in` on the two incoming beats only.
The incoming stage rises across the same half-viewport the outgoing one falls through. Default
behaviour is untouched on the other twelve boundaries, where the dip is a real device.

The incoming ramp is square-rooted. Two layers crossfading over black do not sum: a 0.5 over a
0.5 composites to about 0.75 of the light, and on mobile — where Beat 0's aperture is a sixth of
the frame — that still measured as black. `sqrt` lifts the midpoint to ~0.85.

## 1 · Beat 0 → Beat 1

*The city, considered as a printed object, becomes the view through which the descent begins.*

The cockpit is a **second plate inside Beat 0's own frame**, hard-replaced at `--p 0.90` — the
same device Beat 12 was approved with. Paused at the swap, **both states occupy the same
aperture.** Beat 1 then opens from exactly that plate's box (`min(60vw,1040px)`, `min(88vw,560px)`
mobile) to full bleed over its first 10%.

Beat 0's timeline, print hold and caption are untouched; the swap is appended after its existing
blackout. The cockpit plate is held at `scale(1.04)` — precisely what `#b1 .plate` renders at
`--p: 0` — so Beat 1 has nothing to reconcile. The HUD still arrives with the cockpit, unchanged.

## 2 · Beat 6 → Beat 7

*The public claim is registered into the physical act.*

I inspected the rendered boundary first, as the brief required. **The banner's WODAPALOOZA badge
is still readable at Beat 6's last frame** — the late stairs never take the frame — and Beat 7
opens on the same hooded figure reaching to place that same badge on a pole. The badge is the
constant, and both objects are vertical.

So the aperture closes **horizontally into a vertical strip**, not into a horizontal one. That is
print registration: a vertical printed object narrowing to a strip, the vertical pole appearing
in that same strip, then the edges releasing. Closes over Beat 6's last 12%, releases over Beat
7's first 9%. Beat 6's pan and scale, and Beat 7's warp, montage and marquee, are untouched.

`sheet-j67-1440.jpg` reads left to right without explanation: banner → strip → pole in the strip
→ open.

## Boundary measurement

A generic black frame is one where **nothing is on screen**. Whole-frame darkness does not prove
that — a small aperture holding a dark cockpit interior is 97% dark and is still a picture — so
the test is the 99th-percentile luminance.

| | before | after |
|---|---|---|
| 0 → 1 desktop | **2 empty frames**, dimmest p99 0.0157 | **0**, p99 0.2116 |
| 0 → 1 mobile | **2 empty frames**, p99 0.0235 | **0**, p99 0.1602 |
| 6 → 7 desktop | **1 empty frame**, p99 0.0255 | **0**, p99 0.3096 |
| 6 → 7 mobile | **1 empty frame**, p99 0.0255 | **0**, p99 0.5431 |

The metric is not vacuous: it was run against the pre-change build (`boundary-before.json`) and
caught the original dip at every boundary. At the dimmest point the frame is now 10–30× brighter.

## Gates

`regress.sh` — **LOCKED, every gate green**, exit 0, 92 ok lines.

- every playhead tracks and returns on the way up, both viewports, `b0`/`b1`/`b6`/`b7` included
- **no-JS:** all 25 poster frames render
- **reduced-motion:** collapses to 15.0 screens for 15 sections, no track over 1.4; both
  apertures forced open, cockpit plate hidden
- contrast clear at every stop; nothing clipped 320→1920; 31 runs of type on a printed ground clear
- **performance: 60fps median, 0 frames over 33ms at both viewports**
- first view 12.9 → **13.8 MB** (Beat 0 now also holds the 0.9 MB cockpit clip)

One caveat, stated rather than buried: across five full runs of `regress.sh`, **one reported a
single gate failure without printing which**, and it did not reproduce in four subsequent runs
including three isolated runs of the browser-behaviour gate. Most likely a transient browser
launch. Flagged so it is watched, not dismissed.

## Files and lines changed

`build/index.html` only. **+112 / −3.**

| region | what |
|---|---|
| `+182` (5) | `#b0 .plate.cockpit` — the incoming plate, held at Beat 1's opening scale |
| `+907` (48) | the aperture-join CSS block: `#b1 .plate` clip, `#b6/.#b7 .plate` strip clip |
| `+968` (4) | reduced-motion: both apertures forced open |
| `+1019` (6) | reduced-motion: cockpit plate hidden on the static page |
| `~1034`, `~1119` | `data-join-in` added to the `#b1` and `#b7` section tags |
| `~1499` (21) | the overlapping, square-rooted `enter` — opt-in, two beats |
| `+1555` (19) | `--open` for `#b1`, `--reg` for `#b6` and `#b7` |
| `+1587` (7) | `--ck` hard replacement inside Beat 0 |

Nothing was removed except the three lines replaced by the `enter` block.

## Deliverables

`j01-{1440,375}-{fwd,rev}.mp4`, `j67-{1440,375}-{fwd,rev}.mp4` — eight recordings, 110 frames
each at 25fps. `sheet-j01-*.jpg`, `sheet-j67-*.jpg` — six-state contact sheets.
`boundary-before.json` / `boundary-after.json` — the measurement.

Stopping here for Codex review. No other boundary touched, no new effects started.
