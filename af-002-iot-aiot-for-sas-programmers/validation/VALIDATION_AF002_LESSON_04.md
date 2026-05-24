# VALIDATION_AF002_LESSON_04.md

# AF-002 Lesson 04 Validation

Status: Prototype Draft v0.1.0  
Lesson: AF002_LESSON_04.md  
Focus: Spatial telemetry, bounding boxes, and operational investigation

Repository-relative path: `/af-002-iot-aiot-for-sas-programmers/validation/VALIDATION_AF002_LESSON_04.md`

---

# Purpose

This validation file supports focused survivability testing for Lesson 04.

The core validation question is:

```text
Can the learner use visible telemetry evidence
to investigate operational conditions using SAS?
```

---

# Validation Scope

Validate that Lesson 04 remains:

- operational
- visual
- local-first
- SAS-centered
- investigation-oriented
- Human-in-Command aligned
- pacing survivable

Do not validate this lesson as:
- an AI theory lesson
- a cloud architecture lesson
- a computer vision engineering lesson
- a modernization governance lesson
- a dashboard design lesson

---

# Required Learner Experience

By the end of the lesson, the learner should be able to say:

```text
I can use visible telemetry evidence
to investigate real operational conditions using SAS.
```

---

# File Availability Check

Confirm these files exist or are intentionally deferred:

- [ ] `/lessons/AF002_LESSON_04.md`
- [ ] `/data/sample_spatial_telemetry.csv`
- [ ] `/sas/AF002_LESSON_04_SAS_UTILITIES.sas`
- [ ] `/exercises/AF002_LESSON_04_OPERATIONAL_CHALLENGES.md`
- [ ] `/media/warehouse_regions_reference.png`
- [ ] `/media/lesson04_raw_frame.png`
- [ ] `/media/lesson04_bounding_boxes.png`
- [ ] `/media/lesson04_region_overlay.png`
- [ ] `/media/lesson04_sequence_01.png`
- [ ] `/media/lesson04_sequence_02.png`

If any media file is still a placeholder, mark the visual test incomplete but continue textual and SAS validation.

---

# Pacing Validation

- [ ] SAS appears early enough to preserve SAS identity.
- [ ] The learner sees visual evidence before abstract explanation grows too long.
- [ ] The lesson moves from visual evidence to telemetry to SAS investigation.
- [ ] The lesson does not begin with modernization framing.
- [ ] The lesson does not spend extended time on AI theory.
- [ ] The lesson does not require enterprise infrastructure knowledge.

Pass condition:

```text
A learner reaches meaningful SAS investigation without conceptual fatigue.
```

---

# Spatial Telemetry Validation

- [ ] Bounding boxes are explained clearly.
- [ ] Coordinates are understandable.
- [ ] `x1`, `y1`, `x2`, and `y2` are treated as ordinary data.
- [ ] Center-point logic is understandable.
- [ ] Regions are understandable.
- [ ] Spatial diagrams improve clarity rather than adding clutter.

Pass condition:

```text
The learner understands that bounding boxes are operational measurements.
```

---

# SAS Validation

- [ ] CSV import is understandable.
- [ ] `PROC PRINT` output supports investigation.
- [ ] `PROC FREQ` output supports region review.
- [ ] Restricted-region filtering works.
- [ ] Example code can run in SAS OnDemand or comparable SAS environments with minimal adjustment.
- [ ] SAS output creates an operational question, not just a report.

Pass condition:

```text
The learner uses SAS to find something operationally meaningful.
```

---

# Operational Investigation Validation

Confirm that the lesson supports at least three of the five canonical patterns:

- [ ] Restricted region intrusion
- [ ] Occupancy and persistence
- [ ] Congestion and density
- [ ] Direction-of-travel anomaly
- [ ] Missing expected activity

Pass condition:

```text
The lesson creates repeated “I found something” moments.
```

---

# Telemetry Imperfection Validation

The lesson should include a survivable middle level of telemetry imperfection.

Acceptable examples:
- [ ] slight confidence variation
- [ ] minor coordinate jitter
- [ ] partial region overlap
- [ ] one-frame uncertainty
- [ ] detection requiring human review

Avoid:
- [ ] chaotic false positives
- [ ] unexplained tracking collapse
- [ ] advanced machine learning troubleshooting
- [ ] excessive technical explanation

Pass condition:

```text
Telemetry imperfection creates operational realism without learner fatigue.
```

---

# Human-in-Command Validation

- [ ] The AI system does not make the final operational judgment.
- [ ] SAS identifies evidence, not truth.
- [ ] The human determines operational significance.
- [ ] The lesson includes normal exceptions, not only hostile events.
- [ ] Restricted-region detection is not automatically treated as danger.

Pass condition:

```text
The learner sees that AI detections require human operational interpretation.
```

---

# Drift Check

The lesson should NOT drift into:

- [ ] AI theory
- [ ] cloud architecture
- [ ] orchestration engineering
- [ ] telemetry philosophy
- [ ] modernization governance
- [ ] dashboard theater
- [ ] cinematic storytelling

Pass condition:

```text
The lesson remains practical operational SAS investigation.
```

---

# Final Validation Decision

Use this section during testing.

## Result

- [ ] Pass
- [ ] Pass with minor edits
- [ ] Needs revision
- [ ] Fails current survivability test

## Notes

```text
[Enter validation notes here.]
```

## Required Follow-up

```text
[Enter required follow-up here.]
```

---

# Development and Test Environment

- Platform: ChatGPT Web
- Model: GPT-5.5 Thinking
- Date: 2026-05-23
- Notes: Created for AF002 Lesson 04 Prototype Draft v0.1.0 spatial telemetry re-anchor.

---

# License

Paul McDonald Open Use License (MIT-style)

© 2026 Paul McDonald

This material is provided "as is", without warranty of any kind.

---
