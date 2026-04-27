# recurrence-index

Cross-round, cross-project tracking of repeated concerns. Signals doc clarity gaps and process gaps.

## What gets indexed

Per concern that appeared in any round:
- Topic (concept-level, not a quote)
- Owning doc
- First-raised round
- Resolution applied (fix / non-goal / limitation / deferred)
- Subsequent rounds where same topic reappeared

## Why

If a topic recurs after a non-goal was added, the non-goal text is not unmissable. The doc must be rewritten until the same fresh-eyes reviewer cannot reach the same concern.

## Index storage

Stored in `lens/logs/<project>/recurrence.md` per project. Append-only.

## Index format

```
## <topic name>

- Owning doc: <doc>
- First raised: <round identifier>
- Initial resolution: <fix / non-goal / limitation / deferred>
- Recurrences: <list of round identifiers where same topic reappeared, with auditor verdicts>
- Action on each recurrence: <doc-clarity rewrite, or escalation>
```

## Trigger for escalation

If a topic recurs three times despite each prior resolution being applied, escalate:
- The topic genuinely needs a different design (not a doc-clarity issue)
- Or the resolution principle itself is wrong

Escalation: spawn a meta-review focused on that topic only.
