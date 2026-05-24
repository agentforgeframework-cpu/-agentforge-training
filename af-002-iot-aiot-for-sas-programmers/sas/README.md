# Lesson 04 SAS Programs

Place these files in the AF-002 `/sas` folder.

These SAS programs support Lesson 04:

```text
AF002_LESSON_04.md
```

Lesson 04 now focuses on:

```text
spatial telemetry
bounding boxes
region analysis
operational investigation
```

The goal is to help SAS programmers use visible telemetry evidence to investigate operational conditions.

---

# Files

## `AF002_LESSON_04_SAS_UTILITIES.sas`

Recommended first-use program.

Purpose:
- demonstrate bounding-box fields as ordinary SAS data
- calculate center points
- assign or review regions
- summarize object detections by operational region

Use this when testing the new Lesson 04 spatial telemetry direction.

---

## `AF002_LESSON_04_OPERATIONAL_TELEMETRY.sas`

Legacy or transitional Lesson 04 program.

Purpose:
- supports earlier operational telemetry examples
- may still contain useful patterns
- should be reviewed before reuse in the new spatial telemetry version

Do not treat this as the current canonical Lesson 04 program unless it has been updated to match the spatial telemetry direction.

---

## `AF002_LESSON_04_VISUAL_REVIEW.sas`

Optional review program.

Purpose:
- review visual or spatial telemetry output
- test which plots or summaries remain useful
- support instructor review and lesson refinement

---

# Recommended First Test

1. Open SAS OnDemand for Academics or another SAS environment.
2. Confirm the sample CSV exists:

```text
/data/sample_spatial_telemetry.csv
```

3. Run:

```text
/sas/AF002_LESSON_04_SAS_UTILITIES.sas
```

4. Confirm SAS can produce:
   - spatial telemetry rows
   - object counts
   - region summaries
   - restricted-region review

5. Confirm the output supports the current Lesson 04 story:
   - bounding boxes become data
   - coordinates become operational measurements
   - regions create operational meaning
   - SAS investigates evidence
   - humans interpret significance

---

# Current Lesson 04 Validation Question

```text
Can the learner use visible telemetry evidence
to investigate operational conditions using SAS?
```

If the SAS output does not help answer that question, revise the program or remove it from the Lesson 04 path.
