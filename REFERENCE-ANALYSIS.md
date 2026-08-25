# Two references, two different jobs

Measured 25 Aug 2026 against `lumin-sites.vercel.app` (Wodapalooza SoCal) and `posh.vip`,
in a real headed browser at 1440×900, with real wheel events so Lenis and GSAP actually ran.
Every number below is measured, not estimated. Nothing in `build/` was changed.

> **Direction was set on 25 Aug after this was written — see §8 at the end, which
> supersedes the open questions in §6. The foundation is approved and is not being
> rebuilt. Everything here is a case for layering, not for starting over.**

---

## 0 · The first thing to be clear about

**These two references are not the same kind of reference, and treating them as one list of
"things we like" is the fastest way to build something confused.**

| | SoCal | Posh |
|---|---|---|
| What it is | The **brand system of record** — what a Wodapalooza website *is* | The **motion grammar** — how a premium site *moves* |
| Motion libraries | **none** (`libs: []`) | GSAP, ScrollTrigger, Lenis, Draggable, InertiaPlugin |
| Scroll choreography | none | 12 triggers, 11 scrubbed |
| Length | 4.9 screens | 11.9 screens |

SoCal is not cinematic. It has no scroll work at all. Sections simply arrive. It is a
well-made conventional event site — and it is the sibling of the thing we are building, so
its *system* (nav, colour, typeface, section order, footer) is authoritative in a way its
*ambition* is not.

Posh has no event to sell and almost no video. It is the opposite: all grammar, no system.

**We should take the system from SoCal and the grammar from Posh.** Neither one is the target
on its own.

---

## 1 · The measurement that explains the instinct

You said: *"it feels like a big video that I can scroll through… you've just had a video
that's basically full screen the whole time."*

Here is that, quantified. Percentage of the scroll at which the largest visible media element
covers ≥95% of the viewport, ≥85%, is *framed* (visible but smaller than the frame), or absent:

| | fullscreen ≥95% | ≥85% | **framed** | type only |
|---|---|---|---|---|
| **Ours** | **67.8%** | 76.0% | **19.8%** | 4.1% |
| Posh | 8.6% | 8.6% | **84.0%** | 7.4% |
| SoCal | 7.4% | 24.7% | **75.3%** | 0% |

Both references live at **7–9% fullscreen and 75–84% framed.** We are at **68% fullscreen and
20% framed.** The ratio is almost exactly inverted.

Two more numbers that say the same thing a different way:

| | pinned sections | total length | sticky elements |
|---|---|---|---|
| **Ours** | **13** (every beat) | **61.2 screens** (55,080px) | 13 |
| Posh | **0** | 11.9 screens | 5 (layout panels, not media pins) |
| SoCal | **0** | 4.9 screens | 0 |

**Posh pins nothing.** Not one section. The page scrolls normally and motion is applied to
elements *as they travel past* — 450px trigger spans with `scrub: 0.8` smoothing. Many small
continuous moves, rather than a few long holds.

That is the mechanism behind the number we already had: our p90/mean change ratio of 2.9–3.4
against the references' steady 1.8–2.0. Our change **pools at beat boundaries** because
everything in between is a pinned hold. Theirs is spread thin and even across the whole page.

**The film is not a video player with scroll control — but right now, 68% of it is.**

---

## 2 · Type: we are much smaller than both of them

| | display sizes in use | weights | families |
|---|---|---|---|
| **Ours** | **73, 58** then straight to 15 | 800 / 700 / 600 / 400 | Archivo + JetBrains Mono |
| Posh | 128, 40, 35, 32, 21, 20, 16, 14, 12 | **400 only** | **Neue Haas only** |
| SoCal | 125, 120, 110, 96, 90, 50 | 700 / 400 | Unbounded + Inter |

Two things fall out of this:

1. **Our largest type is 73px.** Posh's is 128. SoCal has *six* display sizes above 50px. On a
   1440 frame, 73px is 5% of the width — it reads as a caption, not a statement.
2. **We have fourteen separate instances of 11px JetBrains Mono.** Our HUD is loud in count and
   quiet in size; our statements are quiet in both. Both references do the reverse: very few
   type objects, each very large.

Posh is the sharper lesson here — **one family, one weight, and the entire hierarchy carried by
scale alone** (128 → 35 is a 3.7× jump). No bold anywhere on the site.

---

## 3 · What SoCal gives us — the Wodapalooza system

Extracted from its own CSS custom properties, so these are the real tokens:

```
--wza-bg              #111116
--wza-fg              #f5f5f7
--wza-muted           #9a9aa3
--wza-line            rgba(255,255,255,.08)
--wza-pink            #FF6A2C     (named "pink", is orange — the action colour)
--wza-pink-glow       rgba(255,106,44,.55)
--wza-accent2         #FF2D78
--wza-cyan            #16e0ff
--wza-eyebrow-color   #FF6A2C
--wza-button-bg       #FF6A2C
--wza-heading-color   #ffffff
--wza-subheading      rgba(255,255,255,.78)
--wza-body            rgba(255,255,255,.72)
--section-padding     clamp(48px,6vh,72px)
```
Plus the secondary highlight blue actually in use: **#79A3DC** — the colour of the word
"FITNESS" and of the `K+` and `+` glyphs in the stat row.

**Grain overlay** — fixed, full viewport, `z-index: 9999`, `opacity: 0.05`,
`mix-blend-mode: overlay`, an inline SVG-noise data URI. Cheap to port and it is a large part
of why the site reads as one material.

**Navigation:** dark bar. WZA lockup left. `HOME · COMPETE▾ · VOLUNTEER · PLAN YOUR WEEKEND ·
MEDIA`. Then, right-aligned, three objects: a **city switcher pill `◉ SOCAL`**, a **`SHOP`**
pill, and an orange **`GET TICKETS`** button.

**The city switcher, and "Back to Miami" in the footer, are the important discovery.** There is
an established multi-city structure. Mexico City is edition three. We are not building a
one-off — we are building a sibling, and there is a slot to land in.

**Repeating section unit**, used five times:
> small orange eyebrow (`COMPETE`, `THE FESTIVAL`, `OUR STORY`) → giant Unbounded 700 uppercase
> headline → one short paragraph → one pill CTA

**Section rhythm:** dark full-bleed video ↔ light content panel, alternating. The video sections
carry the headline over the footage; the light sections carry the facts.

**The marquee.** A white horizontal ticker slides in under the hero:
`+ 100+ BRANDS + LIVE MUSIC + BEACHFRONT THROWDOWNS + TEENS + ADAPTIVE DIVISIONS +
HUNTINGTON BEACH · CA + FESTIVAL VILLAGE`, with orange `+` separators. This is the HUD-with-a-
system that was asked for, already solved in the brand's own language.

**Stat row with counters** — giant numerals, unit glyphs (`+`, `K`) in blue, small label and
sub-label beneath. They animate up (caught mid-count at 97+ and 2.4K+ before settling at
100+ and 2.5K+).

**Sponsor wall** — "POWERED BY **THE BEST**" (second half in blue), logo row, an orange
`TITLE SPONSOR` tag, blue `BECOME AN EXHIBITOR` pill.

**Merch band** — black, brand skull, product cutouts, `SHOP MERCH AT GYMREAPERS.COM`.

**Footer** — four columns: `COMPETE` / `VOLUNTEER` / `INFO` / `CONNECT`.

---

## 4 · What Posh gives us — the grammar

Eleven things it does that we do not. These are the whipped cream, the chocolate and the cherry.

1. **Nothing pins.** Zero pinned triggers. Motion happens *to things as they pass*, not by
   holding the viewer still while media plays.

2. **Media lives in a named frame.** Its own class names are the vocabulary:
   `fancy-media-wrapper anamorphic`, `fancy-media-wrapper widescreen border`. Footage is an
   *object placed on a page*, with white around it — not the page itself.

3. **The frame animates.** In the organizer section the media starts as a contained box inset in
   white, grows, bleeds off the top edge, dominates — then releases back to white. **Fullscreen
   is an event that is arrived at and departed from, not a default state.** This is the single
   most portable idea on the site.

4. **One typeface, one weight, scale does the work.** Covered above.

5. **White is a material, not leftover space.** For long stretches the entire viewport is white
   with one small object floating in it — the phone occupies maybe 12% of the frame.

6. **Colour comes from the content, never the chrome.** The page is black-on-white. All colour
   arrives via the flyers, the blue crowd, the yellow ticket button *inside* the media.

7. **There is something you can touch.** The hero flyer row is drag-throwable with real physics
   (`Draggable` + `InertiaPlugin`), and the headline changes with the selected flyer —
   "Find your world." becomes "Live Performance." One flyer pops out of the row, scaled and
   offset, breaking the grid.

8. **A constant subject carrying a changing narrative.** One floating phone, gently rotating in
   3D, holds three beats while its *screen content* changes (event page → ticket tiers →
   tickets fanned out) and the copy beside it crossfades from grey to black as each becomes
   active. The subject never leaves; the story moves through it.

9. **A list with an active item over changing media.** Organizer names stacked vertically
   (Adidas, Lamborghini, Wheels NYC, Palm Tree Crew…), the active one opaque white and the rest
   translucent, with the background media swapping to match, a caption bottom-left and a
   `View organizer` pill right.

10. **The invert.** The site is white for 90% of its length and then flips to **black** for the
    final CTA and footer. "See you soon." at 128px white on black. The colour change *is* the
    ending.

11. **Short spans, smoothed.** Most triggers run 450px — half a viewport — with `scrub: 0.8`,
    which lags the animation behind the scroll and is a large part of why it feels expensive.

---

## 5 · The honest diagnosis

**We built a film. We were asked for a website. Both are good work; they are not the same
object.** The locked beats are not the problem — Beat 5's dimensional grid and Beat 9's
depth-masked photograph *are already* the "framed media" idea. They simply happen to be
executed at fullscreen, where the frame cannot be read as a frame.

Three specific consequences:

- The three deadest stretches we measured — **b1 at 2.4, b2 at 6.4, b13 at 0.0** — are exactly
  where both references put their *most* designed moments: the manipulable hero object, the
  signature, and the invert close. Our last 7.6% is completely static; Posh's last 7.6% is the
  single biggest colour event on the site.
- 61.2 screens is **5× Posh and 12× SoCal.** Length is doing work that density should do.
- Nothing on the page announces this as a Wodapalooza property. No grain, no orange, no
  Unbounded, no city switcher, no ticker. It is a beautiful orphan.

---

## 6 · What to decide tomorrow — these are yours, not mine

**1. The ratio.** What fraction of the film should be fullscreen? Posh is 8%, SoCal 7%, we are
68%. We are an event film and should sit higher than a SaaS site — but 68% is what "big video"
feels like. A target somewhere near 20–25% would keep every locked beat and change only how
much of the frame each occupies and for how long.

**2. The length.** 61 screens, 55,080px. Is that the piece? Halving it would roughly double the
density without cutting a single beat.

**3. The big one — do we adopt the WZA system?** Orange `#FF6A2C`, Unbounded, the grain, the
nav, the city switcher, the ticker, the footer columns. This would instantly make it read as a
Wodapalooza site and as edition three of a real series.

   **The conflict to resolve:** our standing palette rule is green → blue/black/white/neutral.
   SoCal's action colour is orange. The blues are close (their #79A3DC against ours), so the
   divergence is specifically the orange. Either we take their orange and drop the rule, keep
   our rule and diverge visibly from the sibling site, or find the one place orange is allowed
   (the ticket button only). This is a brand decision and it should be made deliberately rather
   than by default.

**4. Do we want something the viewer can touch?** Posh's drag-throwable flyer row is the moment
the site stops being a broadcast. We have 18 guerrilla stills, 16 of them unplaced, which is
almost exactly the same object as a row of event flyers.

**5. What is our ending?** Beat 13 currently has a change rate of 0.0. Posh's answer is to
invert the entire page. Ours needs *an* answer — and it is also where Pre-Registro lands, which
is still blocked on the full verified URL.

---

## 7 · Also found today

The daytime drone b-roll is **on disk** — the four screen recordings in `Other B-Roll/` are a
player showing real Mexico City aerial footage: Bellas Artes with traffic, a straight-down
overhead of the Ángel, an orbit around it, and a pull-back down Reforma with the boulevard
receding in symmetry. This is the material the Beat 1 prelude was rejected for lacking.
Not touched yet.

Captures and raw measurement dumps live in the session scratchpad under `refs/`.

---

## 8 · Direction set 25 Aug — this supersedes the open questions in §6

Read this before acting on anything above. Several of the "decisions for tomorrow" have been
made, and the framing of §1 needs one correction.

**The foundation is approved and is not being rebuilt.** The story — plane → car → the sticker
treatment → the photograph split into sections — is locked and liked. Nothing in this document
is a case for starting over. It is a case for layering.

**The correction to §1.** The problem with 68% fullscreen was never only how it looks. It was
that *fullscreen is a filter on the footage*: if every beat must carry an entire frame, only
clips that survive an entire frame can be used, and everything else is silently disqualified.
Smaller frames are not just visual variety — they make currently-unusable material usable. That
is the real cost we have been paying, and it is why the fix is additive rather than corrective.

**The target is balance, not inversion.** We are not going to Posh's 8%. Entering on a full
frame of the plane footage is right and stays. Fullscreen remains available for entrances and
for dominant claims; it stops being the default for everything in between.

**Additive only. Nothing already in the film gets replaced.** What gets added:
- print stops (`reference/prototypes/campaign-print-pause.html`,
  `reference/prototypes/moving-print-frame.html` are the specimens)
- stills placed into the film, not only alongside it
- some b-roll moved into smaller frames rather than full ones
- **the Mexican flag clip**, which is a specific named addition
- new ways to layer and move material in — this is the open creative work

**The bar.** Significantly better than the SoCal site, borrowing selected elements from it. Not
a copy of it, and not a copy of Posh either.

**Colour is decided and closed. We do not take WZA SoCal's palette.** The Mexico event has its
own distinct colours and those are the ones we use. §6.3 was a bad question and the "orange
conflict" it describes does not exist — there was never anything to resolve. Take structure
from SoCal if anything (nav, section order, the city switcher, the ticker); never its colours.
Do not raise this again.

Still open, to be talked through fresh: the ending (§6.5), and whether we want something the
viewer can touch (§6.4).
