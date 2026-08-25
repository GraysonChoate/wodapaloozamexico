# Closing HUD release — implemented and recorded

Implements the locked decision in `dffb086`. **Only the HUD timing changed.** Beat 13's footage,
the black-hold duration, the action-index choreography and all of its copy are untouched — the
diff is one block inside `frame()`.

## The recordings

Forward and reverse, both viewports, 151 frames each at 30fps. Captured on a fully warmed page
with document height confirmed stable, per the baseline Codex set. The earlier harness flicker is
not present in these and is discarded.

| file | |
|---|---|
| `arrival-1440-fwd.mp4` | monument → fade → black → HUD release → hairline → paper → lock |
| `arrival-1440-rev.mp4` | the same stretch scrolled back up |
| `arrival-375-fwd.mp4` | mobile forward (padded to 376 for h264; capture is 375 wide) |
| `arrival-375-rev.mp4` | mobile reverse |
| `arrival-1440-fwd-contactsheet.jpg` | the forward recording sampled at 2.4fps |

## The three requirements, measured

Full data in `measurements.json`.

| | 1440×900 | 375×812 |
|---|---:|---:|
| document height stable through the walk | true | true |
| **HUD opacity when the black hold begins** | **1.000** | **1.000** |
| HUD reaches zero | y 58102 | y 52420 |
| hairline appears | y 58198 | y 52507 |
| paper first moves | y 58295 | y 52595 |
| margin: HUD gone before hairline | **96 px** | **87 px** |
| margin: HUD gone before paper | **193 px** | **175 px** |
| max forward↔reverse drift | **0** | **0** |

1. **`FLOOR` readable through Beat 13's completion and into the black.** The HUD measures a full
   `1.000` at the exact frame the black hold begins — it does not start leaving until the film
   has already finished.
2. **Released during the black hold.** The fade lives entirely inside the empty stretch; nothing
   is on screen while it happens.
3. **Gone before anything arrives.** Zero at 96px before the hairline and 193px before the paper
   at desktop; 87px and 175px at mobile.

## How it is timed

Off the action index's own approach rather than off Beat 13, so it holds regardless of what the
beat above is doing:

```
fade from  action-top = 0.34H   to   action-top = 0.06H
```

The window was derived from measurement, not chosen: at 1440×900 the black hold begins with the
index still `0.47H` below the viewport top and its hairline arrives at `-0.04H`, so `0.34H →
0.06H` sits inside that window with roughly a fifth of a viewport of margin at each end. The
fractions are viewport-relative, which is why the same margins hold at 375×812.

## Gates

`regress.sh` — **LOCKED · every gate green.** 206 ranges, 14/14 source rules, every playhead
tracks and returns, contrast floors clear, nothing clipped 320→1920, 31 runs of type on a printed
ground clear their floor, 60fps with 0 frames over 33ms desktop and 1 (0.1%) mobile.

## Note for the whole-film review

Beat 0 already holds the other half of this symmetry: the HUD is absent over the printed city at
the opening and arrives with the cockpit. With this change the instrument now belongs to the
flight at both ends — it appears when the aircraft does and leaves when the film does, and the
printed sheet carries the only mark.
