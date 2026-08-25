# MOTION REFERENCE PLAYBOOK

Shared direction for Codex and Claude. Read this alongside `SUPERPROMPT.md` and
`CLAUDE_HANDOFF.md` before changing the cinematic treatment. It is a direction document,
not permission to add effects everywhere.

## The hierarchy

| Input | It controls |
|---|---|
| Motion references | Motion grammar: frame states, depth, crop, scale, rotation, pacing, release |
| Wodapalooza SoCal | Official-event continuity: compact mark, confirmed facts, action hierarchy |
| Mexico City source material | Image identity: city, paper, stone, stickers, banner ink, athletes, source-native colour |

**Motion references tell us how the experience moves.**

**SoCal tells us how it remains an official Wodapalooza event.**

**Mexico City footage tells us what it looks and feels like.**

Do not merge these into one generic style. Mexico remains a cinematic front door, not a
SoCal-style operational event portal.

## What the references actually contribute

The three supplied recordings were reviewed as motion sequences, including dense 6fps passes:

- **Motion Frame**: abrupt editorial reframing, inversion/rotation, crop changes, impact
  titles, controlled interruption.
- **Sea Serenade**: framed image expanding to full bleed, full bleed collapsing to a card,
  long pushes, calm black holds, scale as pacing.
- **AI Film Studio**: image as an object in a designed viewport, spatial editorial type,
  controlled subject crops, graphic title landing.

The transferable grammar is:

- contained plate → full bleed
- full bleed → contained plate/card
- split/crop window
- restrained perspective tilt, rotate, then lock
- foreground / type / ground planes moving at subtly different rates
- typography behind a source-supported silhouette
- scale-through transition
- black hold and image re-entry
- slow suspension followed by a sharper editorial release
- small metadata as composition, never dashboard clutter
- physical paper, sticker, and card layers

Do not imitate the references' footage, fixed side rails, ecommerce UI, or dark studio
styling. Use their **grammar**, not their surface.

## Current phase: prove depth before decorating

The immediate proof is **Beat 9**, not Beat 2.

`STF00032` contains real optical depth: city and Ángel behind, then the hood/raised fists and
trees in the foreground. Build the Spanish line as spatial typography within that one honest
frame:

- type in front of the city and Ángel
- type behind hood, fists, and source-supported foreground trees
- type in the open sky band where it remains readable
- no broad rotoscoping, fake light, or fabricated scene
- CSS/SVG/CSS 3D first; no Three.js unless CSS demonstrably cannot achieve the approved result

Beat 2's night aerial does **not** support a clean Ángel matte. Its late frames move to office
towers; early monument edges cross lit façades. Do not composite the daylight Ángel into the
night aerial. Beat 2 may later receive type/footage parallax and aperture framing only.

## Enhancement map

Apply a new technique only where it has a specific narrative job.

| Beat | Proposed enhancement | Narrative job |
|---|---|---|
| 1 (conditional) | unused early wide drone shot as a short contained-frame prelude that expands/folds into cockpit | exterior city → interior arrival; only after raw-footage review |
| 2 | `SUCEDERÁ` width/aperture plus subtle type-to-footage parallax | city opens through the word; no monument cutout |
| 5 | nine identity panels arrive as offset perspective planes, register, then collapse through centre to athlete | identity becomes competitor |
| 8 | real newspaper sheets as physical cards: slight angles, overlap, real paper shadow/edge | qualification is a human message, not a UI card |
| 9 | spatial Spanish typography using `STF00032` subject/Ángel/sky layers | belonging becomes embodied |
| 12 | empty Zócalo begins as a contained architectural plate, widens, then hard-replaces with full square | city occupancy revealed, not dissolved |
| 13 | restrained final editorial index on footage-supplied black | official action without breaking the film |

No other beat should receive a new effect until these prove their value.

## Source-first material rules

Textures are not a separate decoration pass and do not require generated imagery or credits.

1. **Harvest real material first.**
   - Beat 6: limestone/stone, banner fabric, real printed halftone and ink.
   - Beat 7: sticker edges, adhesive contact, chipped paint, photographed surfaces.
   - Beat 8: newsprint fibres, folds, handwritten ink, cast shadows.
2. **Use code-native structure where appropriate.**
   Hairlines, crop masks, soft card shadows, frame borders, CSS/SVG halftone, and perspective
   transforms are structural tools, not invented photographic material.
3. **No generated imagery in the core plan.**
   Generated image material is optional only if a genuine source gap is identified and approved.

One dominant image, one supporting material, one graphic action. If a material does not
establish place, increase pressure, clarify identity, or create a pause, remove it.

## Typography and messaging

Typography has three separate jobs:

1. **Messaging accuracy now.** Verify all claims, dates, stats, Spanish, and final URLs against
   research and operator-provided links before locking visual treatments.
2. **Cinematic type during prototypes.** `SUCEDERÁ`, Beat 9 Spanish copy, Beat 12 date, and
   Beat 13 action links are part of the motion system—not labels added afterward.
3. **Final type polish later.** Swap Archivo for Normalidad when the Adobe kit exists; then tune
   line breaks, spacing, metadata, CTA hierarchy, and mobile behavior.

Keep copy sparse. Do not import SoCal's generic festival language such as `THE ULTIMATE
FITNESS EXPERIENCE` or `TEST YOUR LIMITS`.

## SoCal continuity: keep only what is useful

Carry forward:

- compact official mark
- explicit confirmed facts (date, Ciudad de México, qualifier)
- small disciplined utility labels
- clean final action hierarchy

The final action index must use verified Spanish labels and destinations:

- Pre-Registro
- Inscríbete en el Online Qualifier
- Dudas y preguntas, aquí te ayudamos
- Rulebook WZA CDMX

Do not import SoCal's orange UI, permanent nav, sponsor grids, `GET TICKETS`, venue/travel
content, generic typography, or operational pages before those Mexico facts exist.

## Non-negotiables

- Source-native colour stays untouched. Applied UI remains green → blue, black, white, and neutral.
- No artificial grading, fake lighting, or a composite scene that never occurred.
- No outside footage and no generated imagery in the core experience.
- No invented venue, attendance, sponsors, schedule, or event facts.
- Black holds, hard cuts, and quiet beats are intentional; do not soften every transition.
- Scroll must remain smooth, reversible, accessible, and readable at desktop and mobile sizes.

## Prototype approval gate

Approve an enhancement only if:

- it reads as depth before it reads as an effect
- it uses a source-supported silhouette or plane
- it stays legible at 1440×900 and 375×812
- it survives forward, reverse, and fast scrolling
- it has a clean reduced-motion/no-JS fallback
- it creates a reusable grammar for another named beat

Reject/revert if it produces halos, sticker-like mattes, generic texture, degraded type, or
an effect visible only when paused on a screenshot.

## Collaboration sequence

1. Claude builds one isolated prototype from this map.
2. Codex independently reviews it against the approval gate.
3. Only the grammar that survives is reused.
4. Harvest source texture only where the approved treatment needs it.
5. Run the full cross-beat browser audit before introducing additional effects.

The fallback is always the current validated film. Complexity is never itself a reason to ship.
