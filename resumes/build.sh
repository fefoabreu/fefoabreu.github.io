#!/bin/bash
# Regenerate every resume PDF from its HTML source.
#
#   ../resume-<slug>.pdf              -> published by the site (clean URLs, no %20)
#   ./Fernando Abreu - <Name>.pdf     -> local copies to attach to applications (gitignored)
#
# Usage:  ./resumes/build.sh   (from the repo root, or anywhere)

set -euo pipefail
cd "$(dirname "$0")"

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

# slug -> pretty download name (keep in sync with the picker in index.html)
render() {
  local slug="$1" pretty="$2"
  "$CHROME" --headless --disable-gpu --no-pdf-header-footer \
    --print-to-pdf="../resume-$slug.pdf" "file://$PWD/resume-$slug.html" 2>/dev/null
  cp "../resume-$slug.pdf" "./Fernando Abreu - $pretty.pdf"
  local pages
  pages=$(python3 -c "d=open('../resume-$slug.pdf','rb').read(); print(d.count(b'/Type /Page')-d.count(b'/Type /Pages'))")
  echo "  resume-$slug.pdf — $pages pages"
  [ "$pages" = "2" ] || echo "  !! expected 2 pages — content is overflowing, check the layout"
}

echo "Building resumes..."
render sr-tech-pm              "Sr Tech PM Applied-AI"
render people-manager          "Practice Leader People Manager"
render partner-commercial-lead "Partner Commercial Lead"

# No HTML source for the internal version — just mirror the published PDF.
cp ../resume-internal-microsoft.pdf "./Fernando Abreu - Microsoft Internal.pdf"
echo "  resume-internal-microsoft.pdf — copied (no HTML source)"

echo "Done."
