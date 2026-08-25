# BEAT 8 — SOURCE MATERIAL BRIEF

Prepared by Codex while Beat 5’s perspective-grid prototype is in implementation.
This brief does not change `build/index.html`. It defines the source-first material available
for a later Beat 8 enhancement.

## Source verified

| Item | Detail |
|---|---|
| Current derivative | `build/media/scrub/b08_newspaper.mp4` |
| Original | `QUALIFIER_v3_05.mov` |
| Current selected range | 0.00–11.20 seconds |
| Format | 720×1280, portrait, 30fps |
| Existing narrative | A hooded person uses real newspapers as cue cards, ending on the held date |

The existing source sequence is correct and should remain the primary image. It is not a
background to decorate; the paper performance *is* the message.

## What the footage actually contains

The cards make this sequence in order:

1. `RECUERDA`
2. `EL ONLINE QUALIFIER`
3. `COMIENZA`
4. `ES DEL 18 AL 26 DE AGOSTO`

The last card holds visibly longer than the releases before it. That quiet duration is an
important part of the sequence and must not be consumed by added motion.

Useful real physical characteristics:

- imperfect card alignment and changing skew as the person raises/lowers each sheet;
- black marker over dense newsprint, with printed columns and small registration colour;
- curled lower edges, folds, creases, torn/cut edges, and a loose page falling through frame;
- hands pinching the paper at the top corners;
- a natural cast shadow from paper onto body and street;
- portrait framing that deliberately keeps the face anonymous.

## Direction

The enhancement is **paper as an object**, not a paper texture overlay.

On entry, allow the real card to feel slightly contained and physical: a restrained frame,
short CSS-3D pitch/roll that derives from the sheet’s actual skew, and perhaps a second
source-cropped edge only when it helps establish thickness. It then locks to a complete,
legible card for each phrase.

The final date card must settle rather than keep performing. It should be the counterweight to
Beat 7’s activity and Beat 9’s spatial typography.

## Allowed supporting material

Use only source-derived visual material from this clip:

- a tight crop of a card edge or fold as a transient foreground edge;
- the page’s own newsprint and ink at native appearance;
- real cast shadow under an existing sheet;
- an existing released card moving through the lower frame.

Code-native structural aids remain allowed: a neutral black field, crop mask, subtle box
shadow, frame border, or CSS perspective transform. They must never imitate photographed
lighting.

## Do not do

- Do not put a synthetic paper grain over the viewport.
- Do not make a desktop-style UI stack of cards.
- Do not add translated English type over the Spanish cards.
- Do not colorize the newsprint to green/blue or use magenta/cyan as a page-applied wash.
- Do not crop a card’s message to force full bleed.
- Do not introduce tilt or parallax during the final held date.
- Do not create a fake paper edge, shadow, or tear when the clip supplies a real one.

## Prototype shape after Beat 5 approval

1. Start with the current complete-card behavior as the fallback.
2. Test only the entry of the first two releases: contained physical sheet → exact readable
   lock.
3. Preserve the existing cue-card order and the slow final-date hold.
4. Stop after desktop/mobile, forward/reverse/fast-scroll audit evidence.

Success is a reader feeling that the message was held up in front of them, not that a web card
animated onto a page.
