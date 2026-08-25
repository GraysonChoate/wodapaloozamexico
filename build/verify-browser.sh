#!/usr/bin/env bash
# verify-browser — drive the film in a REAL browser window and report what it actually did.
#
# This exists because two other environments lie about this page, both silently:
#
#   * the embedded preview pane never fires scroll events (scrollY moved 0 to 6037 with zero
#     events) and never starts media playback, though play() resolves and pause() is never
#     called. Both look exactly like page bugs.
#   * headless Chromium composites differently and will not present frames for an occluded
#     video, so a poster handoff can appear broken when it is fine.
#
# So: headed Chromium, a real window with a real compositor. Nothing here is asserted from
# the preview pane or from a headless run.
#
# NO APOSTROPHES inside the node block. It is a single-quoted shell string.
#
#   verify-browser.sh [url]

set -uo pipefail
PAGE="${1:-http://localhost:4173/index.html}"
CH="$(ls -d "$HOME"/Library/Caches/ms-playwright/chromium-*/chrome-mac*/*.app/Contents/MacOS/* 2>/dev/null | head -1)"
[ -x "$CH" ] || { echo "  no chromium binary found"; exit 2; }
SHOTS="${SHOTS:-$(cd "$(dirname "$0")" && pwd)/.verify-shots}"
mkdir -p "$SHOTS"

NODE_PATH="$HOME/.gl-rig/node_modules" node -e '
const {chromium} = require("playwright-core");
const [CH, PAGE, SHOTS] = process.argv.slice(1);
let fails = 0;
const bad = m => { console.log("    FAIL  " + m); fails++; };
const ok  = m => console.log("      ok  " + m);

const snap = () => ({
  y: Math.round(scrollY),
  alt: (document.getElementById("metres") || {}).textContent,
  beats: [...document.querySelectorAll(".beat")].map(b => {
    /* Find the VIDEO, then its plate. A beat can hold several plates — Beat 9 has a still
       plate and a cut plate, still one first — so reading the first reported a decoded beat
       as stuck on its poster. This file had its own copy of this read and its own copy of
       the bug; that duplication is the real defect and is noted in CLAUDE_HANDOFF.md. */
    const v = b.hasAttribute("data-src")
      ? (b.querySelector(".plate video") || b.querySelector("video")) : null;
    const plate = v ? v.closest(".plate") : b.querySelector(".plate");
    return {
      id: b.id,
      p: +(+getComputedStyle(b).getPropertyValue("--p")).toFixed(3),
      near: b.getBoundingClientRect().top < innerHeight * 2.5,
      live: plate ? plate.classList.contains("ready") : null,
      t: v ? +v.currentTime.toFixed(3) : null
    };
  }),
  panels: [...document.querySelectorAll(".sheet video")].map(v => ({
    paused: v.paused, t: +v.currentTime.toFixed(2), rate: +v.playbackRate.toFixed(2),
    dur: +(v.duration || 0).toFixed(2)
  }))
});

(async () => {
  const br = await chromium.launch({executablePath: CH, headless: false,
                                    args:["--autoplay-policy=no-user-gesture-required"]});
  const uaCheck = await (async () => {
    const p = await br.newPage(); const ua = await p.evaluate(() => navigator.userAgent);
    await p.close(); return /Headless/.test(ua);
  })();
  console.log("  browser: " + (uaCheck ? "HEADLESS (this report is NOT valid)" : "headed Chromium, real window"));

  for (const [tag, w, h] of [["1440x900", 1440, 900], ["375x812", 375, 812]]) {
    console.log("\n  == " + tag);
    const p = await br.newPage({viewport:{width:w, height:h}});
    await p.goto(PAGE);
    await p.waitForTimeout(3600);

    // ---- FIRST LOAD, NEVER SCROLLED -------------------------------------
    const rest = await p.evaluate(snap);
    await p.screenshot({path: `${SHOTS}/${tag}_00_firstload.png`});
    // media loads on approach, so only beats within reach are expected to be decoded here
    const poster = rest.beats.filter(b => b.near && b.live === false);
    if (poster.length) bad("first load, never scrolled: " + poster.map(b=>b.id).join(", ")
                           + " still on the poster, no frame decoded");
    else ok("first load, never scrolled: every beat within reach shows a decoded frame");
    if (rest.y !== 0) bad("page did not start at the top (y=" + rest.y + ")");

    // ---- DOWN-SCROLL ----------------------------------------------------
    const total = await p.evaluate(() => document.documentElement.scrollHeight - innerHeight);
    const down = [];
    for (let i = 1; i <= 12; i++) {
      await p.evaluate(y => window.scrollTo(0, y), Math.round(total * i / 12));
      await p.waitForTimeout(560);
      down.push(await p.evaluate(snap));
    }
    await p.screenshot({path: `${SHOTS}/${tag}_01_middown.png`});
    let regress = 0;
    for (const b of rest.beats) {
      const series = [rest, ...down].map(s => s.beats.find(x => x.id === b.id));
      for (let i = 1; i < series.length; i++)
        if (series[i].p + 0.002 < series[i-1].p) regress++;
    }
    if (regress) bad("beat progress went BACKWARDS " + regress + " time(s) while scrolling down");
    else ok("down-scroll: every beat advanced monotonically");
    const alts = [rest, ...down].map(s => s.alt);
    ok("altimeter: " + alts[0] + " -> " + alts[Math.floor(alts.length/2)] + " -> " + alts[alts.length-1]);

    // ---- MEDIA SEEK ------------------------------------------------------
    for (const b of rest.beats) {
      const series = [rest, ...down].map(s => s.beats.find(x => x.id === b.id));
      if (series[0].t === null) continue;
      const moved = Math.max(...series.map(s=>s.t)) - Math.min(...series.map(s=>s.t));
      if (moved < 0.15) bad(b.id + " playhead moved only " + moved.toFixed(3) + "s across the page");
      else ok(b.id + " playhead seeks with scroll (" + moved.toFixed(2) + "s of range used)");
    }

    // ---- LOOPING PANELS (playback, not seek) -----------------------------
    const b5 = await p.evaluate(() => {
      const e = document.getElementById("b5");
      return e ? {top: e.offsetTop, tr: e.offsetHeight - innerHeight} : null;
    });
    if (b5) {
      await p.evaluate(o => window.scrollTo(0, Math.round(o.top + o.tr * 0.62)), b5);
      await p.waitForTimeout(1400);
      const a = await p.evaluate(snap);
      await p.waitForTimeout(1800);
      const c = await p.evaluate(snap);
      await p.screenshot({path: `${SHOTS}/${tag}_02_contactsheet.png`});
      /* A looping panel can WRAP inside the sample window, which makes the raw delta
         negative and reads as "not playing". One clip here is 5.5s against 12s for the
         rest, so it wraps often. Add the duration back when the playhead has gone round. */
      const advanced = c.panels.map((v,i) => {
        let d = v.t - a.panels[i].t;
        if (d < 0) d += (v.dur || 0);
        return +d.toFixed(2);
      });
      const stuck = advanced.filter(x => x < 0.4).length;
      if (!c.panels.length) bad("no looping panels found");
      else if (stuck) bad(stuck + " of " + c.panels.length + " panels are not playing");
      else ok("all " + c.panels.length + " panels playing; advance over 1.8s: "
              + Math.min(...advanced) + "s to " + Math.max(...advanced) + "s (rates deliberately uneven)");
    }

    // ---- STOPPED STATE ----------------------------------------------------
    const held = await p.evaluate(snap);
    await p.waitForTimeout(2600);
    const held2 = await p.evaluate(snap);
    const drift = held2.beats.filter((b,i) => b.t !== null && Math.abs(b.t - held.beats[i].t) > 0.02);
    const pdrift = held2.beats.filter((b,i) => Math.abs(b.p - held.beats[i].p) > 0.002);
    if (pdrift.length) bad("stopped state drifts: " + pdrift.map(b=>b.id).join(", "));
    else if (drift.length) bad("stopped state: playhead drifts on " + drift.map(b=>b.id).join(", "));
    else ok("stopped state holds: scrubbed playheads and beat progress both static for 2.6s");

    // ---- UP-SCROLL --------------------------------------------------------
    for (let i = 11; i >= 0; i--) {
      await p.evaluate(y => window.scrollTo(0, y), Math.round(total * i / 12));
      await p.waitForTimeout(320);
    }
    await p.waitForTimeout(900);
    const back = await p.evaluate(snap);
    await p.screenshot({path: `${SHOTS}/${tag}_03_backtotop.png`});
    const notReset = back.beats.filter((b,i) => Math.abs(b.p - rest.beats[i].p) > 0.02);
    if (notReset.length) bad("up-scroll did not reset: " + notReset.map(b=>b.id+" p="+b.p).join(", "));
    else ok("up-scroll: every beat returned to its start state");
    const tReset = back.beats.filter((b,i) => b.t !== null && Math.abs(b.t - rest.beats[i].t) > 0.12);
    if (tReset.length) bad("up-scroll: playheads did not return: " + tReset.map(b=>b.id+" t="+b.t).join(", "));
    else ok("up-scroll: every scrubbed playhead returned");
    if (back.alt !== rest.alt) bad("altimeter did not return (" + back.alt + " vs " + rest.alt + ")");
    else ok("altimeter returned to " + back.alt);

    await p.close();
  }

  // ---- NO JAVASCRIPT ------------------------------------------------------
  console.log("\n  == degraded states (headed)");
  const c1 = await br.newContext({viewport:{width:1440,height:900}, javaScriptEnabled:false});
  const p1 = await c1.newPage(); await p1.goto(PAGE); await p1.waitForTimeout(2200);
  await p1.screenshot({path: `${SHOTS}/nojs.png`});
  const nojs = await p1.evaluate(() => {
    const imgs = [...document.querySelectorAll(".plate img, .cell img")];
    const posters = [...document.querySelectorAll("video[poster]")];
    return { imgs: imgs.length, loaded: imgs.filter(i => i.complete && i.naturalWidth > 0).length,
             posters: posters.length, h: document.documentElement.scrollHeight };
  });
  if (nojs.loaded < nojs.imgs) bad("no-JS: only " + nojs.loaded + "/" + nojs.imgs + " images rendered");
  else ok("no-JS: " + nojs.loaded + "/" + nojs.imgs + " images plus " + nojs.posters
          + " video posters render; page is " + nojs.h + "px and readable");
  await c1.close();

  // ---- REDUCED MOTION -----------------------------------------------------
  const c2 = await br.newContext({viewport:{width:1440,height:900}, reducedMotion:"reduce"});
  const p2 = await c2.newPage(); await p2.goto(PAGE); await p2.waitForTimeout(2600);
  await p2.screenshot({path: `${SHOTS}/reducedmotion.png`});
  const rm = await p2.evaluate(() => ({
    screens: +(document.documentElement.scrollHeight / innerHeight).toFixed(1),
    beats: document.querySelectorAll(".beat").length,
    hidden: [...document.querySelectorAll(".stage")].filter(s => +getComputedStyle(s).opacity < 0.9).length
  }));
  if (rm.screens > rm.beats + 0.6) bad("reduced-motion spans " + rm.screens + " screens for " + rm.beats + " beats");
  else ok("reduced-motion: " + rm.screens + " screens for " + rm.beats + " beats, tracks collapsed");
  if (rm.hidden) bad(rm.hidden + " stage(s) invisible under reduced-motion");
  else ok("reduced-motion: every stage visible");
  await c2.close();

  await br.close();
  console.log("\n  screenshots: " + SHOTS);
  if (fails) { console.log("  " + fails + " FAIL"); process.exit(1); }
  console.log("  VERIFIED IN A REAL BROWSER WINDOW at 1440x900 and 375x812");
})();
' "$CH" "$PAGE" "$SHOTS"
