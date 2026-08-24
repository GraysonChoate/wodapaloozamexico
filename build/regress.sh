#!/usr/bin/env bash
# regress — everything that must still be true before another beat is added.
#
# Run this after every beat. The failures this catches are the ones that stayed invisible
# for a whole build: a scrub that never ran because the dev server could not serve byte
# ranges, a poster that never lifted because the video it covered was never asked to paint,
# a page whose beats never advanced because the scroll event does not fire here at all.
#
#   ./regress.sh [port]

set -uo pipefail
PORT="${1:-4173}"
URL="http://localhost:$PORT/index.html"
SKILL="$HOME/.claude/skills/motion-site/scripts"
HERE="$(cd "$(dirname "$0")" && pwd)"
fails=0

hdr(){ printf '\n\033[1m  %s\033[0m\n' "$1"; }

curl -sf -o /dev/null "$URL" || {
  echo "  nothing served at $URL"
  echo "  start it with:  python3 $HERE/serve.py $PORT"
  exit 2; }

# The dev server MUST speak HTTP Range or no video can be scrubbed at all. This is the single
# highest-value line in the file: without it every other check passes on a page that is
# frozen on its first frame.
hdr "0 · the server can serve byte ranges"
CODE="$(curl -s -o /dev/null -w '%{http_code}' -r 0-99 "http://localhost:$PORT/media/scrub/b01_cockpit.mp4")"
if [ "$CODE" = "206" ]; then echo "    ok  206 Partial Content"
else echo "  FAIL  got $CODE, not 206 — seeking is impossible, scrubbing will silently do nothing"; fails=$((fails+1)); fi

hdr "1 · source rules"
bash "$SKILL/check.sh" "$HERE/index.html" || fails=$((fails+1))

hdr "2 · behaviour in a real browser"
bash "$SKILL/scrub-audit.sh" "$URL" || fails=$((fails+1))

hdr "3 · interface legibility over the footage"
bash "$SKILL/contrast.sh" "$URL" || fails=$((fails+1))

printf '\n'
if [ "$fails" -eq 0 ]; then
  echo "  LOCKED · every gate green"
else
  echo "  $fails gate(s) failed — do not build the next beat on this"
  exit 1
fi
