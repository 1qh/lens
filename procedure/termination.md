# termination

When the loop on a project stops.

## Signal

```mermaid
flowchart LR
    Round[Round produces zero non-nit findings]
    Round --> NoConcerns{All "No concerns" verdicts survived post-terminator?}
    NoConcerns -- yes --> Counter[Increment terminator counter]
    NoConcerns -- no --> Reset[Counter resets to zero]
    Counter --> Check{Counter ≥ 2?}
    Check -- yes --> Provider{Verdicts span ≥ 2 providers?}
    Check -- no --> Continue[Continue loop]
    Provider -- yes --> Terminate[Loop complete]
    Provider -- no --> Continue
    Reset --> Continue
```

## Conditions for termination

All required:
- Two consecutive rounds produce only "No concerns" or only nit-level findings
- Each "No concerns" verdict in those rounds survived its post-terminator pass
- Verdicts span at least two model providers
- The most recent calibration probe (if used in either of the terminating rounds) was caught by reviewers — model is competent

If any condition fails, counter resets and loop continues.

## After termination

The doc set is declared self-defending for the current scope.

If scope is later extended (new ADRs, new features, new docs), termination must be re-earned for the new scope.

Termination is not permanent. Periodic verification rounds (e.g., quarterly) re-test the doc set against fresh reviewers. If new concerns surface, loop resumes.
