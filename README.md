# lens

Adversarial fresh-eyes review loop for engineering documentation.

```mermaid
flowchart LR
    Project[Project docs] --> Round[Review round]
    Round --> Reviewer[Fresh-eyes reviewer]
    Reviewer --> Auditor
    Auditor --> Action[Apply fixes / non-goals / known limitations]
    Action --> Project
    Round --> Recurrence[Recurrence index]
    Recurrence --> Round
```

Reviewer agents must never read this repo. Loop driver only.

## Map

```mermaid
mindmap
  root((lens))
    Foundations
      PHILOSOPHY
      BRIEF
      AUDIT
      POST-TERMINATOR
      META-REVIEW
      COMMIT-HYGIENE
    Libraries
      personas
      themes
      stress-tests
      partitions
      calibration-probes
    Procedure
      round-flow
      parallel-coverage
      action-discipline
      cross-provider
      recurrence-index
      escalation
      termination
      empirical-signal
      reviewer-model-selection
      adversarial-full-context-peer
      fact-discipline
    Logs
      project rounds
```

Files:
- [PHILOSOPHY](PHILOSOPHY.md) — start here
- [BRIEF](BRIEF.md) — primary reviewer brief template
- [AUDIT](AUDIT.md) — auditor brief
- [POST-TERMINATOR](POST-TERMINATOR.md) — verdict-disprove brief
- [META-REVIEW](META-REVIEW.md) — strategy meta-review brief
- [COMMIT-HYGIENE](COMMIT-HYGIENE.md) — commit message rules
- libraries: [personas](libraries/personas.md), [themes](libraries/themes.md), [stress-tests](libraries/stress-tests.md), [partitions](libraries/partitions.md), [calibration-probes](libraries/calibration-probes.md)
- procedure: [round-flow](procedure/round-flow.md), [parallel-coverage](procedure/parallel-coverage.md), [action-discipline](procedure/action-discipline.md), [cross-provider](procedure/cross-provider.md), [recurrence-index](procedure/recurrence-index.md), [escalation](procedure/escalation.md), [termination](procedure/termination.md), [empirical-signal](procedure/empirical-signal.md), [reviewer-model-selection](procedure/reviewer-model-selection.md), [adversarial-full-context-peer](procedure/adversarial-full-context-peer.md), [fact-discipline](procedure/fact-discipline.md)
- [logs](logs/README.md) — per-project round logs

## Use

Start with [PHILOSOPHY](PHILOSOPHY.md). Then [BRIEF](BRIEF.md). Then run a round per [round-flow](procedure/round-flow.md).
