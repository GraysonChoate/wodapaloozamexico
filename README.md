# WZA MEXICO CITY

Scroll-driven site for the first edition of Wodapalooza in Mexico City — 4–6 December 2026.

**Start here:** [`SUPERPROMPT.md`](SUPERPROMPT.md) — paste it whole to any agent joining
the project. It is the complete grounding.

---

## Where things go

    SUPERPROMPT.md        the full brief — give this to Codex or any new agent
    research/BRAND.md     typeface, palette, mark, voice — MEASURED, with method recorded
    research/CITY.md      early art-direction notes — SUPERSEDED by CREATIVE.md
    storyboard/           STORYBOARD-v3.md — 13 beats, every one naming a real file
    assets/video/         client footage
    assets/images/        client stills
    assets/logos/         all four lockups + the .ai vectors
    assets/audio/         if the piece takes sound
    reference/            look-and-feel references, competitor teardowns
    build/index.html      THE FILM — beats 1-5
    build/regress.sh      run after every beat; all four gates must be green
    build/serve.py        the dev server. python http.server cannot serve video seeks
    build/media/          derivatives + MEDIA-MAP.md (every in/out point, and why)

## Order of work

1. ✅ Research
2. ✅ Brand extraction — hexes read off the client's own usage guide
3. ✅ Footage intake — every asset viewed, film at 1fps across all 58s
4. ✅ Storyboard — storyboard/STORYBOARD-v3.md, 13 beats
5. 🔨 Build — Beats 1–5 running continuous in `build/index.html`, 8 to go

## The four things that decide whether this is good

**Descent.** The film opens in an aeroplane cockpit, then a car at night, then the street,
then the floor. You do not climb to Mexico City. You arrive, and it swallows you.

**Belonging.** Their own words: *demostrar que pertenecen* · *es momento de ganarte tu lugar*.
It speaks to the athlete, never about the event.

**Green to blue, never magenta.** `#6CC180 → #35A7DF`, printed on page 2 of the client's own
usage guide. Magenta is the Miami parent brand and appears exactly once, deliberately.

**The mark is a sticker.** Monoline black-and-white so it goes on top of whatever colour a
wall already is. Mexico City supplies the colour; the brand supplies the mark.

## Settled

English-led, Spanish where it hits hardest · silent, no audio · no venue named (none is
public; the Zócalo empty-then-full answers it) · vector marks held locally.

This is a MOCKUP built for impact, not a production site.

## Open

- **Normalidad** needs an Adobe Fonts kit. Archivo Variable stands in — it also carries a
  `wdth` axis, so the mechanic is honest, but the letterforms are not final.
