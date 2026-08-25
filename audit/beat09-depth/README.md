# Beat 9 — depth prototype

The hero prototype, redirected from Beat 2 after Beat 2's premise was tested and failed.

## Why not Beat 2

`b02_aerial.mp4` cannot give a monument silhouette, tested three ways:

- **The late passage does not contain the Ángel.** The brief expected the column to become a
  clean vertical against darker sky as the camera closes in. By 0.85s the camera has moved to
  office towers and the monument is out of frame entirely.
- **Luminance cannot separate it.** At every threshold the monument box and the tower box hold
  the same density of bright pixels — `>110`: 33.9% vs 31.3%; `>150`: 18.3% vs 19.9%.
- **Colour cannot separate it.** The whole scene is sodium-lit; a gold key returns 100,296 px
  of streetlight.

## Why Beat 9 works

`STF00032` was shot on a hazy day, and that cuts both ways. The **monument still cannot be
separated** — the gold statue measures 220, the sunlit column edge 230 and the distant
buildings 241 against a sky of 226–234. But the **near foreground separates decisively**: the
hooded figure and the tree canopy are dark and strongly green against a uniformly bright ground.

So the words pass **in front of the monument and behind the person**. That is the truer
sentence anyway: the body is in front of the message, the city is behind both.

## How it is built

One photograph, drawn twice. The back copy is the whole frame. The front copy is the same file
masked to the near foreground. The type is printed between them.

- The matte comes from the frame's own luminance and saturation, cleaned with a morphological
  open/close and reduced to **regions that reach past two-thirds of the frame height** — the
  distant skyline has dark window bands that pass the threshold and float at mid-height, and
  when the words descended they were bitten by fragments of skyline.
- **Both copies carry an identical transform and an identical filter.** Scaling them at
  different rates was the first attempt at a depth cue and it is wrong — they are the same
  pixels, so any offset is a double image, not parallax. Washing only the base drew a bright
  silhouette along the matte edge and gave the whole thing away.
- **The mask is cropped exactly as the picture is** (`mask-size: cover`, `mask-position` matching
  `object-position`). With `mask-size: 100% 100%` the mask stretches while the image crops, and
  the two are never aligned — that produced opaque cloud shapes biting chunks out of the words.
- The type is the only element that travels. It arrives clear in the open sky and **descends
  into the figure**; the hood and the raised fists take it just before the match cut.

No Three.js. No synthetic texture. No grading, no fake light. No compositing of separate
sources — the daylight Ángel is not put into the night aerial.

## What to look at

    CONTACT-desktop-1440x900.jpg    six states
    CONTACT-mobile-375x812.jpg      the same six
    scroll-forward.webm             normal pace, down
    scroll-reverse.webm             normal pace, up — the effect must survive going backwards
    scroll-fast.webm                a fling

`05-taken-by-the-figure` is the proof frame: the hood passes in front of the English line.

## Verification

All six gates green: source rules, behaviour in a real browser, measured contrast, no word
clipped from 320px to 1920px, and 60fps with zero dropped frames.
