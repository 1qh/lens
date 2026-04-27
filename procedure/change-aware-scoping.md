# change-aware-scoping

Default scope is docs changed since last round plus a small audit slice of unchanged docs. Full-coverage rounds run periodically.

```mermaid
flowchart TD
    Round[New round] --> Mode{Round mode}
    Mode -- light --> Changed[Changed docs since last round]
    Changed --> AuditSlice[Plus 1-2 unchanged docs as audit slice rotated]
    AuditSlice --> Scope1[Scope = small focused subset]
    Mode -- full --> ChangedFull[All docs touched since last full round]
    ChangedFull --> Scope2[Scope = larger subset]
    Mode -- deep --> All[All docs]
    All --> Scope3[Scope = full coverage]
```

## Why

Most rounds review docs that have not changed. Token spend without finding signal. Re-running the same review on unchanged content is waste.

## Audit slice

Even in light mode, include 1-2 unchanged docs rotated each round as a sanity audit slice. Catches drift in stable docs and prevents stale areas from going dark.

## Periodic full coverage

Regardless of changes, run a full-coverage round every Nth round (e.g., 10). Cross-cutting issues that only show with full picture surface here.

## Tracking

Loop driver tracks per round which docs were in scope. Recurrence index gains a "scope coverage" dimension to detect any doc that has not been reviewed in N rounds — flag for next round.
