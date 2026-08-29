# WODAPALOOZA MEXICO — V2 IMPLEMENTATION BRIEF

Status: foundation pass
Source baseline: existing Mexico project `main`
Reference system: live Wodapalooza SoCal site

## Objective

Rebuild the Mexico site around the SoCal/Miami family resemblance: the same visual grammar, navigation behavior, page rhythm, typography hierarchy, section breaks, badge language, commerce treatment, and conversion structure. Mexico remains the subject and owns the color, copy, footage, and cultural material.

The V2 build is isolated from the existing V1 worktree. No V1 file is a source of truth for visual decisions unless it is explicitly retained below.

## Page anatomy

1. Persistent top navigation: WZA mark, primary links, menu control, language control, and one current verified action.
2. Hero: Mexico City location/date, event title, short promise, primary CTA, and a controlled flag/fitness image treatment.
3. Benefit rail: repeatable feature items separated by the same graphic markers used in the reference family.
4. Editorial story: Mexico City and the athlete/event point of view.
5. Proof metrics: large numerals and compact labels; only verified Mexico facts.
6. Product / event-equipment module: same card geometry and spacing as the reference, with temporary placeholders until real products are approved.
7. Community / event content module: fitness-forward footage, mosaic, and selected Mexico material.
8. Closing CTA and footer: clear current action, social/contact links, and no obsolete qualifier language.

## Visual system to match

- Black-and-white foundation with high-contrast oversized display type.
- Tight uppercase labels, compact utility copy, thin rules, deliberate whitespace, and strong horizontal section breaks.
- Modular image/card compositions with consistent aspect ratios and crop behavior.
- Small badges, markers, arrows, and repeated separators used as navigation/content punctuation.
- Motion is restrained during the foundation pass: section reveals, sticky image transitions, and light parallax only after the static structure is approved.
- Responsive behavior is part of the design, not a later patch: desktop and mobile get the same hierarchy with intentional reflow.

## Mexico substitutions

- Palette: `#6CC180`, `#35A7DF`, black, and white; green-to-blue gradient used as a controlled signature.
- Spanish-first copy with English available as a secondary language.
- Mexico flag as an intentional opening/identity element.
- Mosaic section retained as a Mexico-specific signature.
- Fitness footage leads the experience; travel/city footage supports the story instead of dominating it.
- Qualifier messaging is removed or replaced with the current verified action.
- No unverified venue, sponsor, pricing, division, or registration claims.

## Placeholder product policy

The product area will preserve the reference layout while awaiting approved imagery. Temporary product cards must be visibly marked `PREVIEW` or `COMING SOON`, use neutral branded imagery, and contain no invented pricing, specifications, inventory, or checkout behavior. Replacing a placeholder must not require a layout rewrite.

## Review gates

### Gate 1 — shell

Navigation, hero, section order, typography scale, rules, badges, CTA hierarchy, responsive behavior, and footer are reviewed before footage choreography.

### Gate 2 — content

Approved Mexico copy, flag, fitness footage, mosaic, metrics, products, and action links are inserted section by section.

### Gate 3 — motion

Parallax, sticky transitions, clip-path reveals, and other effects are added only after Gate 2 passes. Every effect must preserve reverse scrolling, reduced motion, readable text, and a single visible compositor state.

### Gate 4 — handoff

Desktop/mobile review, link audit, media fallback test, reduced-motion test, and Jose review build are completed before additional “spice” is added.
