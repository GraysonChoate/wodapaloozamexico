# V2 Motion Pass 01 — 2.5D Hero Foundation

Implemented without importing a heavy animation stack or adding footage.

## Motion vocabulary

- Background plane: oversized layered gradient field, slowly scales and travels upward as the
  reader moves through the hero.
- Velocity response: the background receives a small horizontal displacement from scroll velocity,
  creating a visible but restrained sense of momentum.
- Typography: section copy uses a reversible top-to-bottom line-mask reveal with a short vertical
  settle. It is directly derived from the Toolroom line-mask reveal pattern.
- Identity plane: the Mexico story block uses a screen-blended green/cyan atmosphere behind the
  mark and copy, with a separate depth value from the content.
- Metrics: numerals remain tied to scroll progress and reverse when the reader scrolls upward.

## Asset slots

The hero now contains an explicit `hero-video` media slot. Future fitness footage can replace that
layer without changing the hero content geometry or motion contract.

## Guardrails

- No SoCal or Miami marks.
- No documentary footage is graded by the UI layer.
- No one-time intersection state.
- Reduced motion leaves all content visible and disables the motion layer.
- The page remains a standard scroll layout; pinned scrollytelling is reserved for a later,
  source-supported hero transition proof.
