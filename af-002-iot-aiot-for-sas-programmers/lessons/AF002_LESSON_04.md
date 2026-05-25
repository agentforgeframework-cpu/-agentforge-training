# AF002_LESSON_04.md

# AF-002 — IoT/AIoT for SAS Programmers
## Lesson 04 — Use Spatial Telemetry Operationally

Status: Prototype Draft v0.1.9

---




# START HERE

You walk into the operations meeting.

A warehouse camera alert is already on the screen.

---

# ACTIVE EVIDENCE

Image:

click here --> [AF-002_LESSON_04_BOUNDING_BOXES.png](../media/AF-002_LESSON_04_BOUNDING_BOXES.png)

Telemetry Row:

```text
2026-05-24T08:00:01,person,RESTRICTED,0.94,420,170,520,340
```

Operational Question:

```text
What stands out operationally?
```

---

Instructor:

The rectangles are called **bounding boxes**.

Pause.

Let the learner inspect the image and telemetry row before continuing.

Guide naturally toward questions such as:
- What do the rectangles mean?
- Why are some objects boxed and others not?
- What does `RESTRICTED` mean here?
- How reliable might this be?
- What would you want to verify?

Then transition into:
- telemetry rows
- SAS investigation
- operational interpretation

Proceed one operational step at a time.

---

# Bounding Boxes

Recommended visual:

click here --> [AF-002_LESSON_04_BOUNDING_BOXES.png](../media/AF-002_LESSON_04_BOUNDING_BOXES.png)

Observe the image first before discussing telemetry or coordinates.

Questions:
- What stands out first?
- Which objects received bounding boxes?
- Which objects did NOT receive bounding boxes?
- Why might that matter operationally?

---

# First Definition

A **bounding box** is:

```text
a way to describe
where something was detected in an image
```

Bounding boxes are important because:

```text
the visible region becomes telemetry
```

The learner should first understand:

```text
what is visible
```

before worrying about:
- coordinates
- telemetry structure
- SAS analysis

---

# Visual Operational Grounding

INSTRUCTOR NOTE:
Use AF-002_LESSON_04_ZONE_DEFINITION.png here.

Recommended visual:

click here --> [AF-002_LESSON_04_ZONE_DEFINITION.png](../media/AF-002_LESSON_04_ZONE_DEFINITION.png)

Keep ACTIVE EVIDENCE visible while discussing operational zones.

Observe:
- restricted areas
- shared zones
- pedestrian paths
- loading regions
- operational movement patterns

Questions:
- Which operational regions matter most?
- Which areas appear sensitive?
- Which detections might deserve investigation?
- What makes one zone operationally different from another?

Important:

```text
The AI system does not understand
operational meaning.

Humans define the operational meaning.
```

---

# Example Bounding Box

If image assets are unavailable,
the following simplified diagram illustrates the concept.

```text
+------------------------------------------------+
|                                                |
|                                                |
|          +--------------------+                |
|          |                    |                |
|          |     FORKLIFT       |                |
|          |                    |                |
|          +--------------------+                |
|                                                |
|                                                |
+------------------------------------------------+
```

The rectangle identifies:

```text
where the detected object exists
inside the observed image
```

This visible region becomes telemetry.

---

# Coordinate Details (Later Reference)

The values:

```text
x1  y1  x2  y2
```

represent the boundaries of the bounding box.

Conceptually:

```text
x1,y1 = upper-left corner
x2,y2 = lower-right corner
```

Simple coordinate example:

```text
(122,88)
+----------------------+
|                      |
|      FORKLIFT        |
|                      |
+----------------------+
               (344,410)
```

The exact mathematics are less important right now than the operational meaning:

```text
The system observed something
in a specific visible region.
```

---

# Camera Coordinate System

INSTRUCTOR NOTE:
Use AF-002_LESSON_04_CAMERA_COORDINATE_SYSTEM.png here.

Recommended visual:

click here --> [AF-002_LESSON_04_CAMERA_COORDINATE_SYSTEM.png](../media/AF-002_LESSON_04_CAMERA_COORDINATE_SYSTEM.png)

Keep ACTIVE EVIDENCE visible while discussing coordinates.

Observe:
- coordinate axes
- bounding box corners
- center points
- frame dimensions

Questions:
- Why might coordinates matter operationally?
- What do x1,y1 and x2,y2 represent?
- Why might frame size matter?
- What operational limitations still exist?

Important:

```text
Coordinates describe visible regions.

Coordinates alone do not create operational meaning.
```

---


# First Telemetry Example

The image becomes structured telemetry.

Now look at a single telemetry row before worrying about coordinate mathematics.

---

# Example Spatial Telemetry Row

Keep this evidence visible while discussing the next few steps.

# ACTIVE EVIDENCE

Image:

click here --> [AF-002_LESSON_04_BOUNDING_BOXES.png](../media/AF-002_LESSON_04_BOUNDING_BOXES.png)

Telemetry Row:

```text
2026-05-24 08:42:11    forklift      dock_3    122   88    344   410
```

Operational Question:

```text
What does this row tell us?
What does this row NOT tell us?
```

---

# Example Spatial Telemetry Row

You now receive the following telemetry row:

```text
timestamp              object_type   zone      x1    y1    x2    y2
2026-05-24 08:42:11    forklift      dock_3    122   88    344   410
```

Before deeply analyzing this data operationally:

# First Operational Question

```text
What would you want to know
before trusting this telemetry?
```

Pause and think operationally.

Possible considerations might include:

- How current is this telemetry?
- What camera generated it?
- What does dock_3 represent?
- Are the coordinates reliable?
- What defines a forklift detection?
- How often are observations collected?
- Could detections be missed?
- What happens if visibility is blocked?

This is important:

```text
All telemetry data is incomplete in some way.
```

Operational telemetry always contains:

- assumptions
- limitations
- visibility boundaries
- collection constraints
- interpretation risk

Human-in-Command thinking begins here.

---




# Confidence Interpretation

INSTRUCTOR NOTE:
Use AF-002_LESSON_04_CONFIDENCE_EXAMPLES.png here.

Recommended visual:

click here --> [AF-002_LESSON_04_CONFIDENCE_EXAMPLES.png](../media/AF-002_LESSON_04_CONFIDENCE_EXAMPLES.png)

Keep ACTIVE EVIDENCE visible while discussing confidence.

Observe:
- high confidence detections
- medium confidence detections
- possible false positives

Questions:
- Does confidence equal certainty?
- Which detections would you trust most?
- Which detections deserve human review?
- What operational risks might exist?

Important:

```text
Confidence scores represent probability,
not certainty.
```

Human review may still be required.

---

# Timestamp Interpretation

INSTRUCTOR NOTE:
Use AF-002_LESSON_04_TIMESTAMP_PATHS.png here.

Recommended visual:

click here --> [AF-002_LESSON_04_TIMESTAMP_PATHS.png](../media/AF-002_LESSON_04_TIMESTAMP_PATHS.png)

Observe:
- capture time
- processing time
- transmission time
- database insert time

Questions:
- Which timestamp represents the physical event?
- Could telemetry be delayed?
- Could timestamps become misleading operationally?
- Which timestamp would matter most in an investigation?

Important:

```text
Telemetry timestamps may represent
different operational events.
```

Timestamp meaning must be verified operationally.

---

# Persistence Across Frames

INSTRUCTOR NOTE:
Use AF-002_LESSON_04_FRAME_SEQUENCE.png here.

Recommended visual:

click here --> [AF-002_LESSON_04_FRAME_SEQUENCE.png](../media/AF-002_LESSON_04_FRAME_SEQUENCE.png)

Observe:
- object movement across frames
- persistence over time
- frame numbering
- repeated detections

Questions:
- Why might single-frame detections be unreliable?
- Why does persistence improve confidence?
- What operational meaning emerges over time?
- Why might frame_number matter?

Important:

```text
Operational telemetry often depends
on temporal persistence.
```

---

# Why Spatial Telemetry Matters

Traditional telemetry might only tell you:

```text
forklift detected
```

Spatial telemetry begins telling you:

- WHERE the forklift was
- WHICH zone was occupied
- HOW movement occurred
- WHETHER congestion may exist
- WHETHER operational flow changed

This creates operational investigation opportunities.

---

# Beginning SAS Investigation

Now the telemetry becomes ordinary SAS data.

Preferred path:

A companion utility program is available:

```text
/sas/AF002_LESSON_04_SAS_UTILITIES.sas
```

Use the local file:

```text
/data/sample_spatial_telemetry.csv
```

If file access is difficult, use the embedded `DATALINES` fallback below.

The important operational rule is:

```text
No GitHub runtime dependency is required.
```

Create the SAS dataset before running PROC PRINT.

Preferred local CSV pattern:

```sas
proc import datafile="data/sample_spatial_telemetry.csv"
    out=work.spatial_telemetry
    dbms=csv
    replace;
    guessingrows=max;
run;
```

Fallback embedded teaching data:

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

datalines;
24MAY2026:08:00:01 person RESTRICTED 0.94 420 170 520 340
24MAY2026:08:00:02 forklift FORKLIFT 0.88 100 210 290 390
24MAY2026:08:00:03 pallet LOADING 0.91 600 200 760 360
24MAY2026:08:00:04 person SHARED 0.86 500 180 610 350
24MAY2026:08:00:05 pallet SHARED 0.89 620 240 760 380
;
run;
```

Use either the preferred CSV path or the fallback DATALINES path.

Then inspect the dataset.

---

# First SAS Inspection

Run:

```sas
proc print data=work.spatial_telemetry;
    title "Lesson 04 - Spatial Telemetry";
run;

title;
```

You should now see:

- timestamps
- object detections
- zones
- coordinate regions

At this point:

```text
this is simply operational SAS data
```

That is important.

The goal is NOT:

```text
understand computer vision systems
```

The goal IS:

```text
investigate operational telemetry evidence
using SAS
```

---

# Basic Operational Questions

Now begin asking operational questions.

Examples:

- Which zones are busiest?
- Which forklifts appear repeatedly?
- Which areas appear inactive?
- Which regions experience congestion?
- Are observations stale?
- Are timestamps believable?
- Are detections continuous or intermittent?

Operational investigation begins with:

```text
curiosity plus skepticism
```

---

# Frequency Investigation

Run:

```sas
PROC FREQ data=work.spatial_telemetry;
    TABLES zone;
RUN;
```

You should now see:

- operational activity counts by zone
- visible concentration patterns
- possible workload differences

Pause and observe.

Questions:

```text
Does this operational distribution
look believable?
```

and:

```text
What additional telemetry
would improve confidence?
```

---

# Congestion Escalation — The Second Discovery

At this point, the learner understands that visible detections can become SAS data.

Now introduce a slightly larger operational question.

# ACTIVE EVIDENCE

Image:

click here --> [AF-002_LESSON_04_MORNING_CONGESTION.png](../media/AF-002_LESSON_04_MORNING_CONGESTION.png)

Observe:
- pedestrian queue buildup
- forklifts moving through shared space
- overlap concentration
- normalized operational behavior

Telemetry:

```text
/data/sample_spatial_telemetry_congestion.csv
```

SAS Program:

```text
/sas/AF002_LESSON_04_CONGESTION_INVESTIGATION.sas
```

Operational Question:

```text
Why does forklift and pedestrian overlap spike between 8:00 and 8:20 AM?
```

---

# Short Ethics and Rules Acknowledgement

In many operational systems, telemetry may be intentionally limited.

The system may detect:

```text
person
```

without identifying:

```text
which person
```

Different organizations, industries, and regions continue debating:
- privacy
- consent
- retention
- monitoring
- acceptable AI use

This course does not attempt to resolve those debates.

It recognizes that they exist.

The focus here is operational telemetry interpretation using Human-in-Command reasoning.

---

# Congestion Investigation

The next telemetry sample does not identify workers individually.

The telemetry identifies:
- `person`
- `forklift`
- shared operational space
- timing concentration

The learner should investigate:
- why overlap increases
- what operational process exists around 8:00 AM
- whether the workflow is safe and efficient

Core operational realization:

```text
Forklift and pedestrian overlap spikes every morning.
```

Run the congestion investigation program:

```sas
/* Run the local lesson program */
%include "sas/AF002_LESSON_04_CONGESTION_INVESTIGATION.sas";
```

If `%INCLUDE` is not appropriate in the learner environment,
open the SAS program directly and run the code manually.

Expected SAS evidence:
- higher overlap during `08:00-08:10`
- continued overlap during `08:10-08:20`
- lower overlap after `08:20`
- increased shared-zone activity

Interpretation question:

```text
What ordinary operational process might explain
this repeatable morning pattern?
```

---

# Human Operational Follow-Up

Preferred operational answer:

```text
Go see it.
```

If that is not immediately possible:

```text
Review the video feed.
```

If that is not immediately possible:

```text
Trace the data flow from camera to SAS.
```

Telemetry should guide investigation.

Telemetry should not replace operational confirmation.

---

# Operational Reveal

The time clock is mounted beside the shared warehouse path.

The location made sense decades earlier when the warehouse operated with only one forklift.

The workflow evolved.

The time clock location did not.

This is not primarily a worker problem.

It is a system constraint that became invisible because everyone got used to it.

Operational improvement:

```text
Move the time clock.
```

Other possible operational actions:
- adjust traffic markings
- stagger clock-in times
- provide a safer pedestrian route
- retrain around forklift/pedestrian interaction
- review whether the time clock must remain in that exact location

---

# Teaching Point

The strongest operational finding is not that AI detected people and forklifts.

The strongest finding is:

```text
SAS helped reveal a normalized workflow problem.
```

The solution remains human.

---


# Operational Growth

The important realization:

```text
The telemetry itself did not change.
Your operational understanding changed.
```

This is foundational.

Operational telemetry work often involves:

- incomplete evidence
- evolving interpretation
- operational questioning
- reconciliation effort
- trust evaluation

Human judgment remains critical.

---


# Operational Reflection

At this point you should increasingly feel:

```text
“I already know how to investigate this.”
```

because:

```text
spatial telemetry became ordinary SAS operational data
```

That operational bridge is the purpose of Lesson 04.

---

# Success Checkpoint

You should now understand:

- what a bounding box is
- how visible detections become telemetry
- why telemetry trust matters
- how spatial telemetry becomes SAS data
- how SAS can investigate visible operational evidence
- how SAS can reveal a normalized workflow problem
- why Human-in-Command reasoning matters operationally

---

# Restart Checkpoint

If interrupted, restart from:

```text

# First Telemetry Example

The image becomes structured telemetry.

Now look at a single telemetry row before worrying about coordinate mathematics.

---

# Example Spatial Telemetry Row
```

Then rerun:

- DATA step
- PROC PRINT
- PROC FREQ

For the congestion escalation, rerun:

```text
/sas/AF002_LESSON_04_CONGESTION_INVESTIGATION.sas
```

before continuing.

---

# Completion Signal

You have completed:

```text
AF-002 Lesson 04
Use Spatial Telemetry Operationally
```

You should now increasingly understand:

```text
visible operational telemetry
can become understandable,
investigatable,
SAS-analyzable operational evidence
```

---

# Next Lesson

AF002_LESSON_05.md

```text
Deliver Practical Results Using Telemetry
```

---

# Development & Test Environment

Project:
AF-002 — IoT/AIoT for SAS Programmers

Lesson:
Lesson 04 — Use Spatial Telemetry Operationally

Model:
GPT-5.5

Date:
2026-05-25

Focus:
- Prototype Draft v0.1.7
- active evidence persistence
- local-first SAS data loading
- onboarding survivability
- operational grounding
- visible telemetry evidence
- Human-in-Command reasoning
- controlled operational evidence
- instructional image integration
- SAS operational investigation
- congestion escalation
- time-clock workflow discovery

