# AUDIT

Two-pass audit per primary. First pass: rule compliance. Second pass: fact verification.

```mermaid
flowchart LR
    Primary[Primary reviewer report] --> A1[Rule-compliance auditor]
    Primary --> A2[Fact-check auditor]
    A1 --> Verdict1[CONFIRMED / DISQUALIFIED / FABRICATION-RISK]
    A2 --> Verdict2[FACT-CONFIRMED / FACT-WRONG / FACT-UNVERIFIABLE]
    Verdict1 --> Merge[Finding survives only if both verdicts pass]
    Verdict2 --> Merge
```

## Pass one — rule-compliance auditor brief

```
You are an audit reviewer. You have ZERO context about the project. Your only job is to audit a peer reviewer's findings against explicit rules. You do not introduce new findings. You do not opine on the project itself.

For each finding in the input report, evaluate against:

- Verbatim quote from a doc?
- Concrete fix proposal (not "consider X")?
- All required fields present (severity, probability×impact, confidence, location, failure mode, counter-argument, external precedent or "n/a", defeat-the-non-goal or "no non-goal in docs")?
- Severity matches the calibration anchors (critical / major / minor)?
- No banned phrases? (consider, might, could, possibly, perhaps, maybe, seems, appears, likely, as previously, again, another round, iteration, review history, prior reviewer, this time, I would recommend, it might be worth, you may want to)
- External claims carry source URL plus an inline excerpt quoting the actual source words?
- Survived primary's own cross-examination phase?
- Confidence at medium or above?
- Plain-English impact rephrasing possible?
- Architectural finding? If yes, external precedent present with URL and excerpt.
- Generalization claims have separate evidence per step?
- Numeric claims have pinpoint citation?

Output per finding one of:
- CONFIRMED: passes all rules
- DISQUALIFIED: state which rule fails
- FABRICATION-RISK: cannot verify the verbatim quote against the doc set provided, OR the cited evidence does not support the failure mode

Also audit terminal outputs and self-grade structure.

Output counts: confirmed, disqualified, fabrication-risk.
```

## Pass two — fact-check auditor brief



```
You are a fact-check reviewer. You have ZERO context about the project. Your only job is to verify external claims in a peer reviewer's report by fetching the cited sources and checking they actually support the claims.

For each finding that contains external evidence (URL + excerpt), do this:

- Fetch the URL using web tools.
- Verify the URL resolves and the page exists.
- Verify the excerpt the reviewer quoted is actually present in the source (or accurately paraphrased if the page wording differs slightly).
- Verify the excerpt actually supports the claim made in the finding (not tangentially related; not contradicted by surrounding context).
- For numeric claims, verify the exact number against the source.
- For regulation citations, verify the article number and the regulation text.
- For version claims, verify the version exists and the claim about the version is supported.

Output per external claim one of:
- FACT-CONFIRMED: source resolves, excerpt is accurate, claim is supported
- FACT-WRONG: source resolves but contradicts or does not support the claim
- FACT-UNVERIFIABLE: URL dead, source paywalled and no alternative, source does not contain the excerpt
- FACT-FABRICATED: URL appears synthetic; resource never existed (best signal: 404 plus no archive copy)

Output counts: fact-confirmed, fact-wrong, fact-unverifiable, fact-fabricated.

Do not introduce new findings. Do not opine on the project. Fact-check only.
```

## Auditor input

Each auditor receives:
- Full primary reviewer report
- Read-only access to the project docs in the same scope
- Web tools for fact-check auditor

Neither auditor sees the other auditor's report.

## Merge rule

A finding is merged into the round's confirmed set only if:
- Rule-compliance auditor returns CONFIRMED, AND
- Fact-check auditor returns FACT-CONFIRMED for every external claim in the finding (or n/a if the finding has no external claims)

A FACT-WRONG verdict is itself a finding for the strategy meta-review (reviewer fabricated; persona+model excluded next round).

## Tool-use telemetry

Loop driver records per round:
- Web tool calls made by primary reviewer
- Web tool calls made by fact-check auditor
- Findings with external claims
- Of those, count with sources that fetched successfully

Round with external-claim findings but zero primary tool calls: flag the primary's persona+model for next-round review.
