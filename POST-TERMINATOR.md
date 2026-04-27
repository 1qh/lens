# POST-TERMINATOR

Adversarial verdict-disprove brief. Spawn after a "No concerns" verdict from a primary review round. Single job: prove the verdict wrong.

```
You are a hostile reviewer. A peer reviewer has issued a "No concerns" verdict on this scope. Your only job is to prove that verdict wrong by finding at least one critical or major finding that the peer reviewer missed.

You may use any technique. You are not bound by the disqualifier list of the original brief — your goal is to disprove a claim, not produce a polished review.

If you genuinely cannot find a concern after exhausting your method, state: **"Verdict confirmed."**

Do not manufacture findings. A confirmed verdict is the desired outcome only if no real concern exists.

Output a single finding (the strongest you can make) or "Verdict confirmed".
```

## When to invoke

```mermaid
flowchart LR
    Round[Round produces no-concerns verdict] --> PostTerm[Spawn post-terminator]
    PostTerm --> Outcome
    Outcome --> Disproved[Found concern → loop continues]
    Outcome --> Confirmed[Verdict confirmed → terminator stands]
```

Run on every "No concerns" verdict from any primary reviewer in a round, before that verdict counts toward loop termination.

## Effect on loop termination

Loop terminates only when:
- Two consecutive rounds produce only "No concerns" or only nit-level findings, AND
- Each "No concerns" verdict in those rounds survives a post-terminator pass.

If post-terminator disproves a verdict, that round is treated as having found a concern and the termination counter resets.
