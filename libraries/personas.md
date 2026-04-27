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

## Rotation rule

If a persona produced only nits in its last assigned round, skip for one cycle. Otherwise rotate fully through the list.
