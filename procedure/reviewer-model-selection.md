# reviewer-model-selection

Match model to task. Different reviewer roles need different model strengths.

## Matrix

| Role | Model class | Why |
|------|-------------|-----|
| Primary reviewer (broad architecture, principal engineer, premortem) | Heavy reasoning model | Long context, cross-doc reasoning, failure-mode imagination |
| Persona-specific deep dive (compliance lawyer, SRE) | Heavy reasoning model with web access | Domain reasoning + external evidence sourcing |
| Auditor (rule compliance, fabrication detection) | Fast model with strong instruction-following | Mostly checklist application; speed matters |
| Post-terminator (verdict-disprove) | Heavy reasoning model | One-shot adversarial reasoning |
| Meta-review (review the strategy itself) | Heavy reasoning model | Self-reflective process critique |
| Calibration probe checker | Fast model | Deterministic check |
| Adversarial full-context peer | Heavy reasoning model with full context window | Cross-cutting and long-horizon issues |

## Cross-provider rotation still applies

Within each role, rotate provider per round. See cross-provider.md.

## Selection per round

Loop driver picks model + provider per slot from the matrix. Do not use heavy reasoning model for auditor — wastes capability and slows the round.
