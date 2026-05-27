# Validation Notes — AF-002

## Purpose

Validation for AF-002 exists to improve operational confidence.

Validation is:

- lightweight
- operational
- useful
- survivability-focused

Validation is NOT certification.

---

## Current Validation Focus

Validation should confirm:

- onboarding clarity
- lesson survivability
- setup survivability
- portability
- cold-start usability
- AI instructional continuity
- operational usefulness

---

## Educational Validation Rule

For educational kits:

```text
LESSON_*.md IS the loadable instructional unit.
```

Validation should confirm that an AI assistant can operate correctly when provided directly with a lesson file such as:

```text
AF002_LESSON_01.md
```

---

## Cold-Start Validation

Validation should include testing under ordinary imperfect conditions.

Examples:

- tired learner
- conference environment
- partial attention
- imperfect setup
- interrupted workflow
- fresh AI session

The goal is survivability, not perfection.

---

## Lesson 01 Operational Validation

Lesson 01 should be considered operationally ready when a learner can:

1. Install or confirm Python package readiness.
2. Run the webcam telemetry capture workflow.
3. Produce a CSV telemetry file.
4. Import that CSV file into SAS.
5. View a visible SAS result.
6. Explain that the webcam produced timestamped operational telemetry.

---

## Validation Philosophy

Operational validation asks:

```text
Can a reasonable learner succeed under normal imperfect conditions?
```

Not:

```text
Can an ideal expert succeed under ideal conditions?
```

---

## Development and Test Environment

- Platform: ChatGPT Web
- Model: GPT-5.5 Thinking
- Date: 2026-05-09
- Notes: Updated after Claude digital twin survivability test.

