# Definition of Done (Tracker)

A change is **Done** when all applicable boxes are checked.

## Repo & Docs
- [ ] `/docs/MASTER_TRACKER.md` updated (Status + Next 3)
- [ ] `/docs/LOG.md` entry added (if decision made)
- [ ] Links to issues/PRs included

## Blocks & Schema
- [ ] MDX blocks render locally
- [ ] **Schema is auto-generated from blocks** (no hand JSON-LD)
- [ ] Breadcrumbs + up-links correct

## QC (must be GREEN or explicitly N/A)
- [ ] **InfoGain** met (≥ 30 total via Calculator/Quiz/Table/Dataset)
- [ ] **Evidence** present for claims (whitelisted citations)
- [ ] **Schema ↔ On-page parity** (FAQ/Video only if on page)
- [ ] **Similarity/Cannibalization** under threshold
- [ ] **Link budgets** respected (up-links + 3–5 related; ≤12 body links)

## Accessibility & Perf
- [ ] Axe scan passes (headings order, alt text, labels, contrast)
- [ ] **CWV budgets** on preview: LCP/CLS/INP within targets or WARN noted
- [ ] No blocking console errors

## Interlinking & SEO
- [ ] Related links chosen by scorer (exclude near-dupes)
- [ ] `noindex-until-useful` respected where applicable
- [ ] Sitemaps and IndexNow step documented (if part of the change)

## Monetization / Social (if touched)
- [ ] Ads/affiliates are **off by default** and gated by config
- [ ] Disclosures present when monetization is enabled
- [ ] Social autopost toggles remain disabled unless explicitly enabled

## Review
- [ ] PR small, scoped, and linked to tasks
- [ ] Screenshots/preview URL added
- [ ] Rollback plan obvious (docs-only repos: “revert commit”)
