# Lesson 04 — Use Spatial Telemetry Operationally

**Kit Type:** Training Kit  
**Status:** Production Candidate  
**Version:** 1.0  
**Repository:** AF-002 - IoT/AIoT for SAS Programmers  
**Repository Object:** ROOT_LIBRARY  
**Raw:** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/LIBRARY.md  
**This File (Raw):** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_04.md  

---

# Purpose

Lesson 04 introduces spatial telemetry.

The learner will use bounding boxes, coordinates, operational zones, timestamps, confidence values, and repeated detections to investigate visible operational conditions in SAS.

The lesson begins with an image and a telemetry row, then moves from visible evidence to structured data and operational interpretation.

The goal is not to teach computer-vision engineering.

The goal is to show that visible operational evidence can become understandable SAS data.

---

# AI Assistant Guidance

When assisting with this lesson:

- present one operational idea at a time
- keep the active image or telemetry row visible during interpretation
- ask what the learner notices before explaining it
- distinguish observation from interpretation
- do not treat confidence as certainty
- do not treat a single detection as proof of an event
- use SAS output as evidence, not as the final decision
- do not identify individuals
- keep the lesson focused on operational investigation
- explicitly preserve Human-in-Command responsibility

The instructional pattern is:

```text
Observe
    -> Structure
        -> Analyze
            -> Interpret
                -> Verify
```

---

# Human-in-Command Principle

Spatial telemetry can indicate:

- where an object appeared
- which zone was occupied
- how detections changed over time
- whether multiple object types shared a region
- whether activity increased during a time window

Spatial telemetry cannot determine, by itself:

- intent
- authorization
- safety
- responsibility
- operational significance

The system provides evidence.

Humans define operational meaning and decide what to verify.

---

# Learning Objectives

By the end of this lesson, the learner should be able to:

- explain a bounding box in operational terms
- identify the meaning of `x1`, `y1`, `x2`, and `y2`
- explain why frame dimensions and center points matter
- distinguish coordinates from operational zones
- explain why confidence does not equal certainty
- explain why timestamp meaning must be verified
- recognize the value of persistence across frames
- import spatial telemetry into SAS
- summarize activity by zone
- investigate shared-zone congestion
- identify what a human should verify before acting

---

# Start with Active Evidence

Review:

```text
media/AF-002_LESSON_04_BOUNDING_BOXES.png
```

Then consider this telemetry row:

```text
2026-05-24T08:00:01,person,RESTRICTED,0.94,420,170,520,340
```

Ask:

```text
What stands out operationally?
```

Consider:

- What do the rectangles represent?
- Why were some objects boxed and others not?
- What does `RESTRICTED` mean?
- What does `0.94` mean?
- What would need human verification?

---

# Bounding Boxes

A bounding box is:

```text
a rectangular description of where an object was detected in an image
```

The four primary values are:

```text
x1
y1
x2
y2
```

Conceptually:

```text
x1,y1 = upper-left corner
x2,y2 = lower-right corner
```

A bounding box converts a visible region into structured data.

That does not make the detection operationally meaningful by itself.

---

# Operational Zones

Review:

```text
media/AF-002_LESSON_04_ZONE_DEFINITION.png
```

Operational zones may include:

- restricted areas
- pedestrian paths
- forklift lanes
- loading areas
- shared regions

Coordinates describe where an object appeared.

Humans define what that location means operationally.

Important:

```text
The AI system does not define operational meaning.
Humans define operational meaning.
```

Ask:

- Which regions matter most?
- Which detections deserve attention?
- What makes one zone different from another?
- How was each zone defined?
- Could the zone definition itself be wrong?

---

# Camera Coordinates

Review:

```text
media/AF-002_LESSON_04_CAMERA_COORDINATE_SYSTEM.png
```

Coordinates are measured within the image frame.

Useful derived values include:

```text
center_x = (x1 + x2) / 2
center_y = (y1 + y2) / 2
```

Frame size matters because the same coordinate values can mean different relative positions in images of different dimensions.

Coordinates answer:

```text
Where was the object detected in the image?
```

They do not answer:

```text
What does that location mean operationally?
```

---

# First Spatial Telemetry Row

Consider:

```text
timestamp              object_type   zone      x1    y1    x2    y2
2026-05-24 08:42:11    forklift      dock_3    122   88    344   410
```

Ask:

```text
What does this row tell us?
What does this row not tell us?
```

It tells us:

- when the event was recorded
- what object type was reported
- which zone was assigned
- where the bounding box appeared

It does not tell us:

- whether the detection was correct
- whether the forklift was moving
- whether it was authorized
- whether the timestamp represents capture or processing time
- whether the camera view was obstructed
- whether the event persisted across frames

---

# Confidence

Review:

```text
media/AF-002_LESSON_04_CONFIDENCE_EXAMPLES.png
```

A confidence score reflects the model's confidence in a detection.

It does not establish certainty.

Ask:

- Which detections appear strongest?
- Which deserve review?
- Could a high-confidence detection still be wrong?
- Could a low-confidence detection still matter?
- What operational risk comes from using one threshold?

Important:

```text
Confidence is evidence about a model result.
It is not proof of operational truth.
```

---

# Timestamp Meaning

Review:

```text
media/AF-002_LESSON_04_TIMESTAMP_PATHS.png
```

A telemetry system may contain several timestamps:

- image capture time
- model processing time
- transmission time
- database insert time
- report generation time

Ask:

- Which timestamp represents the physical event?
- Could delay make the telemetry stale?
- Could timestamps arrive out of order?
- Which timestamp should be used during an investigation?

Important:

```text
A timestamp is only useful when its operational meaning is known.
```

---

# Persistence Across Frames

Review:

```text
media/AF-002_LESSON_04_FRAME_SEQUENCE.png
```

One frame may contain:

- a true detection
- a false positive
- a partially obscured object
- a duplicate detection
- a brief event

Repeated detections across frames may strengthen evidence, but repeated detections can also count the same object more than once.

Ask:

- Did the object persist?
- Did it move?
- Did confidence change?
- Was the same object counted repeatedly?
- What does `frame_number` contribute?

Operational telemetry often becomes more meaningful through time and persistence.

---

# Create Spatial Telemetry in SAS

Preferred files:

```text
data/sample_spatial_telemetry.csv
sas/AF002_LESSON_04_SAS_UTILITIES.sas
```

Use `LIBRARY.md` as the authoritative location for both files.

The SAS utility program is the preferred lesson path.

If file access is unavailable, use this embedded fallback:

```sas
data work.spatial_telemetry;
   length object_type $20 zone $20;
   format timestamp datetime19.;

   input
      timestamp :anydtdtm.
      object_type $
      zone $
      confidence
      x1
      y1
      x2
      y2
   ;

   center_x = (x1 + x2) / 2;
   center_y = (y1 + y2) / 2;

   datalines;
24MAY2026:08:00:01 person RESTRICTED 0.94 420 170 520 340
24MAY2026:08:00:02 forklift FORKLIFT 0.88 100 210 290 390
24MAY2026:08:00:03 pallet LOADING 0.91 600 200 760 360
24MAY2026:08:00:04 person SHARED 0.86 500 180 610 350
24MAY2026:08:00:05 pallet SHARED 0.89 620 240 760 380
;
run;
```

Use either the repository CSV and utility program or the embedded fallback.

Do not run both unless you intend to replace the dataset.

---

# Inspect the Data

Run:

```sas
proc print data=work.spatial_telemetry;
   title "Lesson 04 - Spatial Telemetry";
run;

title;
```

Confirm that you can see:

- timestamps
- object types
- zones
- confidence values
- bounding-box coordinates
- center points, when created

At this point, spatial telemetry has become ordinary SAS data.

---

# Summarize Activity by Zone

Run:

```sas
proc freq data=work.spatial_telemetry;
   tables zone object_type zone*object_type / norow nocol nopercent;
   title "Lesson 04 - Activity by Zone";
run;

title;
```

Ask:

- Which zones contain activity?
- Which object types appear in each zone?
- Does any zone deserve further review?
- Does one observation establish a pattern?
- What additional data would improve confidence?

---

# Review Restricted-Zone Evidence

Run:

```sas
proc print data=work.spatial_telemetry noobs;
   where zone = 'RESTRICTED';

   var timestamp
       object_type
       confidence
       x1
       y1
       x2
       y2;

   title "Lesson 04 - Restricted-Zone Evidence";
run;

title;
```

A restricted-zone detection is evidence that deserves review.

It is not automatic proof of:

- intrusion
- danger
- misconduct
- unauthorized activity

A human should verify the image, zone definition, timing, authorization context, and sensor reliability.

---

# Congestion Investigation

Review:

```text
media/AF-002_LESSON_04_MORNING_CONGESTION.png
```

Use:

```text
data/sample_spatial_telemetry_congestion.csv
sas/AF002_LESSON_04_CONGESTION_INVESTIGATION.sas
```

The repository SAS program is the authoritative implementation of the congestion analysis.

Its purpose is to summarize forklift and pedestrian detections in a shared operational zone by time window.

The operational question is:

```text
Why does shared-zone activity increase between 08:00 and 08:20?
```

Run the program identified above.

Expected evidence includes:

- increased shared-zone forklift detections
- increased shared-zone pedestrian detections
- overlap windows during the morning period
- lower shared-zone activity before and after the spike

---

# Interpret the Congestion Pattern

The pattern may indicate that forklifts and pedestrians repeatedly occupy the same shared zone during the same time period.

It does not automatically prove:

- a collision risk
- unsafe behavior
- worker fault
- equipment misuse
- a policy violation

Ask:

- Is this pattern repeatable across days?
- Does the camera cover the entire area?
- Are the same physical objects counted repeatedly?
- Is the time window too broad or too narrow?
- What routine process occurs during this period?
- What physical layout could explain the pattern?

Telemetry guides investigation.

It does not replace operational confirmation.

---

# Operational Follow-Up

The preferred follow-up is:

```text
Go see it.
```

When that is not immediately possible:

```text
Review the video.
```

Then:

```text
Trace the data path from camera capture through SAS output.
```

Confirm:

- camera location
- zone boundaries
- timestamp meaning
- model behavior
- data completeness
- repeated detections
- physical workflow

---

# Operational Reveal

In the teaching scenario, the time clock is positioned beside a shared warehouse path.

The location may have made sense when the workflow was smaller.

The operation changed.

The location did not.

This creates a repeatable concentration of pedestrian and forklift activity.

The strongest finding is not:

```text
AI detected people and forklifts.
```

The strongest finding is:

```text
SAS helped reveal a normalized workflow constraint.
```

Possible human decisions include:

- moving the time clock
- changing traffic markings
- creating a safer pedestrian route
- staggering clock-in periods
- reviewing forklift movement rules
- redesigning the shared area

The system provides evidence.

Humans choose the response.

---

# Privacy and Operational Restraint

The congestion telemetry identifies:

```text
person
```

It does not identify a named individual.

Operational monitoring should use no more personal detail than the legitimate purpose requires.

Questions of privacy, consent, retention, policy, and acceptable use depend on organizational and legal context.

This lesson does not resolve those questions.

It requires that they not be ignored.

---

# Independent Operational Review

Write a short review using:

```text
SAS found:
This may matter because:
A human should verify:
```

Example:

```text
SAS found:
Forklift and pedestrian detections increased in the shared zone
between 08:00 and 08:20.

This may matter because:
The repeated overlap may indicate a workflow or layout constraint.

A human should verify:
Whether the camera view, zone definition, timestamps,
and physical process support that interpretation.
```

Avoid assigning blame or certainty from telemetry alone.

---

# Lesson 04 Success

Lesson 04 is complete when the learner can say:

> I can use spatial telemetry and SAS to investigate visible operational evidence without confusing detection with truth.

The learner should be able to explain:

- what a bounding box represents
- why coordinates and zones are different
- why confidence is not certainty
- why timestamp meaning matters
- why persistence across frames matters
- how SAS summarizes spatial telemetry
- how repeated patterns can reveal workflow constraints
- what a human should verify before acting

---

# Restart Checkpoint

When returning after interruption:

1. Review the bounding-box image.
2. Recreate or reload `work.spatial_telemetry`.
3. Rerun `PROC PRINT`.
4. Rerun the zone-frequency analysis.
5. For congestion analysis, rerun:

```text
sas/AF002_LESSON_04_CONGESTION_INVESTIGATION.sas
```

Do not assume that prior SAS WORK datasets remain available.

---

# What You Just Did

You:

- converted visible detections into structured telemetry
- interpreted bounding boxes and coordinates
- connected coordinates to operational zones
- examined confidence and timestamp meaning
- considered persistence across frames
- used SAS to summarize spatial evidence
- investigated a repeatable congestion pattern
- identified a possible workflow constraint
- preserved Human-in-Command responsibility

Spatial telemetry became ordinary SAS operational data.

---

# Next Step

Continue to:

```text
AF002_LESSON_05.md
```

Retrieve the lesson from the authoritative location in `LIBRARY.md`.

---

End of Lesson 04
