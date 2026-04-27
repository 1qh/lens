# logs

Per-project round logs and recurrence indexes. One subdirectory per project.

## Structure

```
logs/
  <project-name>/
    rounds.md
    recurrence.md
    provider-bias.md
```

## rounds.md format

Append per round:

```
## <round identifier>

- Date
- Mode: single / parallel / full-fresh
- Persona(s)
- Scope(s)
- Theme(s)
- Stress-tests applied
- Variant: plain / steel-man / adversarial
- Calibration probes: yes / no
- Provider(s)
- Severity counts: critical / major / minor (nits dropped)
- Outcomes: fixes / non-goals / limitations / deferred
- Silent strengths: topics no reviewer raised
- Notes for next round
```

## recurrence.md format

See procedure/recurrence-index.md.

## provider-bias.md format

Append per provider per round:

```
## <provider> — <round identifier>

- Findings produced
- Findings confirmed by auditor
- Findings disqualified
- Findings flagged fabrication-risk
- Audit-pass rate
- Notable bias direction observed
```

## Privacy

These logs are private project state for the loop driver. They are stored in lens (this repo), not in the project repo. Reviewer agents must not be given access to lens.

If lens is public, logs may still be public — they reveal loop existence but do not name specific findings in a way that anchors a future reviewer (recurrence index uses topic names, not direct quotes from project docs).

If a project's loop logs would reveal sensitive project content, store them locally and gitignore that subdirectory in lens.
