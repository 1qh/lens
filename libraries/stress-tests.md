# stress-tests

Per-round stress-test scenario library. Pick 2-3 per round, matched to round theme. Each scenario forces the reviewer to imagine concrete failure.

- You ship Monday. What fails first?
- A regulator audits next week. Which citation kills the team?
- 100k DAU on launch day. Which service falls over first?
- An attacker has one valid credential. How far do they get?
- The CI host dies in the middle of a deploy. What state is the cluster in?
- Primary database fails over at 3am. Which runbook does on-call follow?
- A new hire joins next week and reads only the docs. What do they get wrong on day one?
- A breaking platform-vendor minor update lands tomorrow. Which dep falls behind?
- Event broker quorum loses two nodes simultaneously. Recovery story?
- An auto-merged dep PR introduces a subtle behavior change. How is it caught?
- App Store submission gets rejected. Rework cost?
- The most cynical engineering friend of the team reads these docs. What do they laugh at?
- Cross-region disaster. What survives, what does not?
- The doc set is the only artifact handed to a new team to take over. Where do they get stuck on week one?
- A consumer-tier user files a data deletion request. Trace the deletion path through every store.
- A schema-registry compatibility check fails on deploy. What blocks it?
- A workflow engine version upgrade is required. How do in-flight workflows survive?
- A vendor changes their pricing 10x. Which dep is unswappable?
- A core dep is open-source-license-changed (SSPL-style). What is the migration?
- A tenant requests a copy of all their data. Which stores are queried, which are missed?
