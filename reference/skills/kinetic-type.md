---
name: kinetic-type
description: Put type INSIDE footage — words that are a hole onto the next scene, words that people in the shot walk in front of, and display type sized to a reference rather than guessed. Use when a scroll film or edit needs a word to become a window, text occluded by people or objects in a shot, kinetic type over video, or when matching the typography of a reference edit. Carries the checks that stop these effects ghosting, drifting and flickering.
---

# KINETIC TYPE OVER FOOTAGE

Type on video is a caption. Type **inside** video is a transition.

Three techniques here. Read the checks first — they cost minutes and they caught every real
defect in a long build; the reasoning below caught almost none of them.

---

## THE FIVE CHECKS, IN THE ORDER THEY WOULD HAVE SAVED TIME

Run these before touching anything else. Each one found a bug that hours of reasoning missed.

**1 · Look at the cut-out layer ON ITS OWN, over a flat colour.**
Not composited. Isolated. `canvas.toDataURL()` and drop it on green.
A correct cut-out is **solid people with nothing showing through them**. If you can see the
background inside a head, the matte is wrong — a person-shaped hole in the wrong place shows
the scene behind, which is the "hollow man" everyone describes and nobody can name.
*This is ten seconds and it should be the FIRST thing done, not the last.*

**2 · Diff the composite with the layer on versus `display:none`, with the type hidden.**
A cut-out drawn over its own footage must change **0% of pixels**. Anything above zero is a
ghost. Mixed `<video>`/`<canvas>` measured 12–24% of the whole frame.

**3 · Verify every sprite cell against the matte it claims to be.**
Compare coverage percentages cell by cell. A sheet built with the wrong filter graph produces
blank or shuffled cells and looks plausible at a glance.

**4 · Measure while it MOVES, never parked on a frame.**
Step the scroll one rAF at a time with no settling. Everything looks perfect at rest.
Count: frozen scrub steps, frames over 32ms, and steps where the matte cell ≠ the frame on screen.

**5 · Measure against a beat the client has already approved.**
"Is this clean" is unanswerable; "is this cleaner than the beat you signed off" is not. Same
sampling, same metric.

---

## THE MISTAKES, AND THE RULE EACH ONE LEAVES BEHIND

Every one of these shipped, was defended with measurements, and was wrong.

| What was seen | What it actually was |
|---|---|
| Type sits off the words and slides as it grows | `xml:space="preserve"` on SVG text — every newline of indentation became a glyph with real width. 23 characters measured as 81. **Keep such elements on one line.** |
| Same, intermittently | Measured with `getBBox()` before the webfont loaded, so the numbers came from the fallback. **Wait for `document.fonts.load`, and keep the effect disabled until you have.** |
| Right on my machine, wrong on theirs | Constants measured at one viewport and scaled by height. **Express targets as fractions of the source clip's own frame.** |
| Leans while growing, though the geometry is a pure scale | Magnifying about a point that is not the thing's own centre. A fixed off-centre point is not drift; a **mismatch** between placement and magnification origin is. |
| Type can't sit on hand-lettering | Hand-written lines **do not share a centre**. Place each line separately, then converge them as it opens — registered where it can be read, symmetric where it cannot. |
| Choppy footage | The scrub loop's seek threshold. `1/48` is fine while a beat advances 2–3 frames per step and silently breaks a dense beat advancing 0.7. **Use `1/120`;** every frame is a keyframe, a seek is cheap. Measured 45 frozen steps in 90 → 0. |
| Ghost trailing the words | A blur on the type's fade-in. Against a hard-edged cut-out it is indistinguishable from a ghost. **Fade on opacity alone.** |
| Doubled edges on a fast pan | Two video elements seeking independently. One frame of lag is invisible at rest and glaring on a pan. **No tolerance is small enough — the architecture is wrong.** |
| A hundred-millisecond stutter | `mask-size:1200%` rasterises the WHOLE sprite at 12× the element every frame — 111 megapixels. **Composite in the canvas with `destination-in`,** reading only the cell: 0.09 megapixels. |
| Cut-out one frame stale | Drawing in the scroll handler. It runs, reads `currentTime`, draws — then the video finishes seeking and repaints in the same pass. **Draw in `requestVideoFrameCallback`.** |
| The outline of a person from elsewhere in the shot | A canvas holds whatever it drew last. **Wipe it when the beat leaves the matte's range**, and let the callback own visibility. |
| Faint second copy of everybody | Base as `<video>`, copy as `<canvas>` — a browser colour-manages them differently. **Both layers through one renderer.** |
| The hollow man | **The sprite sheet never matched the mattes.** Built with a `color=` source through `scale2ref` before `tile`, cells came out blank or shuffled. |

Two habits behind most of them:

- **When the client's eyes and your measurement disagree, the measurement is the suspect.**
  Three separate times a test said "clean" because it was sampling the wrong thing, the wrong
  place, or at rest.
- **Measure the OUTPUT, not the machinery.** Frame locks, geometry and timings can all be perfect
  while the thing on screen is wrong.

---

## 1 · THE WORD AS A WINDOW

The outgoing scene is masked by the word; the incoming scene is already pinned behind it,
playing. The word expands until it is the whole frame — nothing arrives, nothing slides.

    #outgoing .stage{ mask:url(#win) }      /* white everywhere, black in the glyphs */

A hole, not `background-clip:text` — a background can never be a video, so a painted word is
always a frozen frame waiting to become live. With a hole there is one copy of the scene behind
it, and registration stops being something to get right and becomes something that cannot be
wrong.

- **Expand exponentially**, `exp(ln(MAX) · t)`, on ONE monotonic parameter spanning the whole
  move. Stitched phases with their own easing read as hesitation however well they join.
- **Resolve into a plain centred rectangle past ~30×.** A magnified letterform is only whatever
  stroke you happen to be inside, and its ink is not symmetric about its own centre.
- **Register per line** if it maps onto hand-lettering, then converge.
- **Measure the ink on the SOURCE FRAME**, not on a screenshot — hoodies and shadows sit at the
  same value as a marker and quietly join the measurement.

## 2 · PEOPLE WALK IN FRONT OF THE WORDS

Three layers: the shot, the type, and the shot again with everything but the people erased.
This is what an editor does by duplicating a clip — and it only works if both copies go through
**one pipeline**.

    plate video   opacity:0        <- decode source only
    canvas A      z-index 1        <- the frame
    the type      z-index 2
    canvas B      z-index 3        <- the same frame, erased to the people

Both canvases painted from the same frame in the same `requestVideoFrameCallback`. Read the
plate's `object-fit` and transform **off its computed style** — an aspect-ratio media query
silently switching `contain`/`cover` puts the copy on different geometry and is invisible until
someone resizes.

**Mattes — macOS, local, nothing generated.** `person-matte.swift` in this folder;
`swiftc -O -o seg person-matte.swift`.

- Run BOTH Vision requests and union them. `VNGeneratePersonInstanceMaskRequest` (macOS 14+) is
  far better on distinct near figures but **caps at a handful and drops the rest**;
  `VNGeneratePersonSegmentationRequest` returns one combined mask covering the crowd behind them.
- Instances can be filtered by mask area — a usable depth cue when near and far people are mixed.
- **Do NOT union with a luminance key.** On a night shot it cannot tell a dark person from a dark
  stadium and returns almost the whole frame.
- **Harden, do not feather.** A soft edge is a semi-transparent person compositing over the type
  beneath — a ghost of their own head. `dilation,lut=y='clip((val-92)*5,0,255)',gblur=sigma=0.6`.
  Count partial-alpha pixels: 7.5% → 1.2% removed the haloing.

**Sprite sheet, not a second video.** One image, one cell per frame, `destination-in` in the
canvas. 141 mattes at 400px wide = 1.3MB, and no decode or seek cost at all.

    ffmpeg -framerate 60 -i out/f%04d.png -filter_complex \
      "[0:v]format=gray,dilation,lut=y='clip((val-92)*5,0,255)',gblur=sigma=0.6,scale=400:-2,split[a][b];\
       [a]format=rgba[rgb];[rgb][b]alphamerge,tile=12x12" -frames:v 1 -update 1 sprite.png

    const k = Math.floor(v.currentTime * 60 + 1e-4) - FIRSTFRAME;   // FLOOR: a decoder shows
    ctx.drawImage(sprite, (k%12)*CW, Math.floor(k/12)*CH, CW, CH, dx, dy, dw, dh);  // the frame
                                                                    // CONTAINING currentTime

Cut the source frames by **frame index**, never timecode — `-ss` lands wherever the decoder
rounds it, and half a frame out reads as the whole thing glitching.

## 3 · WHERE THE TYPE CAN LIVE

**Measure the matte's coverage of the type's band, frame by frame, across the shot.** On one beat:

    camera moving past close bodies   9% -> 51%, swinging every few frames
    settled on a subject              flat 19-22%

Type over the first reads as flicker, not depth, and no matte work fixes it because the matte is
correct. Either move the type to the steady stretch, or accept the swing as the effect — but know
which you are choosing. Low in frame is usually worst: the nearest figures are largest and softest
there, the hardest thing to matte.

## 4 · DISPLAY TYPE AT REFERENCE SCALE

Pull a **full-resolution frame** of the reference and measure it. A contact sheet lands about a
fifth of the real size. Measured example: one lowercase letter at **21% of frame height** — a
font-size near 30% of frame height, i.e. `~17vw`, not `6vw`.

Four things reference edits do that a first attempt misses: **scale** far beyond what feels
reasonable; **two voices in one line**; a **slight defocus** so the type sits in the shot's depth
of field; and **no plate** — check it has not inherited a caption ground meant for small text.

**Copy and scale are one decision.** Reference-scale type needs reference-length copy: "no fluff"
is eight characters. Thirty-four characters at that size is three stacked lines and a wall.

**Take the second voice from the brand's own type system** — a width axis, a weight, a size — not
from the reference's typeface. Borrowing their face is borrowing their identity.
