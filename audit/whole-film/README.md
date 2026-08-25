# WHOLE-FILM AUDIT

Run against `386d82d`, the live build after the HUD-release commit. Track: whole-film pacing and
QA. **Nothing was added, removed or retuned.** `build/` is untouched by this audit.

Captured headed, both viewports, on a fully warmed page with document height asserted constant
across all 3,564 frames (`heightStable: true`). The earlier phantom flicker is not present and
that baseline stays discarded.

## Contents

| | |
|---|---|
| `recordings/fwd-1440.mp4` | continuous forward, desktop, 40s at 25fps, whole document |
| `recordings/fwd-375.mp4` | continuous forward, mobile |
| `recordings/rev-1440.mp4`, `rev-375.mp4` | continuous reverse, 24s |
| `recordings/fling-1440.mp4`, `fling-375.mp4` | fast fling, 5s, eased through the whole document |
| `stops-1440/`, `stops-375/` | 48 named pause states each |
| `boundaries/` | every boundary at −3, 0, +3 frames |
| `analysis.json`, `telemetry-sampled.json` | per-frame telemetry the timecodes are read from |

Named stops cover `b0`–`b13` at start / mid / release, plus `b13-fade`, `black-hold`,
`action-hairline`, `action-rise`, `action-lock`, `action-final`.

Forward scroll rate is constant: the full 60,840px in 40s (1,521 px/s). Timecodes below are
positions in `fwd-1440.mp4`.

---

## The finding that matters

**Thirteen of the fourteen boundaries are the same transition.** Measured from the capture, every
scene change except the last produces a black run of **0.12–0.16s** — the generic
`--sv` dip. Not similar: identical.

```
0:01.68→0:01.80  0.16s     0:16.60→0:16.68  0.12s     0:31.84→0:31.96  0.16s
0:03.48→0:03.60  0.16s     0:19.96→0:20.04  0.12s     0:35.08→0:35.20  0.16s
0:06.00→0:06.12  0.16s     0:23.08→0:23.16  0.12s     0:38.44→0:40.00  1.60s  <- the close
0:07.56→0:07.68  0.16s     0:26.80→0:26.92  0.16s
0:09.60→0:09.72  0.16s     0:29.08→0:29.20  0.16s
0:13.80→0:13.92  0.16s
```

The protocol asks whether the reader feels carried through one work or watches individual
well-edited clips changing on scroll. **The film currently uses one punctuation mark between
every scene.** That is the mechanical signature of the second reading, and it is the single
highest-value thing this audit found.

The exception proves it: the closing black is **1.60s, ten times longer than any other**, and it
is the only transition in the film that reads as a deliberate editorial decision rather than a
default. It is also the only one anyone has praised.

---

## Transition matrix

Verdicts are about the **relationship**, not the craft. Every boundary is technically clean.

| Boundary | tc | Verdict | Evidence |
|---|---|---|---|
| 0 → 1 | 0:01.76 | **revise** | The intended relationship is "framed print plate *becomes* the cockpit window", and the two shapes genuinely rhyme — same aspect, same position. But `boundaries/b0-to-b1_*.jpg` shows 0.16s of black between them, so they never replace each other. A designed match cut is being delivered by the generic dip. |
| 1 → 2 | 0:03.56 | pass | Approach hands to the city inside `SUCEDERÁ`; the dip reads as a breath after the descent. |
| 2 → 3 | 0:06.08 | pass | Aperture releases to the mark hold. |
| 3 → 4 | 0:07.64 | pass | Mark clears, shutter opens into transport. The one boundary where a hard dip is the point. |
| 4 → 5 | 0:09.68 | pass | Travel reaches the atlas. |
| 5 → 5b | — | pass | Internal to Beat 5; the centre dive is not a boundary and correctly produces no dip. |
| 5 → 6 | 0:13.88 | pass | Athlete releases to the banner claim; no accidental wipe. |
| 6 → 7 | 0:16.64 | **revise** | Banner occupation → street occupation is the film's strongest thematic rhyme, and it gets the same 0.12s dip as the weakest join. Beat 6 measures 0.343 mean change and Beat 7 measures 4.287 — a 12× step delivered with no transition of its own. |
| 7 → 8 | 0:20.04 | pass | Activity cuts into the quiet of the paper. The dip earns its keep here because the contrast is the content. |
| 8 → 9 | 0:23.16 | pass | Handwritten invitation to embodied claim. |
| 9 → 10 | 0:26.88 | pass | Body opens into proof; Miami stays source-native. |
| 10 → 11 | 0:29.16 | pass | Scale resolves into facts. |
| 11 → 12 | 0:31.92 | pass | Event proof gives way to city-as-venue. |
| 12 → 13 | 0:35.16 | pass | Full city settles to the final monument. |
| 13 → action | 0:38.80 | **pass — the model** | HUD reaches zero at 0:38.80, hairline 0:38.84, paper 0:38.88, lock 0:39.20. 1.60s of held black, the instrument released inside it, the hairline arriving on an empty frame. This is what the other thirteen boundaries should be measured against. |

No boundary was found that reads as an accidental crop, a scroll wipe, or a beat working only
downward. **Nothing is marked remove.**

---

## Enhanced-moment checks

| | Result |
|---|---|
| Beat 2 — type is the hero, aperture sensed not displayed | **pass.** Mean change 0.584, one of the quietest beats: the movement is not competing with the word. |
| Beat 5 — planes → grid → dive reads as identity becoming athlete | **pass.** 1.844 mean, no internal dip; the dive is continuous with the grid rather than a cut. |
| Beat 8 — plate settles in sympathy with paper; date untouched | **pass.** 0.626 mean, the second-stillest beat in the film, which is correct for it. |
| Beat 9 — foreground occludes English, Spanish legible | **pass**, confirmed in `stops-1440/b9-mid.jpg` and by the contrast gate. |
| Beat 12 — considered photograph → full replacement, never a dissolve | **pass.** 1.020 mean with the step intact. |

## Reverse and fling

| | desktop | mobile |
|---|---:|---:|
| reverse samples matched to forward | 578 / 578 | 578 / 578 |
| max `--p` drift forward vs reverse | **0.0140** | **0.0140** |
| mean drift | 0.0032 | 0.0032 |
| fling: beats visited | 14 / 14 | 14 / 14 |
| fling: out-of-range `--p` | 0 | 0 |

Nothing in the film works only on downward scroll.

---

## Verdict

**Pacing.** `p90 / mean` change is **2.38** desktop, **2.66** mobile. It was 2.9–3.4 before Beat 0;
posh.vip and the SoCal site measure 1.8–2.0. Genuinely improved and still outside the band, and
the boundary uniformity above is most of the remaining gap — change pools at thirteen identical
seams instead of accumulating.

The dynamic range is very wide: Beat 7 at **4.287** against Beat 3 at **0.297**, a factor of
fourteen. The quiet beats are deliberate and mostly correct (b3 the mark hold, b8 the paper,
b13 the close). The one that gives me pause is **Beat 2 at 0.584 — the signature moment is the
fourth-quietest beat in the film.**

**Copy arrival.** No message is interrupted before it can be read; the caption windows in Beat 0
and the type in Beats 2, 9 and 12 all open and close inside their holds. `THE INDEX.` /
`Choose your way in` remain English against four Spanish actions — a whole-sequence decision, not
a local fix, and still open.

**Functional website rhythm.** The film now has exactly one place a reader can act, and it works:
all four destinations verified, Pre-Registro visibly inert and out of the tab order, return-to-top
persisting to the final pixel. One place is enough for a film of this length — but it is *one*,
arriving at 38 of 40 seconds. There is no earlier moment where a reader who is convinced at Beat 7
can do anything about it.

**Fullscreen versus framed.** **63.8% fullscreen desktop** (≥95% of viewport), 17.3% framed,
8.9% type-only. Mobile 64.2 / 22.5 / 8.9. Before Beat 0 this was 67.8 / 19.8 / 4.1. **Beat 0 moved
the balance by four points.** One framed moment in a fourteen-beat film does not change what the
film is; it proves the language works and nothing more. The references sit at 7–9% fullscreen.

**Overall:** the film reads as a strong, coherent, technically flawless piece whose scenes are
joined by a single repeated punctuation mark. The four-act pressure curve is present and the acts
do not merely wait for the next asset. What it lacks is transition *vocabulary* — and it already
contains the proof that vocabulary works, at 13 → action.

---

## The next two highest-value interventions, and only two

**1 · Differentiate the boundaries. Start with 6 → 7 and 0 → 1.**
Thirteen identical dips is the whole finding. The fix is not thirteen new transitions — it is
two or three *kinds*, chosen per relationship, so the reader can feel the difference between a
breath and a cut. The two boundaries carrying real thematic weight are the ones being flattened:
0 → 1 was designed as a match cut and is not currently cutting, and 6 → 7 is the film's best
rhyme delivered as its most generic join. Both are timing changes to existing material.

**2 · A second framed moment, mid-film, in Act III.**
The balance did not move because there is one framed beat and it is the opening. The ledger's
second-wave candidates already name the material and the film's own hot stretch is Beats 7–9,
where a reader is most convinced and has nothing to do and nowhere to pause. A contained moment
in that stretch would lower fullscreen dominance where it actually counts and give the middle of
the film a place to breathe.

Everything else — copy language, Asdeporte linking, first-view weight, the timelapse and flag —
is real but smaller, and none of it changes how the film reads.
