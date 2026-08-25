# Beat 1 — the drone prelude · **REJECTED, KEPT AS A TEST**

**This is not in the film.** Reverted at review: the night aerial turns the city into a
thin anonymous strip of lights, too small and too empty on mobile to earn the opening, and
it spends roughly 80vh of scroll on an image without enough compositional information.

**The grammar survives the rejection.** Contained exterior object → expansion → hard step
into the cockpit is a valid move and is proven here. It was applied to the wrong shot.

The identification was mine and it was wrong: I treated "drone" as the night aerial the raw
film happens to open on, because that is what the brief pointed at. It is not the daytime
overhead/foot-traffic b-roll the operator means.

---

Prototype 5. **Beat 1 only.** Not a new beat: the prelude is added in front of the cockpit
inside Beat 1, and the cockpit keeps the same 300svh of scroll it always had. The descent
spine is unchanged.

## The factual limitation in the raw clip

This is the constraint that decided the treatment, and it is severe:

    0.60–0.94   clean, but mostly the fade up from black
    0.96        WELCOME TO MEXICO CITY burns in
    ...         and stays, to the cut at 2.17

The title occupies **y 40–62%**, reaching **y 63%** at its lowest. Uncropped, the title-free
window is about **0.34 seconds**, most of it too dark to read as a city.

So the crop is **forced by the source, not chosen**: `x 0–80%, y 66–100%` clears the burned
title *and* the film's own watermark, and yields **1.25s** of the best part of the shot — the
light-field itself. The plate is 3.68:1 because that is what the clean region measures.

## The one physical action

    a contained aerial object on black  →  expands  →  hard step inside

The city is presented as an object first: a small wide plate, 58vw, with a hairline, on pure
black. It expands to full width as the scroll runs, and at p 0.20 the cockpit replaces it as a
**step**.

The handoff is a step, not a dissolve. That is the film's grammar everywhere else, and here it
is also the honest move — the two frames are different shapes and different places. Exterior
becomes interior; it does not blend into it.

**The cockpit is held at zero until the step.** With the interior showing behind the plate the
prelude read as picture-in-picture *inside* the cockpit, which is the opposite of the sentence.

The altitude caption belongs to the cockpit and is gated off during the prelude.

## Cost

First-view weight went 6.4 MB → **7.9 MB**. The prelude is 1.4 MB and loads with Beat 1
because it is the first thing on screen.

## Verification

Six gates green, 60fps with **zero** frames over 33ms at both viewports. Reverse, fast scroll,
no-JS and reduced-motion all preserved — under reduced motion the plate is simply wide and
static and the cockpit is always visible.

    CONTACT-desktop-1440x900.jpg  /  CONTACT-mobile-375x812.jpg
    scroll-forward.webm  /  scroll-reverse.webm  /  scroll-fast.webm


---

## Candidates found while reverting

The film already contains **unused daytime overhead drone footage** with real city-world
content — people, movement, architecture, street energy — in two title-free windows:

| Window | Length | Content |
|---|---|---|
| **39.29–40.08** | 0.79s | straight down on the Ángel de la Independencia roundabout, the circle packed with a crowd, the gold Ángel at the centre, radial green rings |
| **41.67–43.00** | 1.33s | straight down on a second roundabout, crowds streaming along radial avenues, tree-lined boulevards, towers |

`38.58–39.29` carries a burned `IN A CITY THAT HAS IT ALL` and is unusable. The film's own
watermark is present and **whole** in all of these frames.

See `rejected-and-candidates/overhead-candidates.jpg`.

**This is offered, not built.** It may or may not be the b-roll the operator has in hand, and
the instruction is to verify the actual source first. But if the required material turns out to
already be in the supplied film, that is worth knowing before anyone goes looking for it.
