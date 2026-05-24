# AF002_LESSON_04_OPERATIONAL_CHALLENGES.md

# AF-002 Lesson 04 — Operational Challenges

Status: Prototype Draft v0.1.0  
Lesson: AF002_LESSON_04.md  
Focus: Spatial telemetry and bounding-box investigation

Repository-relative path: `/af-002-iot-aiot-for-sas-programmers/exercises/AF002_LESSON_04_OPERATIONAL_CHALLENGES.md`

---

# Purpose

These challenges give the learner short operational investigations using spatial telemetry.

The goal is not to prove that the AI is right.

The goal is to use SAS to identify operational evidence that a human should review.

Core challenge pattern:

```text
What did SAS find?
Why might it matter?
What should a human verify next?
```

---

# Required Files

Expected supporting files:

```text
/data/sample_spatial_telemetry.csv
/sas/AF002_LESSON_04_SAS_UTILITIES.sas
```

Optional visual references:

```text
/media/warehouse_regions_reference.png
/media/lesson04_bounding_boxes.png
/media/lesson04_region_overlay.png
/media/lesson04_sequence_01.png
/media/lesson04_sequence_02.png
```

---

# Challenge 1 — Restricted Region Review

## Question

Which detections occurred in the restricted region?

## SAS Direction

Use `PROC PRINT` or `PROC FREQ` to filter or summarize records where:

```text
zone = RESTRICTED
```

## Report

Answer:

- Which object types appeared in the restricted region?
- How many restricted-region detections occurred?
- Does this prove a hostile intrusion?
- What should a human verify?

## Expected Lesson

Restricted-region detections are operational evidence.

They are not automatically proof of danger.

---

# Challenge 2 — Region Occupancy Review

## Question

Which operational regions had detected activity?

## SAS Direction

Summarize detections by `zone`.

Suggested procedure:

```sas
proc freq data=work.spatial_telemetry;
    tables zone;
run;
```

## Report

Answer:

- Which zones had activity?
- Which zone appears most active?
- Which zone deserves review?
- What context is missing?

## Expected Lesson

Region summaries help identify where operations are visible.

They do not explain why activity occurred.

---

# Challenge 3 — Confidence Review

## Question

Are any detections lower confidence than the others?

## SAS Direction

Use `PROC MEANS`, `PROC PRINT`, or sorting to inspect confidence values.

## Report

Answer:

- What is the lowest confidence detection?
- Does lower confidence automatically mean wrong?
- Should the record be ignored or reviewed?
- What visual evidence would help?

## Expected Lesson

Confidence is useful evidence, but it is not the same as operational truth.

---

# Challenge 4 — Repeated Restricted Detection

## Question

Does the same type of object appear repeatedly in the restricted region?

## SAS Direction

Summarize `object_type` by `zone`.

Suggested procedure:

```sas
proc freq data=work.spatial_telemetry;
    tables object_type*zone / norow nocol nopercent;
run;
```

## Report

Answer:

- Which object type appears repeatedly?
- Does repetition make the event more important?
- What non-dangerous explanations might exist?
- What should an operator check?

## Expected Lesson

Repeated evidence may deserve attention, but human interpretation is still required.

---

# Challenge 5 — Operational Review Statement

## Question

Write a short operational review based on the telemetry.

## Required Format

Use this structure:

```text
SAS found:
This may matter because:
A human should verify:
```

## Example

```text
SAS found two person detections in the restricted zone.

This may matter because the restricted zone may require authorization
or safety review.

A human should verify whether the person was authorized,
whether maintenance was scheduled,
and whether the camera region definition is accurate.
```

## Expected Lesson

Good operational telemetry review is careful.

It reports evidence without overstating conclusions.

---

# Optional Extension — Create Your Own Rule

Create one additional SAS rule using the available telemetry fields.

Possible ideas:

- identify high-confidence records
- identify records in a specific zone
- compare object types
- flag detections for human review

Report:

```text
My rule:
What it found:
Why it might matter:
What a human should verify:
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
