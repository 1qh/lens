# logs

Per-project round logs. One subdirectory per project.

```
logs/
  <project-name>/
    rounds.md
    recurrence.md
    provider-bias.md
    digest.md
```

## rounds.md per round

- Date
- Mode (single / parallel / full-fresh)
- Persona(s), scope(s), theme(s), stress-tests, variant
- Calibration probes (yes / no)
- Provider(s)
- Severity counts (critical / major / minor; nits dropped)
- Outcomes (fixes / non-goals / limitations / deferred)
- Silent strengths (topics no reviewer raised)
- Notes for next round

## recurrence.md

Format in [recurrence-index](../procedure/recurrence-index.md).

## provider-bias.md per provider per round

- Findings produced
- Confirmed by auditor / disqualified / fabrication-risk
- Audit-pass rate
- Notable bias direction

## digest.md

Round-output digests per [convergence](../procedure/convergence.md).

## Privacy

These logs are private state for the loop driver. Reviewer agents must not have access. If lens is public, logs may still be public because they use topic names not direct project doc quotes. If a project's logs would expose sensitive project content, store locally and gitignore that subdirectory.
