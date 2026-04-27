# round-flow

```mermaid
flowchart TD
    Start --> Mode[Choose round mode: single, parallel, or full-fresh]
    Mode --> Prep[Pick persona, scope, theme, stress-tests, variant]
    Prep --> Brief[Compose brief from BRIEF template]
    Brief --> Probes{Insert calibration probes?}
    Probes -- yes --> Insert[Insert into project docs]
    Probes -- no --> Send
    Insert --> Send[Send brief to primary]
    Send --> Reports[Primary returns report]
    Reports --> Audit[Auditor pair verifies]
    Audit --> NC{No-concerns verdict?}
    NC -- yes --> PT[Post-terminator]
    NC -- no --> Merge
    PT --> PTO{Disproved?}
    PTO -- yes --> Merge
    PTO -- no --> Merge
    Merge[Merge confirmed across primaries] --> Remove{Probes inserted?}
    Remove -- yes --> Strip[Remove probes from project docs]
    Remove -- no --> Action
    Strip --> Action
    Action[Apply action discipline + propagation] --> Commit[Commit, hygiene-compliant]
    Commit --> Log[Append round log + recurrence index]
    Log --> Term{Termination check}
    Term --> Continue
    Term --> Terminate
```

## Brief composition checklist

- Persona, scope, theme, stress-tests (2-3), variant filled
- No mention of prior rounds, looping, or fixes coming
- Doc paths accessible to the reviewer agent

## Auditor coupling

Every primary is paired with auditors per [AUDIT](../AUDIT.md). Auditor receives only the primary's report and read-only doc access for that scope. No other reviewer's report. No brief.

## Probe handling

Insert after brief composition, before send. Remove after auditor verdict, before merge. Probe-related findings stripped from merged set. Probe-catch outcome feeds model-fitness signal in [calibration-probes](../libraries/calibration-probes.md), not project findings.
