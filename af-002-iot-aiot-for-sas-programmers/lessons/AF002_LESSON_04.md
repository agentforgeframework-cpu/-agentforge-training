# AF002_LESSON_04.md

# AF-002 — IoT/AIoT for SAS Programmers
## Lesson 04 — Use Spatial Telemetry Operationally

Status: Prototype Draft v0.1.0  
Course Status: Public Beta Development  
Instructional Mode: Conversational Instructor-Led Operational Lab

Repository-relative path: `/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_04.md`

GitHub URL:  
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_04.md

Raw URL:  
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_04.md

---

# Lesson Purpose

In Lesson 03, you learned to use telemetry operationally.

In this lesson, you will use visible telemetry evidence to investigate operational conditions with SAS.

The goal is not merely to:
- look at images
- count objects
- trust AI detections
- build a dashboard

The goal is to ask:

```text
What operational condition does this spatial telemetry help us investigate?
```

This lesson uses bounding-box telemetry from a warehouse and distribution setting.

The learner should finish this lesson thinking:

```text
I can use visible telemetry evidence
to investigate real operational conditions using SAS.
```

---

# What This Lesson Is

This lesson is:

- a practical SAS investigation lesson
- a spatial telemetry lesson
- a bounding-box interpretation lesson
- an operational evidence lesson
- a Human-in-Command lesson

This lesson is NOT:

- AI theory
- cloud architecture
- orchestration engineering
- telemetry philosophy
- modernization governance
- dashboard theater

The operational teaching doctrine for this lesson is:

```text
Observe
→ Investigate
→ Interpret
```

---

# Human-in-Command

This lesson reinforces:

```text
AI systems detect.
Humans interpret.
```

An AI-assisted vision system can produce:
- labels
- confidence values
- coordinates
- bounding boxes
- event records

A human must still interpret:
- operational meaning
- risk
- normal exceptions
- context
- workflow impact
- business significance

Telemetry is evidence.

Telemetry is not operational truth.

---

# Fresh-Session Survivability Rule

Every operational cycle in this lesson should remain:
- restartable
- interruption-safe
- fresh-session-safe

Never assume:
- prior datasets exist
- prior session state exists
- previous lesson steps are still loaded

The supporting files for this lesson are expected to be available in:

```text
/data/sample_spatial_telemetry.csv
/sas/AF002_LESSON_04_SAS_UTILITIES.sas
/media/lesson04_*.png
/exercises/AF002_LESSON_04_OPERATIONAL_CHALLENGES.md
/validation/VALIDATION_AF002_LESSON_04.md
```

---

# Recommended Instruction Pattern

Recommended pacing:

```text
Visual
→ Telemetry
→ SAS Investigation
→ Operational Interpretation
```

Strong recommendation:
The instructor should deliver:
- one visible situation
- one telemetry idea
- one SAS action
- one interpretation opportunity

per interaction cycle.

Do not allow extended conceptual explanation without:
- visual evidence
- SAS interaction
- learner investigation
- operational discovery

Runtime guidance:

```text
One operational step at a time.
Pause after each operational result.
Interpret before moving forward.
```

---

# Operational Scenario

This lesson uses:

```text
warehouse and distribution operations
```

The scenario is intentionally:
- visual
- region-based
- understandable
- operationally meaningful
- suitable for SAS investigation

The lesson does not require the learner to build the AI model.

The lesson begins after an AI-assisted vision system has already produced ordinary structured telemetry.

The important transition is:

```text
visual input
→ object detection
→ bounding boxes
→ structured telemetry
→ SAS investigation
→ operational interpretation
```

---

# Bounding Boxes Become Operational Measurements

A bounding box is a rectangular coordinate region that describes where a detected object appears in an image or video frame.

A common representation is:

```text
x1, y1, x2, y2
```

Tiny spatial diagram:

```text
(x1,y1) ----------------
   |                   |
   |      object       |
   |                   |
   ---------------- (x2,y2)
```

A bounding box is not just a graphic.

In this lesson:

```text
Bounding boxes are operational measurements.
```

Once the bounding box becomes data, SAS can help investigate:
- where something happened
- when it happened
- how often it happened
- whether it entered a defined region
- whether it persisted
- whether the pattern deserves human attention

---

# Canonical Spatial Telemetry Schema

The lesson uses a small spatial telemetry schema:

```text
timestamp
frame_number
object_type
confidence
x1
y1
x2
y2
center_x
center_y
zone
```

Optional derived fields may include:

```text
width
height
restricted_flag
persistence_flag
object_count
movement_direction
```

Keep the schema understandable.

The goal is operational investigation, not data-model complexity.

---

# Operational Regions

Warehouse operations naturally involve regions.

Example regions:

```text
GENERAL
PEDESTRIAN
FORKLIFT
LOADING
RESTRICTED
STAGING
```

A region gives coordinates operational meaning.

Tiny spatial map:

```text
+----------------------+----------------------+
| PEDESTRIAN           | RESTRICTED           |
|                      |                      |
|                      |    [person]          |
+----------------------+----------------------+
| STAGING              | LOADING              |
|                      |      [pallet]        |
+----------------------+----------------------+
```

The AI system does not understand that one region is restricted.

It only reports coordinates.

The human-designed operational rule gives those coordinates meaning.

---

# Phase 1 of 6 — See the Visible Evidence

Start with a warehouse image or spatial diagram.

Recommended media:

```text
/media/lesson04_raw_frame.png
/media/lesson04_bounding_boxes.png
/media/lesson04_region_overlay.png
```

Instructor:

Look at the visible evidence first.

Do not start by trusting the AI.
Do not start by trusting the table.

Start by asking:

```text
What appears to be happening?
```

Learner should notice:
- objects are visible
- boxes identify detected objects
- regions create operational meaning
- the same scene can become structured data

Key observation:

```text
The picture is visual.
The telemetry is structured.
SAS can investigate the structure.
```

---

# Phase 2 of 6 — Inspect the Telemetry

Use the sample spatial telemetry data.

Example rows:

```text
timestamp,frame_number,object_type,confidence,x1,y1,x2,y2,center_x,center_y,zone
2026-05-24T08:00:01,1,person,0.94,420,170,520,340,470,255,RESTRICTED
2026-05-24T08:00:02,2,forklift,0.88,100,210,290,390,195,300,FORKLIFT
2026-05-24T08:00:03,3,pallet,0.91,600,200,760,360,680,280,LOADING
```

Instructor:

The AI did not produce an operational conclusion.

It produced rows.

Those rows contain:
- object label
- confidence
- position
- region

Now SAS can help us investigate.

---

# Phase 3 of 6 — First SAS Investigation: Restricted Region Intrusion

The first operational investigation is:

```text
Did a detected object appear in a restricted region?
```

This does not automatically mean a hostile intrusion.

A restricted-region event could be:
- authorized maintenance
- a normal exception
- a training activity
- a safety concern
- a false alarm
- a comical costume situation
- an actual operational issue

The investigation identifies the condition.

The human interprets the meaning.

Recommended first SAS action:

```sas
proc import datafile="data/sample_spatial_telemetry.csv"
    out=work.spatial_telemetry
    dbms=csv
    replace;
    guessingrows=max;
run;

proc print data=work.spatial_telemetry;
    title "Lesson 04 - Spatial Telemetry";
run;
```

Then investigate restricted-zone events:

```sas
proc freq data=work.spatial_telemetry;
    tables object_type*zone / norow nocol nopercent;
    title "Objects by Operational Zone";
run;

proc print data=work.spatial_telemetry;
    where zone = "RESTRICTED";
    title "Restricted Region Detections";
run;
```

Interpretation prompt:

```text
What did SAS find?
What did SAS not know?
What would a human need to confirm?
```

Expected learning:

```text
SAS can identify the operational condition.
SAS cannot determine the full operational meaning by itself.
```

---

# Phase 4 of 6 — Region Analysis

Region analysis asks:

```text
Where did detections occur?
```

A simple region can be assigned using center-point logic.

Example:

```sas
data work.spatial_region_review;
    set work.spatial_telemetry;

    length restricted_flag $3;

    if zone = "RESTRICTED" then restricted_flag = "YES";
    else restricted_flag = "NO";
run;

proc freq data=work.spatial_region_review;
    tables zone restricted_flag;
    title "Region Review";
run;
```

Learner interpretation:

- Which zones had detections?
- Which zones matter operationally?
- Which detections deserve follow-up?
- Which detections may be harmless?

Key point:

```text
Region assignment creates operational questions.
It does not automatically answer them.
```

---

# Phase 5 of 6 — Short Sequence Investigation

After the learner understands a single frame, introduce a short sequence.

Recommended media:

```text
/media/lesson04_sequence_01.png
/media/lesson04_sequence_02.png
```

Sequence investigation asks:

```text
How did the condition change across frames?
```

Examples:
- a person appears in a restricted zone across two frames
- a pallet remains in a loading path
- congestion increases in a dock area
- a forklift moves through an unexpected path

Example SAS pattern:

```sas
proc sort data=work.spatial_telemetry;
    by object_type frame_number;
run;

proc print data=work.spatial_telemetry;
    by object_type;
    id object_type;
    var timestamp frame_number confidence center_x center_y zone;
    title "Object Position Across Frames";
run;
```

Interpretation prompt:

```text
Is this a one-frame event?
Is this persistent?
Does it look like normal movement?
What additional context would a human need?
```

---

# Phase 6 of 6 — Operational Ambiguity and Human Judgment

Introduce bounded telemetry imperfection.

Examples:
- confidence changes slightly
- a box overlaps a region boundary
- an object is partly hidden
- a detection appears in one frame but not the next
- a region assignment may need review

Instructor:

This is where operational telemetry becomes real.

If telemetry is perfect, the lesson is misleading.

If telemetry is chaotic, the lesson is unusable.

We need the survivable middle.

The learner should understand:

```text
Telemetry can be useful and imperfect at the same time.
```

Human-in-Command interpretation questions:

- Was the detection credible?
- Was the region assignment reasonable?
- Was the event operationally important?
- Was it authorized?
- Was it a normal exception?
- Was follow-up needed?
- What evidence is missing?

---

# Canonical Operational Investigation Patterns

Lesson 04 can use five canonical investigation patterns.

## 1. Restricted Region Intrusion

Question:

```text
Did an object enter a region where it normally should not be?
```

Examples:
- person in forklift lane
- forklift in pedestrian zone
- object in restricted space

## 2. Occupancy and Persistence

Question:

```text
Did something remain present longer than expected?
```

Examples:
- pallet blocking a path
- truck lingering at dock
- person remaining near equipment

## 3. Congestion and Density

Question:

```text
Did an area become unusually crowded?
```

Examples:
- too many objects in loading zone
- queue buildup
- crowded pedestrian area

## 4. Direction-of-Travel Anomaly

Question:

```text
Did movement differ from expected operational flow?
```

Examples:
- wrong-way travel
- unexpected crossing path
- repeated workaround route

## 5. Missing Expected Activity

Question:

```text
Did expected activity fail to appear?
```

Examples:
- no forklift activity during active shift
- no loading activity during scheduled window
- no movement where movement was expected

These patterns support operational investigation without drifting into AI theory or enterprise architecture.

---

# Small Operational Challenge

Use the challenge file:

```text
/exercises/AF002_LESSON_04_OPERATIONAL_CHALLENGES.md
```

Recommended challenge prompt:

```text
Use the spatial telemetry data to identify one operational condition
that deserves human review.

Do not claim the telemetry proves the cause.

Report:
- what SAS found
- why it may matter
- what a human should verify next
```

---

# Lesson Summary

In this lesson, you used visible telemetry evidence to investigate operational conditions with SAS.

You learned that:
- bounding boxes are operational measurements
- AI detections can become ordinary SAS data
- regions create operational meaning
- SAS can investigate spatial telemetry
- telemetry is evidence, not truth
- humans remain responsible for interpretation

The key Lesson 04 result is:

```text
I can use visible telemetry evidence
to investigate real operational conditions using SAS.
```

---

# Instructor Guidance

Lesson 04 is vulnerable to drift because spatial telemetry can easily turn into:
- computer vision theory
- AI model discussion
- cloud architecture
- dashboard design
- modernization strategy

Keep the lesson anchored in:

```text
visible evidence
structured telemetry
SAS investigation
human interpretation
```

Use the learner's curiosity, but do not let the lesson become an architecture debate.

SAS programmers may naturally begin building their own extensions mid-lesson.

That is acceptable if the learner remains inside the operational investigation frame.

---

# Pacing Rules

Core pacing rule:

```text
Never allow more than a few minutes to pass
without the learner seeing, filtering, discovering, or questioning something.
```

Lesson rhythm:

```text
Visual
→ Telemetry
→ SAS Investigation
→ Operational Interpretation
```

Survivability goals:
- avoid abstraction drift
- avoid architecture narration
- avoid delayed SAS engagement
- avoid operational fatigue
- avoid dashboard theater

Desired learner feeling:

```text
I can investigate operational telemetry meaningfully using SAS.
```

---

# Development and Test Environment

- Platform: ChatGPT Web
- Model: GPT-5.5 Thinking
- Date: 2026-05-23
- Notes: Prototype Draft v0.1.0. Re-anchored from architecture modernization toward spatial telemetry, bounding boxes, and operational investigation.

---

# License

Paul McDonald Open Use License (MIT-style)

© 2026 Paul McDonald

You are free to:
- Use this material for any purpose
- Share it freely
- Modify it as you see fit

Under these conditions:
- Keep this notice with any copies or substantial portions
- Give credit to Paul McDonald where reasonable
- Do not sell this material by itself for profit

This material is provided "as is", without warranty of any kind.

---
