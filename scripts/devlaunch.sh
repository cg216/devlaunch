#!/usr/bin/env bash
set -euo pipefail
TRACKER="docs/MASTER_TRACKER.md"; LOGFILE="docs/LOG.md"
usage(){ cat <<'HLP'
devlaunch.sh — tracker helper
Commands:
  status   --sprint N --tenant SLUG --done "A, B" --doing "C, D" --next "E;F;G" --blockers "none" --link URL
  check    "Exact checklist line"    # toggles - [ ] ↔ - [x] in Status block
  next3    "item1;item2;item3"       # replaces Next 3 block
  log      "Title" "Decision" "Context" "Outcome" "Links"
  show
HLP
}
require_handles(){
  grep -q "<!--STATUS_START-->" "$TRACKER" || { echo "Add STATUS_START/END markers to $TRACKER"; exit 1; }
  grep -q "<!--NEXT3_START-->" "$TRACKER"   || { echo "Add NEXT3_START/END markers to $TRACKER"; exit 1; }
}
cmd="${1:-}"; shift || true
case "$cmd" in
  status)
    require_handles
    SPRINT=""; TENANT=""; DONE=""; DOING=""; NEXT=""; BLOCKERS=""; LINK=""
    while [[ $# -gt 0 ]]; do
      case "$1" in
        --sprint) SPRINT="$2"; shift 2;;
        --tenant) TENANT="$2"; shift 2;;
        --done) DONE="$2"; shift 2;;
        --doing) DOING="$2"; shift 2;;
        --next) NEXT="$2"; shift 2;;
        --blockers) BLOCKERS="$2"; shift 2;;
        --link) LINK="$2"; shift 2;;
        *) echo "Unknown flag $1"; usage; exit 1;;
      esac
    done
    cat > /tmp/status_snippet.txt <<EOF
[STATUS]
Sprint: ${SPRINT}
Tenant: ${TENANT}
Done: ${DONE}
Doing: ${DOING}
Next: $(echo "${NEXT}" | tr ';' ', ')
Blockers: ${BLOCKERS}
Link: ${LINK}
EOF
    echo "Wrote /tmp/status_snippet.txt"
    ;;
  check)
    require_handles
    ITEM="${1:-}"; [[ -z "$ITEM" ]] && { echo "Usage: $0 check \"Exact checklist line\""; exit 1; }
    awk -v item="$ITEM" '
      /<!--STATUS_START-->/ {inblock=1}
      inblock && $0 ~ "- \\[ \\] "item { sub("- \\[ \\] "item, "- [x] "item) }
      inblock && $0 ~ "- \\[x\\] "item { sub("- \\[x\\] "item, "- [ ] "item) }
      {print}
      /<!--STATUS_END-->/ {inblock=0}
    ' "$TRACKER" > "$TRACKER.tmp" && mv "$TRACKER.tmp" "$TRACKER"
    ;;
  next3)
    require_handles
    IFS=';' read -r I1 I2 I3 <<< "${1:-;;}"
    awk -v a="$I1" -v b="$I2" -v c="$I3" '
      /<!--NEXT3_START-->/ {print; print "1) "a; print "2) "b; print "3) "c; skip=1; next}
      /<!--NEXT3_END-->/ {print; skip=0; next}
      skip==0 {print}
    ' "$TRACKER" > "$TRACKER.tmp" && mv "$TRACKER.tmp" "$TRACKER"
    ;;
  log)
    TITLE="${1:-}"; DEC="${2:-}"; CTX="${3:-}"; OUT="${4:-}"; LINKS="${5:-}"
    DATE=$(date +%F)
    {
      echo ""
      echo "## ${DATE} — ${TITLE}"
      echo "- **Decision:** ${DEC}"
      [[ -n "$CTX" ]] && echo "- **Context:** ${CTX}"
      [[ -n "$OUT" ]] && echo "- **Outcome:** ${OUT}"
      [[ -n "$LINKS" ]] && echo "- **Links:** ${LINKS}"
    } >> "$LOGFILE"
    echo "Appended to $LOGFILE"
    ;;
  show)
    require_handles
    awk '/<!--STATUS_START-->/, /<!--STATUS_END-->/{print} /<!--NEXT3_START-->/, /<!--NEXT3_END-->/{print}' "$TRACKER"
    ;;
  *) usage; [[ -z "$cmd" ]] && exit 0 || exit 1;;
esac
