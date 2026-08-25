#!/usr/bin/env bash
# overflow — no word may be cut off the side of the frame, at ANY width.
#
# Everything else in this project has been checked at exactly two widths, 1440 and 375. A
# layout can survive both and still clip a word at 320, at 414, or on a tablet. This walks
# every beat at twelve widths and fails on three separate things:
#
#   1. the page scrolling sideways at all
#   2. any run of type extending past the left or right edge
#   3. the masked SVG headline measuring wider than the frame it sits in
#
# (3) needs its own path: getBoundingClientRect on text inside an SVG <mask> returns zero,
# because masked content is never painted directly. Measuring it by rect reports success on a
# word that is badly cropped. It is measured with getComputedTextLength instead.
#
# A deliberate marquee is exempt via data-marquee — Beat 7 metadata line is meant to run past
# the frame and is masked at both ends.
#
# NO APOSTROPHES inside the node block.
#
#   overflow.sh [url]

set -uo pipefail
PAGE="${1:-http://localhost:4173/index.html}"
CH="$(ls -d "$HOME"/Library/Caches/ms-playwright/chromium-*/chrome-mac*/*.app/Contents/MacOS/* 2>/dev/null | head -1)"
[ -x "$CH" ] || { echo "  no chromium binary"; exit 2; }

NODE_PATH="$HOME/.gl-rig/node_modules" node -e '
const {chromium} = require("playwright-core");
const [CH, PAGE] = process.argv.slice(1);
const WIDTHS = [
  [320,568,"iPhone SE, smallest still in use"],
  [360,800,"common Android"],
  [375,812,"iPhone mini"],
  [390,844,"iPhone 14"],
  [414,896,"iPhone Plus"],
  [430,932,"iPhone Pro Max"],
  [768,1024,"iPad portrait"],
  [834,1112,"iPad Air"],
  [1024,768,"iPad landscape"],
  [1280,800,"laptop"],
  [1440,900,"desktop"],
  [1920,1080,"large desktop"],
];
let fails = 0;
const bad = m => { console.log("    FAIL  " + m); fails++; };

(async () => {
  const br = await chromium.launch({executablePath: CH, headless: false,
                                    args:["--autoplay-policy=no-user-gesture-required"]});
  for (const [w, h, label] of WIDTHS) {
    const ctx = await br.newContext({viewport:{width:w, height:h}});
    const p = await ctx.newPage();
    await p.goto(PAGE); await p.waitForTimeout(2600);

    const beats = await p.evaluate(() => [...document.querySelectorAll(".beat")].map(b => b.id));
    const problems = [];

    for (const id of beats) {
      // three passes through each beat so type that only appears mid-beat is caught
      for (const f of [0.12, 0.5, 0.9]) {
        await p.evaluate(a => {
          const e = document.getElementById(a.id);
          const tr = Math.max(1, e.offsetHeight - innerHeight);
          window.scrollTo(0, Math.round(e.offsetTop + tr * a.f));
        }, {id, f});
        await p.waitForTimeout(260);

        const found = await p.evaluate(beatId => {
          const out = [];
          const de = document.documentElement;
          if (de.scrollWidth > de.clientWidth + 1)
            out.push({kind:"page", what:"document scrolls sideways",
                      detail: de.scrollWidth + " > " + de.clientWidth});

          // ---- ordinary type -------------------------------------------------
          for (const e of document.querySelectorAll(".hud *, .beat *")) {
            if (e.closest("[data-marquee]")) continue;
            if (e.closest("svg")) continue;
            if (!/^(P|H1|H2|H3|SPAN|B|SMALL|A|LI|DIV)$/.test(e.tagName)) continue;
            const own = [...e.childNodes].some(n => n.nodeType === 3 && n.textContent.trim());
            if (!own) continue;
            const cs = getComputedStyle(e);
            let eff = +cs.opacity;
            for (let n = e.parentElement; n && n !== de; n = n.parentElement) eff *= +getComputedStyle(n).opacity;
            if (eff < 0.06) continue;
            const r = e.getBoundingClientRect();
            if (r.width < 1 || r.bottom < 0 || r.top > innerHeight) continue;
            if (r.left < -1 || r.right > innerWidth + 1)
              out.push({kind:"type", what: (e.className || e.tagName) + " in " + beatId,
                        detail: "x " + Math.round(r.left) + " to " + Math.round(r.right)
                                + " in a " + innerWidth + "px frame",
                        text: e.textContent.trim().slice(0, 42)});
          }

          // ---- masked SVG headline, measured not rect-ed ----------------------
          for (const t of document.querySelectorAll("svg text")) {
            let len = 0;
            try { len = t.getComputedTextLength(); } catch (e) { continue; }
            if (!len) continue;
            const svg = t.closest("svg");
            const box = svg.getBoundingClientRect();
            if (box.width < 1) continue;
            if (len > box.width + 1)
              out.push({kind:"masked",
                        what:"SVG headline in " + ((svg.closest(".beat")||{}).id || beatId),
                        detail: Math.round(len) + "px of type in a " + Math.round(box.width) + "px frame",
                        text: t.textContent.trim().slice(0, 42)});
          }
          return out;
        }, id);

        for (const f2 of found) {
          const key = f2.kind + "|" + f2.what + "|" + (f2.text || "");
          if (!problems.some(x => x.key === key)) problems.push({key, ...f2});
        }
      }
    }

    if (problems.length) {
      console.log("\n  " + w + "x" + h + "  " + label);
      for (const pr of problems)
        bad(pr.what + " — " + pr.detail + (pr.text ? "   [" + pr.text + "]" : ""));
    } else {
      console.log("    ok    " + String(w).padStart(4) + "x" + String(h).padEnd(4)
                  + "  nothing clipped   (" + label + ")");
    }
    await ctx.close();
  }
  await br.close();
  console.log("");
  if (fails) { console.log("  " + fails + " overflow problem(s)"); process.exit(1); }
  console.log("  no word is cut off at any width from 320 to 1920");
})();
' "$CH" "$PAGE"
