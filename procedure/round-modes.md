# round-modes

Three round tiers. Pick based on doc change scope and recent signal.

```mermaid
flowchart TD
    Trigger[New round trigger] --> Decide{Recent change scope}
    Decide -- "small doc updates" --> Light
    Decide -- "structural change or new ADR" --> Full
    Decide -- "every Nth round, or major decision" --> Deep
    Light --> RunLight[Rule auditor only<br>conditional fact-auditor<br>1 stress test<br>single-scenario premortem rotating]
    Full --> RunFull[Current default brief<br>both auditors<br>2-3 stress tests<br>three-scenario premortem]
    Deep --> RunDeep[Full + adversarial peer + calibration probes + meta-review trigger]
```

## Mode triggers

| Mode | Trigger |
|------|---------|
| Light | Doc-style edits, small content changes, single ADR added, day-to-day cleanup |
| Full | Structural change, new architecture decision, philosophy update, scope expansion |
| Deep | Periodic (every Nth round, e.g., 5), or major design pivot, or recurrence-triggered escalation |

## What each mode includes

- **Light**: BRIEF phases 1-5 plus terminator phase. Rule auditor every primary. Fact auditor only when finding has external claims. One stress test. Single-scenario premortem rotating across rounds (technical → business → regulatory).
- **Full**: BRIEF phases 1-13. Both auditors per primary. Two-three stress tests. Three-scenario premortem. Adversarial peer optional but not required.
- **Deep**: Full plus adversarial full-context peer plus calibration probes inserted plus meta-review of strategy itself afterward.

## Cost vs rigor

```mermaid
flowchart LR
    Light --> Cost1[Lower cost]
    Light --> Rigor1[Sufficient rigor for stable scope]
    Full --> Cost2[Median cost]
    Full --> Rigor2[Default rigor]
    Deep --> Cost3[Higher cost]
    Deep --> Rigor3[Maximum rigor]
```

Light is the default for unchanged or lightly-changed scope. Full when something architectural shifts. Deep on cadence.

## Termination interaction

Termination requires recent rounds at Full or Deep mode minimum. Light-only rounds do not advance the terminator counter alone; one Full or Deep round must confirm the nit-only state.
