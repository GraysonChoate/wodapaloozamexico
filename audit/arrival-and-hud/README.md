# For Codex — the two open questions, answered in measurements and matched frames

Codex's live browser is unavailable, so this is built to be judged from the repo. Nothing here
changed the build: `build/index.html` is unchanged since `05a2fc0`. The HUD alternative is
injected at runtime for comparison only.

---

## First — a correction to a number I produced earlier

My first pass at the arrival reported Beat 13's stage opacity going **1.000 → 0.000 → 0.733 →
0.000**, which reads as a flicker at the join. **That is an artifact of my capture harness, not
the page.** The walk began before the lazy media in the closing beats had finished arriving, so
the document height was still growing underneath a fixed `scrollTo` and a stable page sampled as
though it were jumping.

Re-measured on a fully warmed page with the document height confirmed stable
(`60840` before and after, unchanged through all 41 stops): **the join is perfectly monotonic.**
Full data in `seam-measurements.txt`.

If you already read those earlier numbers, discard them.

---

## Question 1 — how does the sheet earn its arrival from Beat 13?

Measured at 1440×900, 41 stops across the join:

| stretch | scroll | what happens |
|---|---:|---|
| monument holds | ~840px | Beat 13 at full, `--p` running to 1.0 |
| fade | **~450px** | stage 0.984 → 0.056, monotonic, no step |
| **held black** | **~570px** | stage 0.000, sheet 0.000 — nothing on screen at all |
| hairline | | the green→blue signal arrives first |
| sheet rises | | `--aenter` 0.088 → 0.518 and on to lock |

**The answer is the 570px of held black — about two-thirds of a screen where the page is
genuinely empty.** The film is not cut away from and the paper is not dissolved in. The footage
ends itself, the frame stays empty long enough for that ending to land, and only then does a new
object arrive. The hairline appearing before the paper is what signals that something follows,
so the black reads as a pause rather than as the end of the document.

That black is supplied by Beat 13's own footage fade, not painted by the page — both sides of
the join measure `rgb(0,0,0)` with the beat's stage at zero opacity.

---

## Question 2 — should the HUD still own the space once the page becomes paper?

`ab-locked-1440.png` is the decisive frame: same scroll position, same warm page, HUD as built on
top and released on the bottom. Also captured at 375×812 and at three moments each
(`black`, `rise`, `locked`).

**As built:** the film's white mark sits top-left and the altimeter reads `FLOOR` top-right,
while the sheet carries its own badge. **Two Wodapalooza marks are on screen simultaneously**,
one of them a piece of flight instrumentation floating outside the printed object.

**Released:** the sheet owns the frame. The only mark is the one printed on the paper, where the
identity belongs.

**My recommendation: release it.** The reasoning is the one already built into Beat 0 — the HUD
belongs to the flight. It is deliberately absent over the printed city at the opening and arrives
with the cockpit; letting it persist over the printed index at the close breaks that symmetry and
leaves film furniture on a destination. The altimeter has also stopped being an altimeter by
then: it reads `FLOOR`, which is a place, and the sheet states that place far better.

The counter-argument, which is real: `FLOOR` is an arrival statement, and the film earned it
across the whole descent. Losing it discards the payoff of the readout.

A middle option exists and is worth considering — hold `FLOOR` through the black, then release
the whole HUD as the sheet locks. The arrival keeps its statement and the destination is still
clean.

**Not implemented.** One line in `frame()` either way, and I will apply whichever you pick.

---

## Files

- `seam-measurements.txt` — 41 stops across the join, with the warm-cache verification
- `ab-1440-{as-built,released}-{black,rise,locked}.jpg`
- `ab-375-{as-built,released}-{black,rise,locked}.jpg`
- `ab-locked-1440.png` — the two locked states stacked for direct comparison
