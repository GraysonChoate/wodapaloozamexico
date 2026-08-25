# VISUAL AUDIT — `67d2047`

Frames from the pushed commit, captured in **headed Chromium** — a real browser window with a
real compositor. The UA was checked for a `Headless` marker before capture and carried none.
Nothing here comes from the embedded preview pane, which in this setup never fires scroll
events and never starts media playback.

`git diff 67d2047 -- build/` was empty at capture time, so these depict exactly the pushed
rendering code.

Start here:

    CONTACT-desktop-1440x900.jpg     all 18 stops, desktop
    CONTACT-mobile-375x812.jpg       all 18 stops, mobile

Individual frames are `<viewport>_<nn>-<name>.jpg`. Stops are given as a fraction through a
named beat, not through the document, so they stay meaningful as later beats are added.

| # | stop | what it shows | what to look at |
|---|---|---|---|
| 01 | b1 · 0.10 | cockpit at cruise | HUD legible over a blown-out windscreen; altimeter reads 2,240 |
| 02 | b1 · 0.75 | cockpit, camera pushing forward | still cockpit — the old cut ran into Beat 4's car here |
| 03 | b2 · 0.20 | `SUCEDERÁ`, width axis narrow | lit windows inside the counters; night Ángel |
| 04 | b2 · 0.80 | `SUCEDERÁ`, width axis wide | letterforms widen with scroll; fill still has contrast |
| 05 | b3 · 0.55 | the mark | green-to-blue gradient; date line |
| 06 | b4 · 0.10 | the shutter opening | 2.39:1 band on desktop; **54svh on mobile — compare the two sheets** |
| 07 | b4 · 0.55 | highway | headlight spill escaping the band into the margins |
| 08 | b4 · 1.00 | CDMX taxi | **source-native pink** — the car is pink, nothing is applied |
| 09 | b5 · 0.05 | one figure, full bleed | the centre cell of the grid at scale 3 |
| 10 | b5 · 0.38 | the sheet registering | frames arriving at angles — transitional, deliberately unresolved |
| 11 | b5 · 0.62 | the contact sheet of nine | eight looping panels + one still (`STF00176`, Torre Latinoamericana) |
| 12 | b5 · 0.84 | the dive to one | dive completes to a single full frame **before** the cut |
| 13 | b5 · 0.90 | the match cut | hard cut, no wipe or dissolve; athlete entering the pose |
| 14 | b5 · 0.99 | lockout | the pose the hooded figure already held |
| 15 | b6 · 0.14 | stone | top of the Monumento arch |
| 16 | b6 · 0.42 | the figure on the ledge | **the figure is in this shot** — the one who hung the banner |
| 17 | b6 · 0.70 | `SUCEDERÁ EN CDMX` | **source-native magenta and cyan** — ungraded, afternoon light |
| 18 | b6 · 1.00 | the steps | the descent lands; altimeter reads FLOOR |

## Known limits of these stills

- **They cannot show motion.** The panels in 11 loop at uneven rates (0.78×–1.18×) so the
  nine breathe out of sync; a still shows nine frozen figures. Same for the banner breathing
  in 15–18 and the wind in the contact sheet.
- **They cannot show the transitions.** Every beat boundary is a dip to black, and stops were
  chosen to sit inside beats rather than across seams.
- **Frame 10 is mid-transition by design** and is the least resolved frame in the set.
- **Mobile Beat 6 has no vertical travel** — the 1080×1920 source fits a portrait viewport by
  height, so 15–18 differ far less on mobile than on desktop. That is the material, not a
  regression.

Regenerate with `build/verify-browser.sh` running, or re-run the capture used here from the
milestone report.
