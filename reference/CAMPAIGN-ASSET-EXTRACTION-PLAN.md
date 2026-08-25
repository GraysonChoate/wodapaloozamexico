# Campaign Asset Extraction Plan — v1

This plan creates a compact set of **source-derived** components. They are for selected
editorial pauses and boundaries, not a visual treatment placed over the entire film.

## Component set

| Component | Primary source | What it preserves | Intended role | Do not use it as |
|---|---|---|---|---|
| `poster-object` | `STF00130.jpg` | Full wrinkled campaign poster, human installation, stone context | A contained campaign-print interruption or chapter threshold | Flat recreated artwork or a generic background |
| `poster-dot-field` | `STF00130.jpg` lower-left poster region | Actual hot-pink dot halftone, dark printed ground, fold/wrinkle | A small edge/boundary detail beside an editorial action | A global magenta texture |
| `poster-cyan-stroke` | `STF00125.jpg` / `STF00130.jpg` central poster region | Real cyan `SUCEDERÁ EN CDMX` brush/print relationship | A photographic crop or transition glimpse only | Editable typography or a clean vector brush |
| `banner-breath` | `LONA_0198.mov`, later stable frame selection | Printed fabric flexing in wind, grommeted edge, masonry/steps | One moving material detail near a transition | A decorative looping background |
| `sticker-contact-blue` | `STICKERS_03_V1.mov`, blue painted-wall section | Black mark mounted on actual cyan/blue paint | Street-installation threshold / proof that the mark inhabits the city | A recoloured page panel |
| `sticker-contact-red` | `STICKERS_03_V1.mov`, red painted-wall section | White mark, red painted surface, imperfect black stroke | Brief contrasting street detail | Generic red UI or a permanent card |
| `sticker-contact-pole` | `STICKERS_03_V1.mov`, white pole section | Chipped pole paint, adhesive edge, street depth | Physical release into or out of the street beat | A fake distressed filter |
| `paper-performance` | `QUALIFIER_v3_05.mov` | Handwriting, real release, curl, shadow | Beat 8 only; already active | Texture applied to other elements |
| `stone-geometry` | `STF00125.jpg` / Beat 6 | Black masonry blocks, pale limestone arch, stair geometry | Quiet structural frame or an architectural pause | Endless concrete grain |
| `official-mark` | `assets/logos/artes/logo_WZA.ai` | Clean official sign/mark | Clear identity and final action index | A decorative repeated watermark |

## Extraction rules

1. Extract **photographic crops**, not invented transparent cutouts. Poster lettering and
   cyan brush forms are perspective-distorted by the real installation; preserve that
   physicality or do not use them.
2. Each output receives its source and intended destination in its filename/metadata.
3. Do not recolour any crop to fit the interface; source-native colour stays source-native.
4. Keep the clean vector official mark separate from photographed marks.
5. The clean high-resolution master of the full composite campaign artwork is still missing.
   Do not manufacture landmark cutouts, full poster layouts, or editable paint marks until
   the original is found in Drive or supplied by the operator.

## First implementation candidates

These are prototypes after the whole-film rhythm review, not immediate blanket additions:

1. **Street → message threshold (Beat 7 → Beat 8):** a restrained sticker-contact or
   poster-object transition creates a physical editorial place before the quiet paper beat.
2. **One chapter orientation plate:** a contained poster-object against black, holding a
   short factual line, then releasing to footage. This is the clearest way to make the
   experience feel like a website destination rather than uninterrupted film.
3. **Final action index:** official clean mark + restrained source-derived material boundary
   on footage-supplied black; four real actions with time to read and choose.

## v1 component output

The first source-derived components now live in `reference/material-components/v1/`. Their
exact sources, crop provenance, and restrictions are recorded in that folder’s `README.md`.
They are review assets, not permission to add them to the active build.

## Deliberate exclusions

- No fake paper sheet behind every caption.
- No global grain/noise layer.
- No generic magenta gradients or cyan paint effects in CSS.
- No sticker/paper/card stack that pretends to be physical without a source reason.
- No graphic layer over Beat 2, Beat 5, Beat 9, or Beat 12; their motion treatments already
  have a specific job and need breathing room.
