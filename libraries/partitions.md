# partitions

Partition schemes for [parallel-coverage](../procedure/parallel-coverage.md). Pick one scheme per parallel round. Rotate across rounds.

## By doc category

Group the project's doc surface into disjoint slices by topic. Each slice becomes one reviewer slot. Typical slices for a project with ADRs:
- Foundations (philosophy, stack, architecture)
- Conventions (API, events, glossary)
- Operations (dev, deploy, observability, security)
- Decisions, sub-grouped by domain (meta, backend, mobile, geo, architecture, infra, product)

## By concern axis (cross-cutting)

Same docs, different lens per slot:
- Contradictions across all docs
- SSOT violations
- Missing-content gaps
- Cost realism
- Regulatory exposure
- Failure-mode imagination
- Doc-style violations of the project's philosophy

Cross-cutting partitions rotate the lens, not the surface.

## Periodic full-fresh full-scope

Every N partitioned rounds, run one round with a single reviewer covering the entire doc set, no partition. Catches what disjoint coverage cannot see.
