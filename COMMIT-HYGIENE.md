# COMMIT-HYGIENE

Commit message rules for both project repos and lens itself. Preserves fresh-eyes purity.

## Banned in commit messages

- "round N" / "review round" / "reviewer round"
- "fixing reviewer concerns"
- "addressing review feedback"
- "from review"
- "iteration N"
- Any reference to looping, reviewing, agents, AI co-author

## Allowed phrasing

- "clarify X"
- "deduplicate Y diagram"
- "add ADR for Z"
- "soften W rule"
- "drop V"
- "consolidate U"
- "document non-goal about T"
- "tighten S rule"

## Banned in any committed doc

- "as previously raised by reviewer"
- "to address concern about"
- Round numbers, review references
- Changelog of reviewer findings
- "intentional pre-emption of"

State the non-goal directly. Do not narrate the journey to it.

## Why

Future reviewer reads commit history without seeing loop tells. Each round is genuine first contact. The strategy depends on this.
