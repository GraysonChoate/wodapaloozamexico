#!/usr/bin/env bash
# perf — scroll the whole film the way a person does and measure whether it is smooth.
#
# Every check in this project so far has sampled a STILL at a fixed scroll position. None of
# them can see jank: a page can pass every one of them and still stutter the whole way down.
# This drives a continuous scroll in a real browser window and records the frame interval for
# every animation frame, plus what the decoders and the network are doing underneath.
#
# NO APOSTROPHES inside the node block.
#
#   perf.sh [url]

set -uo pipefail
PAGE="${1:-http://localhost:4173/index.html}"
CH="$(ls -d "$HOME"/Library/Caches/ms-playwright/chromium-*/chrome-mac*/*.app/Contents/MacOS/* 2>/dev/null | head -1)"
[ -x "$CH" ] || { echo "  no chromium binary"; exit 2; }

NODE_PATH="$HOME/.gl-rig/node_modules" node -e '
const {chromium} = require("playwright-core");
const [CH, PAGE] = process.argv.slice(1);

(async () => {
  const br = await chromium.launch({executablePath: CH, headless: false,
                                    args:["--autoplay-policy=no-user-gesture-required"]});
  for (const [tag, w, h] of [["desktop 1440x900",1440,900],["mobile 375x812",375,812]]) {
    const ctx = await br.newContext({viewport:{width:w, height:h}});
    const p = await ctx.newPage();

    let bytes = 0, requests = 0;
    p.on("response", async r => {
      requests++;
      const len = r.headers()["content-length"];
      if (len) bytes += parseInt(len, 10);
    });

    const t0 = Date.now();
    await p.goto(PAGE, {waitUntil:"load"});
    const loadMs = Date.now() - t0;

    // when does the first beat actually show a decoded frame, not just a poster?
    /* Ask the DOM which beat is first rather than naming one. This was hardcoded to #b1, and
       the day a beat was inserted ahead of it the metric silently began measuring an
       offscreen beat and reported NEVER on a page whose opening frame was in fact decoding
       in a few hundred milliseconds. A gate that names a beat stops being a gate. */
    const liveMs = await p.evaluate(() => new Promise(res => {
      const start = performance.now();
      const tick = () => {
        const pl = document.querySelector(".beat .plate");
        if (pl && pl.classList.contains("ready")) return res(Math.round(performance.now() - start));
        if (performance.now() - start > 15000) return res(-1);
        requestAnimationFrame(tick);
      };
      tick();
    }));

    await p.waitForTimeout(2500);
    const firstViewBytes = bytes, firstViewReq = requests;

    // ---- CONTINUOUS SCROLL, measuring every frame -------------------------
    const result = await p.evaluate(async () => {
      const total = document.documentElement.scrollHeight - innerHeight;
      const frames = [];
      let last = performance.now(), running = true;
      const rec = () => {
        const now = performance.now();
        frames.push(now - last); last = now;
        if (running) requestAnimationFrame(rec);
      };
      requestAnimationFrame(rec);

      // ~12 seconds of steady scrolling from top to bottom, like a real read
      const DURATION = 12000, t0 = performance.now();
      await new Promise(done => {
        const step = () => {
          const k = Math.min(1, (performance.now() - t0) / DURATION);
          window.scrollTo(0, Math.round(total * k));
          if (k < 1) requestAnimationFrame(step); else done();
        };
        step();
      });
      running = false;
      await new Promise(r => setTimeout(r, 100));

      const vids = [...document.querySelectorAll("video")];
      return {
        frames: frames.slice(2),
        videos: vids.length,
        decoded: vids.filter(v => v.readyState >= 2).length,
        playing: vids.filter(v => !v.paused).length,
        docPx: total + innerHeight,
        mem: performance.memory ? Math.round(performance.memory.usedJSHeapSize/1048576) : null
      };
    });

    const f = result.frames.sort((a,b) => a-b);
    const pct = q => f[Math.min(f.length-1, Math.floor(f.length*q))];
    const mean = f.reduce((a,b) => a+b, 0) / f.length;
    const long = f.filter(x => x > 33.4).length;     // missed two 60Hz frames or worse
    const bad  = f.filter(x => x > 50).length;       // visible hitch

    console.log("\n  == " + tag);
    console.log("     page load                " + loadMs + " ms");
    console.log("     first decoded frame      " + (liveMs < 0 ? "NEVER" : liveMs + " ms"));
    console.log("     bytes before scrolling   " + (firstViewBytes/1048576).toFixed(1) + " MB over "
                + firstViewReq + " requests");
    console.log("     total bytes after scroll " + (bytes/1048576).toFixed(1) + " MB over " + requests + " requests");
    console.log("     document height          " + result.docPx.toLocaleString() + " px");
    console.log("     video elements           " + result.videos + " (" + result.decoded + " decoded, "
                + result.playing + " playing)");
    if (result.mem !== null) console.log("     JS heap                  " + result.mem + " MB");
    console.log("     ---- frame intervals over a 12s scroll, " + f.length + " frames");
    console.log("     median                   " + pct(0.50).toFixed(1) + " ms  ("
                + (1000/pct(0.50)).toFixed(0) + " fps)");
    console.log("     95th percentile          " + pct(0.95).toFixed(1) + " ms");
    console.log("     99th percentile          " + pct(0.99).toFixed(1) + " ms");
    console.log("     worst                    " + f[f.length-1].toFixed(1) + " ms");
    console.log("     mean                     " + mean.toFixed(1) + " ms");
    console.log("     frames over 33ms         " + long + "  (" + (long/f.length*100).toFixed(1) + "%)");
    console.log("     frames over 50ms         " + bad  + "  (" + (bad/f.length*100).toFixed(1) + "%)");

    await ctx.close();
  }
  await br.close();
  console.log("");
})();
' "$CH" "$PAGE"
