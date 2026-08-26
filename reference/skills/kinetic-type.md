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

**The real technique is the same scene over itself with the background removed** — a cut-out of
the people, laid on top of the type. Everything else here is an imitation of that, and only
works in special cases.

### 2a · Proper segmentation — the one that always works

macOS does person segmentation locally, no model download, no network, nothing generated. It is
a matte of found footage, frame by frame. `person-matte.swift` in this skill folder is the tool;
build it with `swiftc -O -o seg person-matte.swift`.

    ffmpeg -ss IN -t DUR -i shot.mp4 -vf "scale=1280:-2" in/f%04d.png
    ./seg in out                                   # ~100 frames in 11s, .accurate quality
    ffmpeg -framerate 60 -i in/f%04d.png -framerate 60 -i out/f%04d.png \
      -filter_complex "[1]format=gray[m];[0][m]alphamerge,format=yuva420p" \
      -c:v libvpx-vp9 -pix_fmt yuva420p -auto-alt-ref 0 -g 1 -b:v 0 -crf 38 fg.webm

**Run BOTH requests and union them — neither is sufficient alone.**
`VNGeneratePersonInstanceMaskRequest` (macOS 14+) returns each person separately and is much
better on distinct near figures — one measured frame went from one silhouette caught to three —
but it CAPS at a handful of instances and silently drops the rest, which leaves the rows of
spectators behind the subject unmasked. `VNGeneratePersonSegmentationRequest` returns one
combined mask for everybody it can see, so it covers those rows. Union the two.

Instances can also be filtered by mask area, which is a usable depth cue: people in the stands
and in front of the camera are large, competitors out on the floor are small. Worth knowing,
though on the shot measured here Vision never detected the distant floor figures at all, so the
filter had nothing to drop.
The tool here does this with a fallback.

**HARDEN the matte; do not feather it.** A feathered edge is semi-transparent, and a
semi-transparent person composites over the type beneath it — which is not a soft edge, it is a
**ghost of the person's head with the words showing through**. Dilate slightly so the figure is
fully covered, then push the alpha near-binary and leave only about a pixel of anti-aliasing:

    dilation,lut=y='clip((val-92)*5,0,255)',gblur=sigma=0.6

Measure it: count pixels with partial alpha (say 30–225). On one frame that went from **7.5%
soft to 1.2%**, and the ghosting went with it. Partial alpha IS the ghost.

**And do not blur the type on its way in.** A fade that blurs is a soft copy of the words
spreading past their own edges; against a hard-edged cut-out that is indistinguishable from a
ghost trailing the type. Fade on opacity alone.

**GUARD THE OVERLAY AGAINST ITS OWN SEEK LATENCY.** VP9 seeks far slower than the H.264 the beat
scrubs, so on a fast scroll the cut-out lags the shot — measured at **4.2 frames during a flick**
— and a cut-out of a person offset from that same person IS a double image. It only happens in
motion, so every still you measure looks perfect while the user watches it double.

    const off = Math.abs(FG.currentTime - want);
    if (off > 2 / 60) hide the layer;          // unoccluded for a frame beats a ghost

Test by scrolling across the range at one step per rAF with no settling, and count samples DRAWN
while out of sync. Shrinking the alpha layer (960 wide, higher CRF) makes the seeks cheap enough
that it rarely trips.

**Put the type where the matte is cleanest.** Low in frame is usually the worst place — the
nearest figures are largest, softest and most out of focus there, which is the hardest region to
matte. Raising the line into the mid-band both reads better and removes most of the problem
before it starts.

Segment only the stretch the type is on screen.

**Do NOT union the matte with a luminance key to catch what it missed.** Tried on a night
shot: a luma key cannot tell a dark silhouette from a dark stadium, so it returned almost the
whole frame and buried the type completely. If segmentation misses someone, fix the
segmentation.

### 2b · The luminance shortcut — dark subjects only



Text between the scene and a keyed copy of that same scene.

    ffmpeg -i shot.mp4 -vf "lumakey=threshold=0.26:tolerance=0.16:softness=0.10,format=yuva420p" \
      -c:v libvpx-vp9 -pix_fmt yuva420p -auto-alt-ref 0 -g 1 -b:v 0 -crf 40 fg.webm

Layer: `[shot] → [type] → [fg.webm]`. Chrome honours WebM alpha (verify: ~87% transparent
against a test ground; `ffprobe` reports the base `pix_fmt` and will not show it).

**Why this is nearly free:** every pixel the key keeps is *identical* to the pixel beneath it, so
the matte does not have to be accurate. It can only be seen where the type is. Nothing is
rotoscoped and nothing is generated.

**Only when the foreground is dark against a bright ground** — silhouettes, night crowds,
backlit figures. On a lit subject it produces nothing readable as depth, and on a dark subject
against a dark ground the occlusion is technically correct but invisible: the viewer cannot tell
a person from a fade. **If the depth has to READ, use 2a.** That mistake cost a whole round here:
the mechanism was right, the shot could not show it.

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
