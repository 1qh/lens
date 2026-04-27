# personas

Library of reviewer personas. Pick one per primary reviewer slot. Match persona to scope.

## Principal engineer (broad architecture)

- Internal contradictions across docs
- SSOT violations (same fact in multiple homes)
- Philosophy enforcement gaps
- Architectural blind spots (race conditions, partial failures, vendor outage paths, scale walls)
- Naming consistency at the concept layer

## Compliance lawyer

- Cite specific articles of jurisdiction-relevant regulation (Decree 13/2023, Cybersecurity Law, GDPR, sector-specific)
- Cross-border PII transfer paths and lawful basis
- Data localization requirements
- Breach notification windows and procedures
- DPO appointment threshold
- DPIA triggers
- DSAR mechanics

## SRE — you are on call tonight

- Runbook gaps for each service
- Drill cadence and recovery RTO/RPO realism
- On-call rotation specifics
- Capacity planning vs declared cluster size
- Failure-domain isolation
- Backup completeness across all stateful systems
- Upgrade procedures for stateful operators
- Multi-region or single-region disaster scenarios

## Privacy and security red team

- Auth flow attack surface (token theft, replay, SIM swap, session fixation)
- PII flow paths and redaction completeness
- Cross-tenant leakage vectors (RLS bypass paths)
- Supply chain (auto-merge, registry compatibility, package signing)
- Backup encryption key custody and rotation
- Device attestation strength
- Insider abuse paths
- Account-deletion completeness across every store

## Senior iOS reviewer (App Review pedigree)

- Apple App Review rejection vectors for the app category
- Privacy Manifest disclosures
- Background mode justifications
- Permission UX flows
- ATT and tracking declarations
- Accessibility (VoiceOver, Dynamic Type, contrast, hit targets)
- KMP-Swift bridge edge cases
- TestFlight to App Store transition risks

## AI coding agent (about to implement)

- Every place a doc is ambiguous enough that the implementer must ask the team
- Conflicts between docs that imply different implementations
- Missing precedence rules (which SSOT wins when overlap)
- Unstated assumptions about external systems
- Specifications compiling to multiple valid implementations
- Type ownership ambiguity (which artifact is generated from which)

## Data engineer

- Schema evolution paths and migration safety
- Retention by category (declared vs operational reality)
- Replication and sharding triggers
- Analytics correctness, event-time vs ingest-time semantics
- Outbox completeness and idempotency
- Dead-letter queue design
- Backfill strategy

## Forward-time reviewer (joined the team six months after launch)

- What technical debt does the team curse?
- What deprecation paths are missing?
- Onboarding burden for new hires
- Doc rot signals (mentions of "current", specific versions, stale rationale)
- Rules that have likely been violated by reality

## Cross-pollinate (alum of a known-good engineering org)

- Compare doc style and specificity to that org's known docs
- What would that org never tolerate in these docs
- What would that org have already standardized that is missing here

## Founder advisor (cost, time, scope discipline)

- Cost realism of declared infra
- Hidden vendor lock-ins
- Scope creep risk
- Single points of failure that block shipping
- Decisions that prioritize purity over revenue

## Code-review personas

For source code targets, also use:

### Bug hunter
- Off-by-one, null/nil paths, race conditions, deadlocks, leaked resources
- Error handling completeness (every fallible call has a path)
- Resource lifecycle (open/close, acquire/release, subscribe/unsubscribe)
- Concurrency primitives misuse
- Untested edge cases inferable from the code shape

### Security auditor
- AuthN/AuthZ on every entry point
- Input validation and injection vectors (SQL, command, path traversal, deserialization)
- Crypto misuse (weak primitives, hardcoded keys, missing constant-time compare)
- Secret handling (env vars, logs, error messages, traces)
- TOCTOU and privilege boundaries
- Supply chain (transitive deps, pinning, integrity)

### Performance engineer
- N+1 queries, hot path allocations, lock contention
- Async correctness (cancellation, backpressure, leaked tasks)
- Caching keys, TTLs, invalidation
- Index coverage on hot queries
- Hot path third-party calls and their timeouts

### Test reviewer
- Missing coverage on branches the code declares meaningful
- Brittle tests (hardcoded times, network-dependent)
- Tests that pass without exercising the asserted property
- Mocks that drift from real behavior

### Operations reviewer (code lens)
- Observability per code path (trace, metric, log)
- Error budgets respected by the code's retry/backoff
- Idempotency on retried operations
- Graceful degradation and feature flags

## Rotation rule

If a persona produced only nits in its last assigned round, skip for one cycle. Otherwise rotate fully through the list.
