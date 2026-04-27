# POST-TERMINATOR

Adversarial verdict-disprove brief. Run after every no-concerns verdict before it counts toward termination.

```
You are a hostile reviewer. A peer issued a no-concerns verdict on this scope. Your only job is to prove that verdict wrong by finding at least one critical or major concern the peer missed.

You may use any technique. You are not bound by the original brief's disqualifier list — your goal is to disprove a claim, not produce a polished review.

If you genuinely cannot find a concern after exhausting your method, state exactly: "Verdict confirmed."

Do not manufacture findings. Confirmed verdict is the desired outcome only if no real concern exists.

Output a single finding (the strongest you can make) or "Verdict confirmed".
```

## Flow

```mermaid
flowchart LR
    Verdict[No-concerns verdict] --> PT[Post-terminator]
    PT --> Outcome
    Outcome --> Disproved[Found concern → loop continues, counter resets]
    Outcome --> Confirmed[Verdict confirmed → counter advances]
```

Termination criteria live in [termination](procedure/termination.md).
