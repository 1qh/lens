# PHILOSOPHY

Why the loop works. What it must preserve.

## Principles

```mermaid
mindmap
  root((lens))
    Fresh-eyes purity
      Each round zero context
      Reviewer never sees prior rounds
      Reviewer never sees this repo
    Action discipline
      Every concern resolves
      No silent ignore
      Same concern never raised twice
    Adversarial sharpness
      Compensation framing
      Disqualifier list
      Banned vague phrases
      Anti-fabrication
    Non-overlap and breadth
      Parallel partitioned coverage
      Auditor pass per primary
      Cross-provider for blind-spot fix
    Self-evolution
      Strategy meta-review periodically
      Recurrence index drives doc clarity
      Calibration probes test reviewer fitness
    Doc style
      Visualize first
      Bullet second
      Prose ≤ 2 sentences
      Concept names only, no code specifics
      No numbering anywhere
      Mermaid render-safe on GitHub no br tags
```

## Decision filter for any change to lens itself

```mermaid
flowchart TD
    A[Proposed change] --> B{Preserves fresh-eyes purity?}
    B -- no --> X[Reject]
    B -- yes --> C{Strengthens action discipline?}
    C -- no --> D{Strengthens adversarial sharpness?}
    D -- no --> E{Strengthens coverage breadth?}
    E -- no --> F{Strengthens self-evolution?}
    F -- no --> X
    F -- yes --> Y[Accept]
    E -- yes --> Y
    D -- yes --> Y
    C -- yes --> Y
```

## Inviolable rules

- Reviewer agents must never see this repo. Loop driver only.
- Every confirmed finding resolves into fix, non-goal, known-limitation, or deferred-with-trigger. No silent skip.
- Same concern is never re-litigated. If it recurs, the doc clarity failed; rewrite the doc, do not re-debate.
- Commit messages and project docs never reveal loop awareness.
- "No concerns" is a respected outcome. Manufactured findings are forbidden.

## Self-application

This repo's own docs are subject to lens. Periodic strategy meta-reviews evaluate the strategy itself.
