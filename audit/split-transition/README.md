# Beat 7 → Beat 8 — badge through the lens, street opens flat, words set as written

## Three corrections

**1. The badge comes straight at the reader.** It was drifting off to the left. It sits
registered on the sticker at 48%/48%, and `perspective()` magnifies about the element's own
centre — so at an eight-fold blow-up a two per cent offset throws it clean off the side. It now
travels to dead centre as it pushes: `left: calc(48% + var(--push) * 2%)`, same for top. It
starts on the sticker and arrives at the middle of the frame.

**2. The black bar of type is gone.** That was `.b7strip`, Beat 7's own marquee — absolutely
positioned inside a stage that is *releasing*, so it rode upward while still running sideways.
It belongs to the street beat and has no business in the handover; it clears the instant the
split begins.

**3. The words are set the way he wrote them.**

```
RECUERDA          EL ONLINE          COMIENZA          ES DEL
                  QUALIFIER                            18 AL 26
                                                       DE AGOSTO
```

Broken exactly where the sheets break. The outline is a tracing of what he is holding, so it has
to be laid out the way he laid it out — run as one long line it stops being his handwriting and
becomes a caption.

## Unchanged

No vertical travel: the halves are viewport-anchored and the perspective lives on the badge's own
transform, not on the stage. Beat 8 still pins behind Beat 7 so no second frame arrives. The
frame still grows 1 → 1.30 across the sheets. The words still push six-fold and pass the reader.

## Deliverables

`final-{1440,375}-{fwd,rev}.mp4` — badge, book and all four sheets at normal speed.
`opening.jpg` — twelve frames across the opening. Visual proof only; no full regression until
the composition is accepted.
