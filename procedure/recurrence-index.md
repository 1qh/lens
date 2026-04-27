# recurrence-index

Cross-round tracking of repeated concerns. Recurrence after a resolution = doc clarity failure.

## What gets indexed

Per topic that appeared in any round:
- Topic name (concept-level, not a quote)
- Owning doc
- First-raised round
- Resolution applied
- Subsequent rounds where the same topic reappeared

Stored append-only in `lens/logs/<project>/recurrence.md`.

## Format

```
## <topic name>

- Owning doc: <doc>
- First raised: <round id>
- Initial resolution: <fix / non-goal / limitation / deferred>
- Recurrences: <list of round ids with auditor verdicts>
- Action on each: <doc-clarity rewrite or escalation>
```

## Escalation

Recurrence ≥ 3 triggers meta-review on that topic. See [escalation](escalation.md).
