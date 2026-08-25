# BEAT 12 — ARCHITECTURAL REVEAL BRIEF

Prepared by Codex in parallel with Beat 8. This is a source-first direction brief, not a
request to modify the active build before Beat 8 is reviewed.

## Verified material

The empty and full Zócalo plates hold the same elevated architecture:

- Cathedral towers remain centered.
- Palacio Nacional remains to the right.
- The two views carry approximately the same framing, with only small vertical drift.
- The empty plate is dusk: stone and a thin movement of people.
- The full plate is night: the same square occupied at scale.

The existing hard swap is correct. It must remain a **step**, never a dissolve: the claim is
not that a crowd gradually appeared, but that the same city can be read two radically
different ways.

## Proposed enhancement

Let the empty plate begin as a contained architectural object on black—an intentional frame
with its own calm border. It then makes one slow, controlled widen/scale-to-viewport move and
locks **before** the existing hard replacement. The full square occupies the identical box.

The spatial sequence:

1. an observed city photograph;
2. the photograph expands into the reader’s field of view;
3. a complete held empty square;
4. hard replacement: the same view, now full;
5. date arrives only after the replacement.

This is the Sea Serenade grammar applied to the one moment whose footage can pay for it. It
must be calmer than Beat 5—no tilt, no 3D panel treatment, no added grain, and no animation
on the full crowd plate beyond the source motion.

## Constraints

- Keep `object-fit: contain`: it preserves the full bright-source frame and its watermark.
- The frame boundary must be neutral black/white, not a card treatment with rounded corners,
  gradient, or shadow that looks like UI.
- The empty plate should begin contained enough to be unmistakably an object, but never so
  small it reads as a thumbnail.
- The expansion must end before the swap. Do not zoom through the step.
- Desktop and mobile may use different contained margins, but must preserve the same
  architectural alignment at the swap.
- No synthetic texture or colour treatment. The dusk/night replacement is already the colour
  event.
- Preserve the current reduced-motion/no-JS fallback: empty plate, then full plate, then date.

## Approval test

Approve only if the initial frame feels like a photograph being considered, the widening makes
the hard swap more forceful, and the full plate still reads as an honest same-view replacement.
Reject if the frame edge resembles a dashboard card, if the swap becomes a wipe/dissolve, or
if the title/date arrives early and competes with the empty/full contrast.
