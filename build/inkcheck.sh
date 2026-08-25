#!/usr/bin/env bash
# inkcheck — contrast for type sitting on a PRINTED ground, measured in real pixels.
#
# contrast.sh cannot see this failure and never will. It reads getComputedStyle
# backgroundColor and walks up for the first opaque one. On the campaign-print surfaces the
# background is an IMAGE — paper tooth, halftone clusters, ink geometry, registration marks —
# so the computed colour is `rgba(0,0,0,0)` all the way up and the gate happily measures dark
# type against whatever solid sits behind the picture. It reported every label on the action
# index as passing while "Próximamente" was sitting at 1.85:1 on a magenta halftone.
#
# This screenshots the real page, samples the actual pixels in a band around each run of type,
# and flattens the ink by its effective opacity before comparing. Opacity matters: muting a
# row with `opacity:.5` does not dim it against black, it drags it TOWARD the paper, which is
# exactly how a "disabled" row became the least readable thing on the sheet.
#
# It only looks at type whose ancestry actually carries a background-image, so it stays cheap
# and says nothing about the film, which contrast.sh already covers properly.
#
# NO APOSTROPHES inside the node block.
#
#   inkcheck.sh [url]

set -uo pipefail
PAGE="${1:-http://localhost:4173/index.html}"
CH="$(ls -d "$HOME"/Library/Caches/ms-playwright/chromium-*/chrome-mac*/*.app/Contents/MacOS/* 2>/dev/null | head -1)"
[ -x "$CH" ] || { echo "  no chromium binary"; exit 2; }

NODE_PATH="$HOME/.gl-rig/node_modules" node -e '
const {chromium} = require("playwright-core");
const [CH, PAGE] = process.argv.slice(1);

const srgb = c => { c/=255; return c<=0.03928 ? c/12.92 : Math.pow((c+0.055)/1.055,2.4); };
const lum  = (r,g,b) => 0.2126*srgb(r)+0.7152*srgb(g)+0.0722*srgb(b);
const ratio = (a,b) => { const L1=Math.max(a,b), L2=Math.min(a,b); return (L1+0.05)/(L2+0.05); };

(async () => {
  const br = await chromium.launch({executablePath: CH, headless: false});
  let fails = 0, checked = 0;

  for (const [tag,w,h] of [["desktop",1440,900],["mobile",375,812]]) {
    const ctx = await br.newContext({viewport:{width:w, height:h}});
    const p = await ctx.newPage();
    await p.goto(PAGE, {waitUntil:"load"});
    await p.waitForTimeout(2400);
    // the printed surfaces live at the end of the film
    await p.evaluate(() => window.scrollTo(0, document.documentElement.scrollHeight));
    await p.waitForTimeout(1400);

    const targets = await p.evaluate(() => {
      const hasPrintedGround = el => {
        for (let n = el; n && n !== document.documentElement; n = n.parentElement)
          if (getComputedStyle(n).backgroundImage !== "none") return true;
        return false;
      };
      const out = [];
      for (const el of document.querySelectorAll("p,span,a,strong,i,b,small,h1,h2,h3,li,div")) {
        const own = [...el.childNodes].some(n => n.nodeType === 3 && n.textContent.trim());
        if (!own) continue;
        if (!hasPrintedGround(el)) continue;
        const r = el.getBoundingClientRect();
        if (r.width < 2 || r.height < 2) continue;
        if (r.bottom < 0 || r.top > innerHeight) continue;
        const cs = getComputedStyle(el);
        let eff = +cs.opacity;
        for (let n = el.parentElement; n && n !== document.documentElement; n = n.parentElement)
          eff *= +getComputedStyle(n).opacity;
        if (eff < 0.06) continue;
        const size = parseFloat(cs.fontSize), weight = +cs.fontWeight || 400;
        const large = size >= 24 || (size >= 18.66 && weight >= 700);
        out.push({ text: el.textContent.trim().slice(0,34),
                   x:Math.round(r.x), y:Math.round(r.y), w:Math.round(r.width), h:Math.round(r.height),
                   color: cs.color, eff, need: large ? 3.0 : 4.5 });
      }
      return out;
    });

    const shot = await p.screenshot();
    const b64 = shot.toString("base64");
    const sampled = await p.evaluate(async (a) => {
      const img = new Image();
      await new Promise(r => { img.onload = r; img.src = "data:image/png;base64," + a.b64; });
      const c = document.createElement("canvas");
      c.width = img.width; c.height = img.height;
      const g = c.getContext("2d"); g.drawImage(img, 0, 0);
      const sc = img.width / innerWidth;
      const L = (r,gg,b) => { const s = v => { v/=255; return v<=0.03928 ? v/12.92 : Math.pow((v+0.055)/1.055,2.4); };
                              return 0.2126*s(r)+0.7152*s(gg)+0.0722*s(b); };
      return a.targets.map(t => {
        const pad = 3;
        const x = Math.max(0, Math.round((t.x - pad) * sc)), y = Math.max(0, Math.round((t.y - pad) * sc));
        const ww = Math.min(c.width - x, Math.round((t.w + pad*2) * sc));
        const hh = Math.min(c.height - y, Math.round((t.h + pad*2) * sc));
        if (ww < 1 || hh < 1) return {...t, meanL: null};
        const d = g.getImageData(x, y, ww, hh).data;
        let sum = 0, n = 0;
        for (let i=0;i<d.length;i+=4){ sum += L(d[i],d[i+1],d[i+2]); n++; }
        return {...t, meanL: sum/n};
      });
    }, {b64, targets});

    console.log("\n  == " + tag + " " + w + "x" + h);
    for (const r of sampled) {
      if (r.meanL === null) continue;
      const m = /rgba?\(([^)]+)\)/.exec(r.color); if (!m) continue;
      const [cr,cg,cb] = m[1].split(",").map(Number);
      const ink = lum(cr,cg,cb);
      const inkEff = ink + (r.meanL - ink) * (1 - r.eff);
      const rr = ratio(inkEff, r.meanL);
      checked++;
      if (rr < r.need) {
        fails++;
        console.log("    LOW   " + rr.toFixed(2) + ":1 (needs " + r.need + ")  ["
                    + r.text + "]  ink " + r.color + " at opacity " + r.eff.toFixed(2));
      }
    }
    if (!sampled.some(r => r.meanL !== null)) console.log("    (no type on a printed ground here)");
    await ctx.close();
  }

  await br.close();
  console.log("");
  if (fails) { console.log("  " + fails + " run(s) of type below their floor on a printed ground"); process.exit(1); }
  console.log("  all " + checked + " runs of type on a printed ground clear their floor");
})();
' "$CH" "$PAGE"
