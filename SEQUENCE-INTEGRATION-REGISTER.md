# Wodapalooza Mexico — Sequence Integration Register

**Purpose:** This is the one short checklist that prevents approved visual work from being lost
between labs, live integration, and review. Read it after `PROJECT-NERVOUS-SYSTEM.md` before
changing a named beat. A study is never discarded merely because work has moved to another beat.

> **Status reset — August 26, 2026:** Entries below preserve source and intent, but their prior
> “integrated,” “live,” or “locked” labels are not current approval for Beats 0–7. Claude is the
> active live-build writer. Resume with the exact opening-to-hoodie audit in
> `PROJECT-NERVOUS-SYSTEM.md`, then log a fresh verified status only after real-browser,
> normal-speed forward/reverse/stopped-scroll review. Do not use this register to restore an old
> implementation or overwrite concurrent work.

## 01 · Opening identity through Beat 2

| Field | Locked decision |
|---|---|
| Review file | `build/angel-cockpit-diagonal-lab.html` — exact source of truth for any future live port |
| Film order | Mexican flag inside giant `WODAPALOOZA / MEXICO CITY` → Ángel → cockpit → kinetic `ARE / YOU / READY?` → black `SUCEDERÁ` aperture carrying Beat 2's night aerial |
| Why it works | No empty handoff; each element transforms into the next, and the opening tells the reader where they are before asking them to continue. |
| Source contract | Flag: `mexico-flag-clean`; city: `px_angel_pullback`; cockpit: `b01_cockpit`; `SUCEDERÁ`: **`b02_aerial` only**. |
| Status | **Integrated and live scroll-scrub restored in `8dd150d`, pending normal-speed review.** Claude must not independently retune Beats 0–2; changes require a named review finding. |
| Never reintroduce | Small opening side metadata, a generic centred-box collapse, isolated `ARE YOU READY?` cards, or Ángel footage inside `SUCEDERÁ`. |

## 02 · Event date into city-as-venue

| Field | Locked decision |
|---|---|
| Review file | `reference/prototypes/proof-constellation-motion.html` |
| Film order | Late film, directly before / within Beat 12: `04 / DECEMBER 4` → `06 / DECEMBER 6` → Zócalo venue reveal → final monument / action. |
| Why it works | The date is not generic event information: it physically opens the same square that changes from empty dusk to active night. |
| Source contract | `b12_zocalo_empty` inside `04`; `b12b_zocalo_full` inside `06`; the study releases into the same Beat 12 sources. The Reforma city clock does **not** belong in this treatment. |
| Status | Approved direction in a standalone lab. Beat 12 remains locked; integrate only in a named later handoff. |
| Never reintroduce | A random skyline inside the date, cryptic `16 / 3 / 1` date numerals, or a city clip chosen merely because it looks attractive. |

## 03 · Functional website system

| Field | Locked decision |
|---|---|
| Reference | `reference/prototypes/kinetic-nav-system.html` and `reference/KINETIC-NAV-AND-MATERIAL-KIT.md` |
| Film order | The transparent kinetic rail locks only after the cockpit owns the frame and releases before the final action index. |
| Contents | Mark/menu, quiet current-place readout, and real `QUALIFIER ↗` escape hatch. |
| Status | Required live layer, but it may not become a generic opaque navbar or a centred promo card. |

## Sequence rule

Work and review in film order. Before making Beat *n*, name Beat *n−1*, Beat *n*, and Beat
*n+1*, then preserve the already-approved source and handoff decisions above. Every live change
must update this register's status, not silently replace a study.

---

## SECOND HALF — BUILT IN THE CANONICAL TRACK (25–26 August)

No prototypes. Every one of these lives in `build/index.html` and was judged there with its real
neighbours, per the canonical-track rule.

| position | device | source material |
|---|---|---|
| 8 → 9 | his handwritten date becomes a window onto Beat 9; printed shutters close over him; the world turns a quarter while the window stays upright and centred | `b08_newspaper.mp4`; SVG text mask calibrated to the ink on the source frame |
| 9 | one scrub carrying four scenes — night platform, rope, barbells, overhead press | `b09_floorwork.mp4` from WP 1 (7.35–9.30, 10.92–13.00) and WP 3 (1.30–3.80) plus `b09_lockout` |
| 9 → 10 | a letterbox hugs the lift and holds, the next scene materialises inside the bars, then they close to become it | `--band` / `--barsink` on `#b9 .stage` |
| 10 | camera tracks past the stands and finds an athlete; the words are cut by the people in front of them | `b10_crowd_focus.mp4` from WP 3 (19.95–22.25, 6.00–7.05, 7.05–8.67) |
| 10 → 11 | two diagonally converging fields, both already playing | two clipped copies of `b11_face.mp4` |

**The occlusion effect is documented as a skill**, not as prose: `/kinetic-type`, copied into the
repo at `reference/skills/kinetic-type.md` with `person-matte.swift` beside it. It carries the
technique and the fourteen ways it was got wrong first. Read it before rebuilding anything that
puts type inside footage.

**Matte provenance:** `media/still/b10_people_matte.png` is a sprite sheet of 141 per-frame person
mattes for base frames 137–277 of `b10_crowd_focus.mp4`, produced locally by macOS Vision. It is a
derivative of found footage — nothing is generated. Regenerate with the Swift tool in the skill
folder; **verify cells against the mattes afterwards**, because a wrong filter graph produces a
sheet that looks plausible and is empty.
