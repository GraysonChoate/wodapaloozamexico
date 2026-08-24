# SUPER PROMPT — WZA MEXICO CITY

Paste this whole file to any agent joining this project. It is the complete grounding.

---

## WHAT WE ARE MAKING

A scroll-driven website for **Wodapalooza Mexico City**, the first edition of the world's
largest functional-fitness festival held in Mexico, **4–6 December 2026**.

This is not a landing page and it is not a template. The operator's brief, in his words:

> *"An incredible captivating emotional scrolling experience that brings depth and movement
> and dimension to the media."*
> *"This one's gonna look like we are moving through the footage."*
> *"This cannot be a basic build."*

The client has **extensive original video and photography**. That footage is the material.
The site's job is to move the viewer *through* it, not to present it in boxes.

---

## THE ORDER OF WORK — DO NOT SKIP

1. ✅ Research — `research/BRAND.md`, `research/CITY.md`, `research/CREATIVE.md`
2. ✅ Brand extraction — measured, not guessed. Hexes read off the client's usage guide.
3. ✅ Footage intake — every asset downloaded and viewed. Film at 1fps across all 58s.
4. ✅ Storyboard — `storyboard/STORYBOARD-v3.md`, 13 beats, every one naming a real file.
5. ⬜ **Build.**

Build against the storyboard, not against this summary.

---

## THE STORY

**Descent.** The announcement film opens in an AEROPLANE COCKPIT, then a car at night, then
the street, then the competition floor. You do not climb to Mexico City. You arrive, and it
swallows you. An earlier draft of this brief said "ascent" — the footage disproved it.

- Miami sits at sea level. Mexico City sits at **2,240 m**. Every athlete feels it.
- Wodapalooza began in 2012 with **145 athletes and 500 spectators**. Now 2,000+ athletes.
- Miami 2012 → SoCal 2024 → **Mexico City 2026.** The third city, ever.
- There is exactly **one first edition**, and it expires in December.

Three ideas repeat in the client's own copy: **belonging · earning · the standard.**

**The campaign's own idea, and it is better than anything invented:** one figure in a black
hoodie, hood up, back to camera, arms raised, standing before El Ángel, Monumento a la
Revolución, Torre Latinoamericana. You never see their face **because it could be you.**

## BRAND — LOAD-BEARING, MEASURED

Full detail in `research/BRAND.md`. The essentials:

**Typeface: Normalidad** (CSTM Fonts, on Adobe Fonts).
`normalidad-wide` for display, `normalidad-text` for body.

It is a **variable font with BOTH a width axis and a weight axis** — Compact to
UltraExtended, Thin to Black. **Width is animatable.** Type can physically expand as the
reader scrolls. Most brands cannot do this. This should carry a signature moment and it is
the most distinctive typographic asset on the project.

**Palette** — these hexes are printed on page 2 of the client's own usage guide:

    #6CC180   brand green
    #35A7DF   brand blue
    #000000   black — the ground
    gradient  green -> blue, left to right. THIS IS THE SIGNATURE.

**Mexico runs COOL. Miami runs HOT.** `#e6178b` magenta belongs to the PARENT brand — Miami,
the LatAm Cup — and appears on this site exactly once, deliberately, where WZA-global speaks.
An earlier draft of this brief led with magenta. That was wrong.

**The gradient is a light source, not a fill.** It rakes across type, edges a frame, bleeds
from behind a monument. It appears when Mexico City speaks and vanishes when Miami does.

**The mark is a STICKER.** It is monoline black-and-white so it can be applied to a surface
that already has its own colour — a teal lamppost, a yellow wall, a purple mural. **Mexico
City supplies the colour; the brand supplies the mark.** Do not invent a Mexico palette. The
campaign already photographed the answer.

**Four approved lockups**, all vector, all held locally: gradient-on-black · white-on-green ·
black-on-blue · gradient-on-white. `assets/logos/USOS_LOGO_WZA.ai`

**Voice** — verbatim, do not paraphrase:

> **El estándar de Miami ahora en México.**
> **El camino hacia la primera edición de WZA Mexico comienza aquí.**
> ...demostrar que **pertenecen** al escenario más importante de la temporada.
> **Es momento de ganarte tu lugar.**

Spanish-first. Second person. Imperative. Speaks TO the athlete, never ABOUT the event.

---

## ART DIRECTION — MEXICO CITY

**Not festive.** No papel picado, no marigolds, no calaveras. An event importing "el estándar
de Miami" cannot look like a foreigner's idea of Mexico.

The look is set by the guerrilla shoot and should be matched exactly: **natural light only,
filmic and slightly warm, shallow depth of field, low angle looking up at both figure and
architecture, wide hazy skies, muted overall** — which is why the gradient reads so loudly
when it appears.

**Do not grade the altitude out of the footage.** CDMX light is harder and hazier than Miami
light. That difference is the entire differentiator.

Textures are **harvested, not generated**: the halftone, vinyl creases and torn brush edges
already exist in the guerrilla photographs at 6000px. Use those.

## HARD FACTS

| | |
|---|---|
| Dates | 4–6 December 2026 |
| Qualifier | 18–26 August 2026 |
| Organizer | Asdeporte — 30 years, 1M+ registered users, ~90,000 athletes/year |
| Divisions | 16 — Elite, Rx, Intermediate (M/F); Teens 13–15, 16–18; Masters 35–39, 40–44, 45+ |
| Sponsors | Openbank · Powerade · Centrum · Sports World · asdeporte |
| Instagram | @wodapaloozamexico |

**The Instagram link block must appear on the site** — the operator has confirmed the links
currently in the IG bio belong on the page.

---

## WHAT IS UNKNOWN — NEVER INVENT

- **The venue is not announced.** Anywhere. Do not name one. The Zócalo shown empty and then
  full is the answer, and the film already made that argument.
- Ticket pricing, packages, day-by-day schedule, prize purse.
- Whether Miami's format (the Gauntlet, exhibitor village) carries over.

**Settled — do not reopen:** English-led with Spanish only where it hits hardest · silent, no
audio · vector marks are held locally, nothing is missing.

This is a MOCKUP whose job is impact, not a production site. Real links, ticket flows and
venue names are not required. Do not invent facts, but do not hedge the design either.

---

## TECHNICAL AMBITION

The operator wants every effect we can justify. "Justify" is the operative word — effects
serve the footage and the story, never decorate.

Techniques in scope:

- **Scroll-scrubbed video** — the reader's scroll IS the playhead. This is the core of
  "moving through the footage."
- **Variable-font width/weight animation** on scroll — the signature move.
- Multi-plane parallax for real depth, not a single translate.
- Clip-path and mask reveals — footage uncovered rather than faded in.
- Camera push / reframe on stills so nothing is ever static.
- Sticky pinned sequences where a held screen earns the scroll it takes.
- Colour-temperature and grain drift keyed to altitude/time-of-day.
- Type masked by footage, footage masked by type.

Non-negotiables:

1. **Visible is the base state.** If the script fails, the page still reads. Nothing is
   hidden behind an effect that may not run.
2. **It must work scrolling UP.** Effects driven by position, never one-shot triggers.
3. **Readability beats everything.** No dark type on a dark image, ever. A wash covers where
   the type is, not the whole frame — never dull the footage to make copy legible.
4. **Never dull the product.** The athletes and the city are the argument.
5. Respect `prefers-reduced-motion`.
6. Performance is a design constraint: scrubbed video needs encoding discipline, not hope.

---

## FOR CODEX SPECIFICALLY

Work from this document and the two research files. Do not re-derive the brand — it was
measured from the live site and the numbers are in `BRAND.md` with the method recorded.

Where you disagree with a decision here, say so and say why. Where you need a fact that is
in the "unknown" list, ask rather than invent.

**The storyboard is written.** `storyboard/STORYBOARD-v3.md` — 13 beats, 4 acts, every beat
naming a real file with a verified timecode. Build against that, not against this summary.

**Decisions locked:** English-led, Spanish only where it hits hardest · silent, no audio ·
no venue named (none is public; the Zócalo empty-then-full answers it).
