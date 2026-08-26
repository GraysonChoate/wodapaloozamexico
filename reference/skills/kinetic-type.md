---
name: kinetic-type
description: Put type INSIDE footage — words that are a hole onto the next scene, words a foreground walks in front of, and display type sized to a reference rather than guessed. Use when a scroll film or edit needs a word to become a window, text occluded by people or objects in a shot, kinetic type over video, or when matching the typography of a reference edit. Carries the measurement discipline that stops these effects drifting.
---

# KINETIC TYPE OVER FOOTAGE

Type on video is a caption. Type **inside** video is a transition. Three techniques, and one
discipline that matters more than all of them.

---

## THE DISCIPLINE — read this first

Every one of these effects places something, then magnifies it. **Any error in the placement
gets multiplied by the magnification.** Twenty pixels wrong at 1× is fifteen hundred wrong at
75×, and it does not look like "wrong placement" — it looks like the thing is *drifting*.

So when someone says "it's sliding" and your maths says "it's centred", **your maths is not the
evidence.** Measure the rendered pixels.

    Paint the layer BEHIND the effect a colour nothing else in the scene uses (#ff00ff),
    screenshot, and find those pixels. That is where the thing actually is.

Failures this caught that arithmetic did not:

| Symptom | Actual cause |
|---|---|
| Type sits off the target and slides as it grows | `xml:space="preserve"` on an SVG `<text>` — every newline of indentation became a glyph with real advance width. 23 characters measured as 81. The reported box was 1.37× too wide and its centre an eighth of that off. **Keep such elements on one line.** |
| Same, intermittently | Measured with `getBBox()` before the webfont loaded, so the numbers came from the fallback. **Wait for `document.fonts.load(...)`, and leave the effect disabled until you have.** |
| Correct on your machine, wrong on theirs | Every constant was a pixel measurement taken at one viewport and scaled by height. **Express targets as fractions of the source clip's own frame**, never in pixels. |
| It leans even though the geometry is a pure scale | Magnifying about a point that is not the thing's own centre. A fixed off-centre point is *not* drift; a **mismatch** between placement and magnification origin is. |

`getBBox()` and `getExtentOfChar()` disagree for anchored multi-line SVG text. Union the
per-character extents; that is what the reader sees.

---

## 1 · THE WORD AS A WINDOW

The outgoing scene is masked by the word. The incoming scene is already pinned behind it,
playing. The word expands until it is the whole frame — nothing arrives, nothing slides.

    #outgoing .stage{ mask:url(#win); }      /* white everywhere, black in the glyphs */

Why a mask and not `background-clip:text`: a background can never be a video, so a painted
word is always a frozen frame waiting to become live. A hole has one copy of the scene behind
it, so **registration stops being something to get right and becomes something that cannot be
wrong.**

- **Expand exponentially**, `exp(ln(MAX) · t)`, on ONE monotonic parameter spanning the whole
  move. Constant *relative* growth is what continuous expansion looks like; stitched phases with
  their own easing read as hesitation however well the joins line up.
- **Resolve into a plain rectangle** past ~30×. A magnified letterform is only whatever stroke
  you happen to be inside, and its ink is not symmetric about its own centre — that asymmetry
  reads as movement. Grow a centred rect on the same parameter and the glyph's lopsidedness
  washes out.
- **If it maps onto hand-lettering, place each line separately.** Hand-written lines do not share
  a centre. One centred block sits on one line and must miss the others. Register per line, then
  converge them onto a common axis as it opens — registered where it can be read, symmetric
  where it cannot.

## 2 · THE FOREGROUND WALKS IN FRONT OF THE WORDS

Text between the scene and a keyed copy of that same scene.

    ffmpeg -i shot.mp4 -vf "lumakey=threshold=0.26:tolerance=0.16:softness=0.10,format=yuva420p" \
      -c:v libvpx-vp9 -pix_fmt yuva420p -auto-alt-ref 0 -g 1 -b:v 0 -crf 40 fg.webm

Layer: `[shot] → [type] → [fg.webm]`. Chrome honours WebM alpha (verify: ~87% transparent
against a test ground; `ffprobe` reports the base `pix_fmt` and will not show it).

**Why this is nearly free:** every pixel the key keeps is *identical* to the pixel beneath it, so
the matte does not have to be accurate. It can only be seen where the type is. Nothing is
rotoscoped and nothing is generated.

**It only works when the foreground is dark against a bright ground** — silhouettes, night
crowds, backlit figures. A *bright* subject needs real segmentation; say so rather than
promising it.

Encode only the frames the silhouettes exist for, and hide the layer outside them. `-g 1` for
scrubbing. Drive its `currentTime` from the same scroll parameter as the base clip.

## 3 · DISPLAY TYPE AT REFERENCE SCALE

If there is a reference, **pull a full-resolution frame and measure it.** Approximating from a
contact sheet lands about a fifth of the real size.

A measured example: a single lowercase letter occupying **21% of frame height** — a font-size
near **30% of frame height**. That is `~17vw`, not `6vw`.

Four things reference edits do that a first attempt usually misses:

1. **Scale** — far bigger than feels reasonable, spanning 55–60% of frame width.
2. **Two voices in one line** — a bold grotesque against a flowing italic. The contrast *is* the
   design.
3. **Slight defocus** — so the type sits inside the shot's depth of field instead of on top of
   it. In the reference the further word is visibly softer. This is most of why it reads as
   being *in* the scene.
4. **No plate.** Check the type has not inherited a shared caption/legibility ground meant for
   small utility text. A display headline in a box reads as a subtitle.

---

## CHECKS

- Measure in rendered pixels, at **two different viewport sizes**, across the whole move — not at
  the size you calibrated at, and not at one scroll position.
- Track left/right balance of the effect, not just its centroid; a centroid stops meaning
  anything once the shape runs off the frame.
- Judge at normal scroll speed with the real neighbouring beats. A contact sheet cannot approve
  a transition.
