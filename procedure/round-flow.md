# round-flow

End-to-end flow for one review round.

```mermaid
flowchart TD
    Start --> Choose[Choose round mode]
    Choose --> Single[Single reviewer, depth]
    Choose --> Parallel[Parallel partitioned, breadth]
    Choose --> FullFresh[Full-fresh full-scope]

    Single --> Prep1[Pick persona, scope, theme, stress-tests, variant]
    Parallel --> Prep2[Pick partition scheme; assign persona+theme+stress-tests per slot]
    FullFresh --> Prep3[Pick persona; full doc set scope]

    Prep1 --> Brief
    Prep2 --> Brief
    Prep3 --> Brief

    Brief --> CalibCheck{Insert calibration probes?}
    CalibCheck -- yes --> InsertProbes[Insert probes into project docs]
    CalibCheck -- no --> SendBrief
    InsertProbes --> SendBrief

    SendBrief[Send brief to primary reviewer agent]
    SendBrief --> PrimaryReport[Receive primary report]
    PrimaryReport --> AuditPair[Send to auditor agent]
    AuditPair --> AuditReport[Receive auditor verdict per finding]

    AuditReport --> NoConcernsCheck{Primary returned no-concerns verdict?}
    NoConcernsCheck -- yes --> PostTerm[Spawn post-terminator]
    NoConcernsCheck -- no --> Merge

    PostTerm --> PTOutcome{Post-terminator}
    PTOutcome --> Disproved[Disproved → treat as concern, continue]
    PTOutcome --> Confirmed[Verdict confirmed → record nit-only round]

    Disproved --> Merge
    Confirmed --> Merge
    Merge[Merge confirmed findings across all primaries]

    Merge --> RemoveProbes{Probes inserted?}
    RemoveProbes -- yes --> Restore[Remove probes from project docs]
    RemoveProbes -- no --> Action
    Restore --> Action

    Action[Apply action discipline per finding]
    Action --> Commit[Commit with normal hygiene-compliant messages]
    Commit --> Log[Append round log + recurrence index]
    Log --> NextDecide{Termination check}
    NextDecide --> ContinueLoop[Continue]
    NextDecide --> Terminate[Loop complete]
```

## Brief composition checklist

Before sending any brief:
- Persona filled in
- Scope filled in
- Theme filled in
- Stress-tests filled in (2-3)
- Variant chosen (plain / steel-man-first / adversarial-framing)
- No mention of prior rounds anywhere in brief
- No mention of looping anywhere in brief
- Doc paths in scope are accessible to the reviewer agent

## Auditor coupling

Every primary reviewer in a round is paired one-to-one with an auditor. Auditor receives only:
- The primary's full report
- Read-only access to the same scope of project docs the primary reviewed

Auditor does not receive any other reviewer's report. Auditor does not receive the brief that produced the primary report.

## Probe handling

If probes were inserted:
- Insertion happens after writing the brief, before sending
- Removal happens after auditor verdict received, before merging
- Probe-related "findings" are stripped from the merged finding set
- Probe-catch result feeds into model-fitness signal, not project findings
