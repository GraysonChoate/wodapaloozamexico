# Kinetic Navigation + Material Kit

## Purpose

This is the functional layer that keeps the film legible as a website. It is a compact rail that adapts to the moving image beneath it; it is **not** a conventional opaque navigation bar and it is never a second piece of copy competing with a scene.

## Navigation contract

- Left: `W / MENU` opens a small editorial index.
- Center: current place readout, one place at a time (`01 / ARRIVAL`, `02 / QUALIFIER`, and so on).
- Right: persistent live `QUALIFIER ↗` link to `https://competitioncorner.net/events/21707/details`.
- The rail uses difference/inversion against footage and paper, plus a thin rule. It moves in with the opening system; it does not pop in as a UI layer.
- The rail hides before the final action/index destination so that destination owns its own space.
- On mobile, retain the mark/menu and qualifier action; suppress only the redundant center readout.
- `MENU` must open actual usable index destinations, not decorative labels. Do not build a conventional hamburger drawer.

## Reusable prototype

`reference/prototypes/kinetic-nav-system.html` is a working implementation reference. It demonstrates the rail through four environments, an openable editorial index, changing place readout, a real qualifier destination, contrast adaptation, and its release at the action surface.

It is a component reference only. Integrate its behavior and visual contract into the live film deliberately; do not iframe or paste its placeholder stages into `build/index.html`.

## New materials

### `authored-materials/v2/kinetic-frame-corners-01.png`

Use as a moving frame edge, a diagonal reveal support, or a texture object that enters and exits with footage. The center is deliberately quiet; it should frame an image or black void, never become wallpaper.

### `authored-materials/v2/editorial-rail-field-02.png`

Use once per editorial rail, proof fact, sponsor/partner information strip, or quiet action surface. Its center is intentionally clear enough for real copy. Keep it contained to a rail or page object; it is not a full-screen background.

## Hard exclusions

- No fake sponsor logo wall, ticker, or meaningless information noise.
- No duplicate functional CTA inside the opening scene.
- No generic solid navbar, oversized glass pill, or unrelated floating controls.
- No blanket texture overlays on client video.
- No dead black space: black can be a composed surface only when an object, word aperture, active rule, or incoming material gives it purpose.
