# parallel-coverage

```mermaid
flowchart LR
    Round[Round start] --> Partition[Pick partition scheme]
    Partition --> Slots[Assign persona + theme + stress-tests per slot]
    Slots --> R1[Reviewer 1, topic A]
    Slots --> Rn[Reviewer N, topic N]
    R1 --> A1[Auditor pair]
    Rn --> An[Auditor pair]
    A1 --> Merge[Merge confirmed across slots]
    An --> Merge
    Merge --> Root[Root-cause merge]
    Root --> Apply
```

Partition schemes in [partitions](../libraries/partitions.md). Auditor pair = rule + fact, see [AUDIT](../AUDIT.md).

## Rules

- Disjoint scope per primary; each owns a non-overlapping slice.
- Auditor verifies primary stayed in slice; out-of-slice findings dropped.
- Cross-cutting docs (PHILOSOPHY, README, GLOSSARY) referenced by all but owned by exactly one per round; ownership rotates.
- Slot count uncapped; constraint is meaningful disjoint scope per slot. Splitting a doc across slots forbidden.
- Different providers across slots in the same round (see [cross-provider](cross-provider.md)).
- One slot every round is the [adversarial full-context peer](adversarial-full-context-peer.md), auditor-paired like any primary.
