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

Validation should confirm that an AI assistant can operate correctly when provided directly with:

```text
LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md
```

No separate `LOAD_LESSON*.md` files are used.

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

# Development & Test Environment

- Platform: ChatGPT (Web)
- Model: GPT-5.5
- Date: 2026-05-09
