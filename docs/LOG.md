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

## 2025-10-07 — Matrix v1 locked
- **Decision:** Use v1 baseline
- **Context:** Unblock DSL work
- **Outcome:** Start gen of ev_tco_v1 + quiz v1
- **Links:** /matrix/content_generation_matrix.csv

## 2025-10-07 — MDX components path fixed
- **Decision:** Moved mdx-components.tsx to apps/site/ root per Next docs; removed 'use client'
- **Context:** MDX runs without server/client context conflicts; page renders
- **Outcome:** Proceeding to QC gates + DB interlinker + DSL
- **Links:** Dev: <your Codespaces URL>/articles/nub-theory-explained

## 2025-10-07 — Schema applied + DB seeded
- **Decision:** Ran schema.sql in Studio; seeded tenant+pages from JSON pack
- **Context:** Site now DB-first with JSON fallback
- **Outcome:** Next: Quiz DSL scaffold + Admin seed page
- **Links:** Table Editor: tenants/pages; Seed script: packages/db/seed.cjs

## 2025-10-07 — Tenant spec pack + CI blockers
- **Decision:** Added per-tenant packs (quiz/calc) with by-key renderers; added QC-in-CI workflow
- **Context:** MDX can drop <QuizByKey> / <CalculatorByKey>; CI blocks merges if QC fails
- **Outcome:** Next: front-matter sync + more pack specs; Remotion stub
- **Links:** packs under apps/site/src/packs; .github/workflows/qc.yml

## 2025-10-07 — Platform repo pushed
- **Decision:** Initialized badass-platform, added QC workflow, packs, admin seeder
- **Context:** CI will run QC; tenant pack + DB interlinker live
- **Outcome:** Next: Remotion video stub + social autopost webhooks
- **Links:** Repo: https://github.com/cg216/badass-platform
