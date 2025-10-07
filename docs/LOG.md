# Decisions & Notes Log (append-only)

> Keep entries **reverse-chronological** (newest at top). One paragraph per item unless it’s a major ADR.

## 2025-10-07 — Agreed pipeline overview + no CWV unpublish
- **Decision:** Keep CWV as warn/throttle only. Never auto-unpublish.
- **Context:** We want stability while still nudging fixes.
- **Outcome:** QC gates remain: InfoGain, Evidence, Schema parity, Similarity, Links, A11y. CWV -> WARN.
- **Owner:** @cg216
- **Links:** [/docs/MASTER_TRACKER.md](../docs/MASTER_TRACKER.md)

## 2025-10-07 — Content Matrix v1 accepted
- **Decision:** Use matrix v1 (calc/quiz/table variants; InfoGain ≥ 30).
- **Outcome:** Begin Sprint 1 work on Calculator DSL + Quiz DSL.
- **Owner:** @cg216
- **Links:** /matrix/content_generation_matrix.csv

---

### TEMPLATE (copy/paste for new entries)
## YYYY-MM-DD — <Short decision title>
- **Decision:** <what we chose>
- **Context:** <why; options considered>
- **Outcome:** <what changes now>
- **Owner:** @cg216
- **Links:** <PR/issue/commit/MD>
