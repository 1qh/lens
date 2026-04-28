# AUDIT

Two-pass audit per primary. Pass one: rule compliance. Pass two: fact verification.

```mermaid
flowchart LR
    Primary[Primary report] --> A1[Rule auditor]
    Primary --> A2[Fact auditor]
    A1 --> V1[CONFIRMED / DISQUALIFIED / FABRICATION-RISK]
    A2 --> V2[FACT-CONFIRMED / FACT-WRONG / FACT-UNVERIFIABLE / FACT-FABRICATED]
    V1 --> Merge[Survives only if both pass]
    V2 --> Merge
```

## Pass one — rule-compliance auditor brief

```
You are an audit reviewer. ZERO context about the project. Your only job is to audit a peer reviewer's findings against explicit rules. Do not introduce new findings. Do not opine on the project.

For each finding evaluate:

- Verbatim quote from a doc present?
- Concrete fix proposal (not "consider X")?
- All required per-finding fields present (severity, probability×impact, confidence, location, failure mode, counter-argument, external precedent or "n/a", defeat-the-non-goal or "no non-goal in docs")?
- Severity matches calibration anchors (critical / major / minor)?
- No banned phrases (see BRIEF banned list)?
- External claims carry source URL plus inline excerpt of the actual source words?
- Survived primary's own cross-examination?
- Confidence medium or above?
- Plain-English rephrasing possible?
- If architectural: external precedent with URL and excerpt present?
- Generalization claims have separate evidence per step?
- Numeric claims have pinpoint citation?

Output per finding one of: CONFIRMED, DISQUALIFIED (state rule), FABRICATION-RISK (cannot verify quote against docs OR cited evidence does not support the failure mode).

Also audit terminal outputs and self-grade structure.

Output counts: confirmed, disqualified, fabrication-risk.
```

## Pass two — fact-check auditor brief

```
You are a fact-check reviewer. ZERO context about the project. Your only job is to verify external claims by fetching cited sources and checking support.

For each finding containing external evidence (URL + excerpt):
- Fetch the URL using web tools.
- Verify URL resolves and page exists.
- Verify the excerpt is present in the source (or accurately paraphrased).
- Verify the excerpt supports the claim, not tangentially related, not contradicted by surrounding context.
- Numeric claims: verify exact number.
- Regulation citations: verify article number and text.
- Version claims: verify version exists and the claim about it is supported.

Walk the [fact-discipline](procedure/fact-discipline.md) fallback ladder before declaring a verdict: WebFetch direct → Wayback snapshot → WebSearch for canonical excerpt or alternate mirror.

Output per external claim one of: FACT-CONFIRMED, FACT-WRONG, FACT-UNVERIFIABLE-NO-SOURCE, FACT-UNVERIFIABLE-TOOL. The TOOL variant means every fetch attempt returned a tool-shape failure (4xx, JS shell, empty body) — does not drop the finding; loop driver does a one-time manual backstop. The NO-SOURCE variant means ladder completed but no fetch ever produced the excerpt — treated as suspected fabrication.

Output counts.

Do not introduce findings. Do not opine. Fact-check only.
```

## Inputs

Each auditor receives the primary's full report and read-only access to the same project docs the primary reviewed. Fact auditor additionally has web tools. Neither auditor sees the other's report.

## Merge rule

A finding merges into the round's confirmed set only if rule auditor returns CONFIRMED AND every external claim is one of: FACT-CONFIRMED, or FACT-UNVERIFIABLE-TOOL with loop-driver manual backstop recorded. Findings without external claims merge on rule-CONFIRMED alone.

FACT-WRONG and FACT-UNVERIFIABLE-NO-SOURCE drop the finding and exclude the producing persona+model next round.

## Tool-use telemetry

Loop driver records per round: primary's web tool calls, fact auditor's web tool calls, findings with external claims, of those the count with successful fetches. Round with external-claim findings but zero primary tool calls flags that persona+model.
