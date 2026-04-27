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

## By code module (for code targets)

Group source code into disjoint slices:
- By package or directory tree
- By bounded context or feature area
- By layer (data access, domain logic, transport, infra adapters)
- By criticality (auth + payment + identity vs everything else)

Each slice becomes one reviewer slot with a code-aware persona.

## By concern axis on code

Same code, different lens per slot:
- Bug hunt
- Security audit
- Performance review
- Test coverage gaps
- Resource leaks and lifecycles
- Concurrency correctness
- Error handling completeness
- Observability coverage
- Dependency and supply-chain audit

## Mixed code + docs

Some rounds review a feature's code alongside its describing docs. Drift between the two becomes the finding class. One slot reads only docs; one slot reads only code; auditors compare reports.

## Periodic full-fresh full-scope

Every N partitioned rounds, run one round with a single reviewer covering the entire target, no partition. Catches what disjoint coverage cannot see.
