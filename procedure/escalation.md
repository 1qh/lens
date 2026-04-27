# escalation

```mermaid
flowchart TD
    Topic[Topic recurs across rounds] --> Count{Recurrence count}
    Count -- "≤ 2" --> Clarity[Rewrite resolution in owning doc until unmissable]
    Count -- "≥ 3" --> Meta[Auto-escalate: spawn meta-review on this topic]
    Meta --> Outcomes
    Outcomes --> Stronger[Stronger non-goal with sharper argument]
    Outcomes --> Redesign[Re-open the original design decision]
    Outcomes --> ProcessFix[Fix lens if the resolution principle is wrong]
```

## Why

Three recurrences despite prior resolutions means one of: the resolution principle is wrong, the doc text is unclear, or lens has a structural gap. Auto-escalation prevents wasted rounds.

## Procedure

1. Detect recurrence ≥ 3 for a topic.
2. Spawn meta-reviewer focused only on that topic's resolution path across rounds.
3. Apply outcome with action discipline.
4. Reset counter for the topic.

## Counter rules

Successful resolution clears the counter. New genuine recurrence after reset starts at one. Counter is per topic per project, not global.
