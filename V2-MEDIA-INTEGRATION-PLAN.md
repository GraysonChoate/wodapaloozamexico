# Wodapalooza México V2 — Media Integration Plan

This pass preserves the SoCal-derived section geometry and adds source-native Mexico material one section at a time. No asset is placed globally, and no placeholder is treated as final.

## Placement map

| Site section | First-choice material | Treatment | Reason |
|---|---|---|---|
| Hero | Fitness-led footage from the supplied source library | Full-bleed background video, darkened for legibility, restrained scroll-linked scale/position | The first emotional signal must be competition and athletic energy, not travel imagery |
| Hero identity beat | `Other B-Roll/Mexico Flag.mov` | Optional short crossfade/overlay or later hero cut; never a permanent flag wash | Establishes Mexico without competing with the event title |
| Editorial / city section | Monument and guerrilla-poster stills | One contained/full-bleed image relationship with subtle depth; preserve native color | Gives Mexico City a concrete physical identity |
| Sponsor/mark rail | Official Mexico logo variants only | Compact rail treatment matching the reference proportions | Maintains brand continuity without repeating the same mark everywhere |
| Metrics | No footage required | Pale-blue field, real count-up, restrained background texture only if it improves separation | Keeps the information block clean and legible |
| Product section | Placeholder plates until approved product photography arrives | Four equal cards, hover lift only, no invented product imagery | Preserves layout fidelity while content is pending |
| CTA | City/architectural still or quiet paper/sky source | Washed-out image field, small CTA, no oversized logo | Echoes the reference CTA without turning it into another hero |
| Footer | Black field; optional tiny campaign material detail | Minimal and functional | Keeps the ending quiet |

## Source order

1. Fitness footage for the hero.
2. City/competition photography for the editorial section.
3. Mexico Flag footage as a controlled identity accent.
4. Real poster, paper, sticker, and texture material only at named transitions.
5. Product imagery after the structure is approved.

## Integration rules

- Keep the current V2 layout and sizing unchanged while adding media.
- Use local source files only; do not use screen-recorded SoCal or Miami footage in the Mexico page.
- Preserve natural source colors. Page effects may add masks, crop, blur, blend, and depth, but may not recolor documentary footage into a generic gradient.
- Every video gets `muted`, `autoplay`, `loop`, `playsinline`, a poster/fallback, and a reduced-motion still path.
- Video must remain decorative unless the file is a deliberate interaction cue; the page must work if playback is unavailable.
- Review each section at desktop and mobile, forward and reverse scroll, before moving to the next section.

## First implementation slice

Integrate one approved fitness clip into the existing `hero-video` slot only. Do not add the Mexico Flag clip or additional textures until the hero crop, legibility, and fallback are reviewed. The flag then becomes the second isolated media prototype, not a blanket overlay.
