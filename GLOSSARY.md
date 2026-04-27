# GLOSSARY

Lens-specific terms used across all docs.

| Term | Meaning |
|------|---------|
| Loop driver | The Claude session that runs lens. Reads this repo, plans rounds, spawns agents, applies action discipline, commits to project repo. |
| Round | One end-to-end review cycle: plan, brief, spawn primaries, audit, post-terminate if needed, merge, action, commit, log, termination check. |
| Slot | One reviewer instance in a parallel round, owning one disjoint scope slice. |
| Primary | A reviewer agent producing findings, briefed from BRIEF. |
| Auditor | A reviewer agent verifying a primary's report. Two flavors: rule-compliance (pass one) and fact-check (pass two). Introduces no new findings. |
| Peer | The adversarial full-context reviewer. One per round. Hunts cross-cutting and long-horizon issues fresh-eyes miss. |
| Post-terminator | Adversarial reviewer spawned after a no-concerns verdict. Tries to disprove the verdict. |
| Meta-reviewer | Reviewer of lens itself. Spawned periodically or on recurrence escalation. |
| Brief | The prompt sent to a reviewer agent. Filled from BRIEF template (or AUDIT, POST-TERMINATOR, META-REVIEW). |
| Finding | A specific concern produced by a reviewer with the per-finding fields. |
| Disqualifier | A rule that drops a finding. See BRIEF Phase 3. |
| Verdict | A reviewer's overall outcome for the round: a list of findings or "No concerns". |
| Confirmed finding | A finding that survived both rule auditor and fact auditor. |
| Fabrication-risk | An auditor verdict on a finding whose evidence cannot be verified. Excludes the producing persona+model next round. |
| Outcome | One of fix / non-goal / known-limitation / deferred-with-trigger. Every confirmed finding lands on exactly one. |
| Non-goal | An explicit "we deliberately chose not to do X" statement in the owning project doc. Defeats future re-raises of the same concern. |
| Known limitation | An accepted bounded trade-off in the owning doc with a revisit trigger. |
| Deferred | A decision postponed with an explicit trigger condition. |
| Defeat-the-non-goal rule | A finding that targets a concern already covered by a non-goal must explicitly defeat the non-goal's argument. Otherwise disqualified. |
| Topic family | A cluster of related concerns (auth, realtime, regulatory, etc). Action discipline propagates within families. |
| Recurrence | A topic raised in multiple rounds. Counted in recurrence index. ≥3 triggers escalation. |
| Round digest | Private loop-driver summary written at end of round. Drives next round's planning. |
| Calibration probe | Deliberate small error inserted into project docs to test reviewer competence. Removed after the round. |
| Fresh-eyes purity | The principle that reviewers must read project docs without prior-round context. Preserved by commit hygiene and never showing reviewer agents lens itself or prior reports. |
| Fact-discipline | The layered enforcement that keeps reviewer findings backed by real evidence. |
| Convergence | The decreasing-findings-per-round trend that ends in termination. |
| Termination | Loop-complete state for current scope. Re-earned on scope extension. |
