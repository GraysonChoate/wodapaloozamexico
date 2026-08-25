# WODAPALOOZA MEXICO — PRODUCTION SPRINT SUPERPROMPT

You are the live-build owner. Start from the current transition-pass build (`ecc539b`) and treat
the base film as working. The goal for the remaining production window is not more analysis: turn
the strong scroll-film foundation into a premium, functional cinematic website.

## The non-negotiable creative correction

The site must not read as “a well-edited video you scroll through.” It needs to feel like a
designed world with distinct places, physical graphic objects, useful pauses, and transitions
that carry a reader from one scene to the next.

The Motion Site references are about **authored trajectories**, not generic boxes scaling in and
out. Use asymmetric arrivals, diagonal recession, shallow orbital/spiral settles, rotation that
locks flat, crop/registration mechanics, shared apertures, full-bleed-to-object changes, and
editorial black breath. A transition must explain why one shot becomes the next.

The Mexico campaign-print reference is a real part of the site: off-white paper, black ink,
cyan/magenta/yellow spray, halftone, dry brush, misregistration, sign-like geometry. Use it as
page-owned material around framed objects and held information—not as a blanket filter painted
over documentary footage.

## Working rules

- Fullscreen footage is a choice, not the default. Use contained moving plates, crop windows,
  plane fields, paper objects, and editorial pauses wherever they have a narrative job.
- No generic hard scene cuts because a section ends. A hard step is valid only when it is an
  explicit visual sentence.
- No artificial grading or fake light on footage. Source-native colour remains source-native.
- Do not invent event facts, venues, sponsors, or destinations.
- Use supplied `Other B-Roll/` material in this refinement phase. Exclude visible player
  chrome/end-screen frames as a build-quality issue.
- Preserve accessibility and reverse scroll. Do not sacrifice readable copy for an effect.
- The current official action index stays the destination. Pre-Registro remains visibly inactive
  until its complete URL is supplied.

## Stop losing production time to automation

Do not repeatedly run the full regression suite while iterating one visual move. For each proof,
use: normal-speed desktop/mobile capture, forward/reverse state, blank-frame check, and one
performance read. Run the full suite once when that proof is review-ready, and once at major
integration. If a test is flaky but no visual defect is demonstrated, record it and move on.

## Current base: accept, do not reopen casually

- Beat 0 is the daytime Ángel pull-back → print field/plate → cockpit descent.
- Beats 2, 5, 8, 9 and 12 are approved structural enhancements.
- Beat 13 fades through real black into the action index; HUD releases during that black.
- The new 0→1 and 6→7 aperture joins are the active transition proof. Do not revert them to
  generic black dips. Capture them for review and only revisit if their normal-speed motion fails
  the quality bar.

## Build order — execute in this order

### 1. Audit the two new joins quickly and visibly

Deliver one normal-speed desktop recording that includes both joins, plus a mobile check. Judge
the opening by the quality bar: it must not merely shrink to a centred box over empty space. If
the approved aperture still feels too generic, choose the best source-compatible motion form:
diagonal registration, recessed asymmetric plate, or windshield lock. Do not start a prolonged
test-engineering cycle.

### 2. Build the single mid-film framed interruption: civic flag

Use `Other B-Roll/Screen Recording 2026-08-25 at 12.36.43 AM.mov`, window `2.6–5.9s`.

Home: between Beat 7 street occupation and Beat 8's real handwritten qualifier message.

Sentence: **a mark is placed in the city → the city has public scale → the message arrives.**

Build it as a tall contained moving flag plate—not another full-screen city clip:

1. Beat 7 releases through a registration/crop relationship; no generic dip.
2. The flag plate arrives offset or on a shallow controlled trajectory and locks flat. The pole is
   the vertical axis. Use `reference/authored-materials/v1/civic-flag-field-01.png` as the
   surrounding print field; `poster-edge-vertical-01.png` is the quieter fallback.
3. Keep the photograph ungraded. Let the flag, open sky, silhouettes, and passing pedestrians do
   the work. No nationalist bumper, no new slogan, no invented copy.
4. Hold long enough to be an actual place, then give way purposefully to Beat 8's real paper
   message. Preserve Beat 8's quietness and full Spanish legibility.

Deliver one desktop/mobile forward/reverse recording and a short contact sheet. Stop for review.

### 3. Make the site feel functional, not like a passive film

After the flag proof is accepted, build the functional layer in
`reference/FUNCTIONAL-WEB-LAYER.md`:

- a minimal persistent compact mark/home control;
- one real primary escape hatch: `QUALIFIER ↗` to the verified CompetitionCorner destination;
- a quiet progress/place readout, not a dashboard;
- a small editorial index opened from the mark, linking only to real held places;
- final action index remains the rich action destination.

It must be transparent/lightweight over footage, avoid faces and important type, work on mobile,
and release before the final action-paper locks. Do not build a generic opaque navbar.

### 4. Add useful editorial information rails—not filler

Implement only three fact/action-led rails from `reference/FUNCTIONAL-WEB-LAYER.md`:

- Online Qualifier / August 18–26 / Enter ↗
- Mexico City / December 4–6 / 2026
- 16 Divisions / Third City / First Edition

Each rail appears once, pauses long enough to read, and travels with a meaningful frame or
registration action. They can use restrained ink/rule/edge language, but never become a
permanent scrolling ticker or invented sponsor strip.

### 5. Then make a targeted “syrup and cherry” pass

Do not decorate every beat. Add only the materials that turn open space into intentional website
space: a graphic edge around a contained plate, a measured halftone/ink interruption at a
message or action pause, a physical paper/sticker relationship, or a small metadata label used
as composition. The existing campaign-print assets are the starting kit; create one additional
original asset only if a named moment genuinely needs it.

Prioritize designed places over constant full-screen playback. The reader should encounter:

`film → object → pause/information → expansion or release → film`

not an endless run of footage separated by black.

## Transition vocabulary to distribute selectively

After the flag and utility layer are in, make a short visual sweep. Improve only two additional
high-value seams if they still read as default black dips. Choose by relationship, not by count:

- registration / banner-to-sticker logic;
- a shared aperture or spatial match;
- a real editorial black breath;
- a framed plate expanding or receding;
- a measured crop or diagonal release.

No global transition template. No “every seam gets an effect.”

## Collaboration and delivery

- Claude owns live implementation in `build/`.
- Codex owns independent visual review, texture/material direction, copy/function direction, and
  audit of review-ready recordings. Do not wait for Codex to write boilerplate or test machinery.
- Batch work into reviewable milestones; do not narrate every micro-debug.

## If production pauses

When instructed to pause, read and follow `PAUSE-RESUME-HANDOFF-PROMPT.md`. It overrides the
build order temporarily, records the exact restart state, and prohibits speculative changes until
the user resumes the sprint.
- At each milestone, provide: what changed visually, one or two recordings/contact sheets, any
  real open decision, and the commit. Keep the build moving.

## Definition of done for this sprint

The page has multiple cinematic “places,” not one repeated full-screen video layout; transitions
have a small but unmistakably authored vocabulary; print textures make framing and information
feel physical; visitors can orient and click through; key copy is readable; and the whole
experience remains smooth and reversible on desktop and mobile.
