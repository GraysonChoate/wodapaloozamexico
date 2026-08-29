# Mexico V2 — SoCal Reference Dimension Audit

Status: reference pass, before the next visual implementation pass.

This document separates facts that can be verified from the live page from geometry read from
the supplied SoCal captures. The captures include browser chrome, so the geometry below is
normalized to the page frame visible in the captures (approximately 1,728 px wide on desktop),
not to the full screenshot bitmap. Values are targets for the Mexico page at the equivalent
desktop width; they must scale proportionally on smaller screens.

## Verified reference sequence

The current SoCal page exposes this order and content: primary navigation; full hero with date,
stacked event title, description and ticket action; repeating event-highlight ticker; editorial
event image and copy; sponsor/logo rail with circular previous/next controls; pale-blue proof
section with heading and three statistics; four-column pre-order equipment grid; washed-out
beach ticket action; black footer with social links and utility links.

Reference text/content observed from the live page:

- Navigation: Home, Get Tickets, Compete, Volunteer, Plan Your Weekend, Purchase Equipment,
  Contact, Partners.
- Hero: Huntington Beach, CA | Sept 25–27; SoCal Fitness Festival; one-sentence description;
  Get Tickets.
- Ticker: Live Music, Vendor Village, 3 Days of Competition, Beachfront Throwdown, 50+ Brands,
  Wellness Zone.
- Proof: The Ultimate Fitness Weekend; 50+; 1.5K+; 3.
- Products: Rogue Echo Ski, Rogue Kettlebell, Rogue Echo Bike, Rogue Medball.
- Ending action: Get Tickets / Tap to Secure Your Spot.

## Desktop geometry targets

These are the visual bounds to match before adding Mexico footage. They are intentionally expressed
as ranges because the supplied captures show different scroll positions and browser viewport
heights.

| Region | Target page-frame height | Target internal scale / placement |
|---|---:|---|
| Primary nav | 78–94 px | Full-width transparent/blurred rail; small mark at left; links centered/right; no pill container |
| Hero | 780–900 px or one viewport | Left content column begins about 8% from left; eyebrow 14–18 px; 3-line display title about 86–112 px with tight leading; CTA about 430–480 × 72–92 px |
| Color seam | 4–6 px | Green → cyan/blue line immediately under hero |
| Event ticker | 72–86 px | White; vertically centered; uppercase display text about 25–34 px; one continuous horizontal loop |
| Editorial image | 540–650 px | Full-width image; dark overlay; copy lives in the right half and stays well below the ticker |
| Sponsor rail | 210–270 px | White; logos distributed across one row; circular arrows about 54–70 px; arrows only here |
| Metrics proof | 620–760 px | Pale blue field; heading about 78–108 px; three equal columns; numbers about 88–118 px; labels about 16–20 px |
| Product section | 680–820 px | White; 4 equal columns; heading about 50–70 px, usually one/two lines; outlined Shop All button about 265–320 × 70–86 px |
| Product image plates | 270–350 px | Equal-width plates with generous white space; names about 22–28 px; price/limit copy about 16–20 px |
| Ticket CTA | 430–560 px | Washed-out image; centered single-line `GET TICKETS` about 86–118 px; button about 390–430 × 70–78 px |
| Footer | 300–400 px | Black; social row and stacked links aligned to a quiet left column; no oversized heading |

## Non-negotiable proportional rules

1. The CTA title must be materially smaller than the hero title and must remain one line at the
   desktop reference width. Spanish can wrap only when the language genuinely requires it.
2. The ticker is a band, not a section: its height must never approach a hero or proof section.
3. The sponsor rail is the only place for circular previous/next controls.
4. The Mexico logo appears in the compact nav and in one intentional identity moment. It is not a
   repeated background stamp, product placeholder, or decoration in every section.
5. Section labels use the small monospaced treatment. Body copy stays readable and never uses
   display-scale sizing.
6. All scroll-linked transforms are reversible: downward progress maps 0 → 1 and upward progress
   maps 1 → 0. No effect may depend on a one-time intersection flag.
7. The eventual hero video owns the hero surface. It does not change the measured hero geometry.

## Current V2 mismatches to correct

- `Nos vemos en México` is currently styled as a second oversized hero; reduce it to the CTA
  target above and keep it centered on one compact action plane.
- Generic `.section-title` sizing is too broad; each region needs its own reference scale.
- The editorial section is compositionally asymmetric: copy belongs on the right half, while the
  image/identity plane belongs on the left. The hero is the left-copy section; do not reuse that
  alignment for the editorial block.
- The Mexico story/logo block must preserve that relationship: Mexico identity on the left,
  restrained editorial copy on the right.
- The current proof title and metric numerals need the same hierarchy as the reference, with the
  metric tally driven by reversible scroll progress.
- Product placeholders should preserve the reference's four-column geometry and restrained
  card typography while real product images are pending.

## Measurement implementation rule

Do not make another global `vw` typography change. Encode the rows above as section-level tokens
(`--nav-h`, `--ticker-h`, `--cta-title-size`, etc.), then validate at one desktop and one mobile
viewport. A change passes only when the section bounds, text block width, CTA size, and rail height
remain comparable in both directions of scroll.

Source reference: https://socal.wodapalooza.com/
