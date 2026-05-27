# AF-002 Replacement Log

Tracks deterministic release-engineering cleanup actions during AF-002 Version 1.0 Release Candidate stabilization.

---

# Approved Operational Policies

## Release Candidate Identity

APPROVED

AF-002 as a whole is currently a Release Candidate for Version 1.0.

Learner-facing artifacts should use Release Candidate terminology rather than Prototype terminology.

Historical/development artifacts may retain historical terminology where appropriate.

---

## ASCII Survivability Policy

APPROVED

Prefer ASCII-safe punctuation for survivability and cross-platform portability.

---

## Dual URL Strategy

APPROVED

- GitHub blob URLs support human navigation.
- raw.githubusercontent URLs support deterministic runtime and AI-assisted workflows.

Both are intentional and should be preserved.

---

## Encoding Cleanup Scope

APPROVED

Replace confirmed UTF corruption only while identifying additional exceptions for human review.

---

# Active Cleanup Actions

## Lesson 03 Footer Standardization

STATUS: APPROVED

Goal:
- standardize lesson footer structure
- improve deterministic continuity
- improve restartability

---

## Learner-Facing Prototype Cleanup

STATUS: APPROVED

Scope:
- active learner-facing lessons only

Excluded:
- lessons-learned/
- validation/
- historical artifacts

---

## UTF Corruption Cleanup

STATUS: APPROVED

Scope:
- confirmed corruption sequences only
