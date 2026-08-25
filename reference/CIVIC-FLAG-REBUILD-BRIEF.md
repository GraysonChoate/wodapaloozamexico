# Civic Flag — Continuous-Overlap Rebuild

## Status

The `fa7cdce` civic-flag implementation is **rejected as a visual result**. Do not preserve its
black release, contained-poster-on-empty-page composition, or its “plate alone on black” state.
Its seam metric is not a creative approval.

## The problem to solve

The existing sequence reads as a static PowerPoint slide: a small portrait photo sitting on a
pale page, then a black void, then the next scene. The Motion Site references do the opposite:
the outgoing scene, graphic material, and incoming scene overlap during the handoff. At every
moment, something intentional owns the frame.

## Required sentence

`street occupation / badge → vertical registration axis → flag and public scale → actual Beat 8 paper message`

The badge/pole relationship is valid. Make it visible, continuous, and spatial.

## Required mechanics

1. **No black release.** Remove `.bfblack` / `--fblack` as an interstitial device. Do not shrink
   the flag to a lonely image on black. A p99 “not technically empty” score is irrelevant if the
   viewer experiences a void.
2. **The flag enters from the Beat 7 strip.** The closing Beat 7 registration strip remains
   visually present while the flag starts. Use that exact x-axis as the flag mast/plate axis.
   The flag image begins as a narrow cropped reveal around the pole, then opens asymmetrically.
3. **The print field is an active edge system, not a contained pale poster.** It must fill or
   overlap the stage through purposeful graphic edges/brush/halftone. Do not use a portrait asset
   `object-fit: contain` as a small page floating in a landscape void. Crop/scale it as a full
   working field while retaining visible ink energy, or split it into two authored edge layers.
4. **Give the flag real scale.** Desktop flag plate should occupy roughly 45–60vw at its held
   state; mobile 68–78vw. The photograph should feel like a civic window, not a postage stamp.
5. **Use one spatial action.** The flag plate may arrive with shallow perspective/roll and lock,
   but the field, plate, and strip must move as one composition. No generic scale-up on a static
   background.
6. **Beat 8 begins before the flag is gone.** Carry the same vertical registration / paper-edge
   geometry into Beat 8. The real Spanish paper message must either replace the flag within a
   shared cropped plane or open out of its edge. The city, print material, and incoming Beat 8
   overlap during this handoff.

## CSS / implementation guardrails

- Keep the source video ungraded and its clean portrait crop.
- Prefer `clip-path`, `transform`, `perspective`, shared CSS custom properties, and layered
  opacity/crop overlap. Do not cover the problem with a timed black layer.
- `#bf` may become shorter if the revised move has more density; do not spend 300svh on a static
  photograph.
- At every point through both joins, the viewport must contain at least one meaningful visual:
  exiting Beat 7 material, the active ink field, expanding flag crop, or entering Beat 8 material.
- Build the visual proof first: normal-speed desktop plus mobile, forward and reverse. Run the
  full regression only after the composition has been accepted.

## Acceptance test — visual, not just numeric

At a normal scroll speed, a reader should be able to describe one continuous motion:
“the street’s vertical marker became the flagpole, the city opened around it, then the printed
message took its place.” If they can describe “flag card → black → newspaper,” rebuild it.
