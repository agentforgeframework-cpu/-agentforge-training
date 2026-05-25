# AF002_LESSON_04.md

# AF-002 — IoT/AIoT for SAS Programmers
## Lesson 04 — Use Spatial Telemetry Operationally

Status: Prototype Draft v0.1.7

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

Recommended visual:

click here --> [AF-002_LESSON_04_REGION_OVERLAY.png](../media/AF-002_LESSON_04_REGION_OVERLAY.png)

Observe:
- operational zones
- forklift movement areas
- pedestrian regions
- shared operational space
- restricted areas

Questions:
- Which operational regions matter most?
- Which areas appear sensitive?
- Which detections might deserve investigation?

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
- SAS operational investigation

