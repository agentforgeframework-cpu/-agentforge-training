# AF002_LESSON_04.md

# AF-002 — IoT/AIoT for SAS Programmers
## Lesson 04 — Use Spatial Telemetry Operationally

---

# Lesson Identity

This lesson teaches:

```text
how visible telemetry evidence
becomes operationally useful SAS data
```

This lesson is NOT:

- AI theory
- architecture philosophy
- cloud engineering
- orchestration systems
- modernization consulting
- dashboard theater

This lesson IS:

- operational investigation
- visible telemetry interpretation
- Human-in-Command reasoning
- SAS operational analysis
- spatial telemetry understanding

---

# What You Will Learn

In this lesson you will learn how:

- visible detections become telemetry
- telemetry becomes operational data
- SAS can investigate spatial telemetry
- telemetry trustworthiness matters operationally
- operational ambiguity emerges naturally
- humans interpret telemetry evidence

You are NOT expected to become:

- a computer vision engineer
- an AI architect
- an infrastructure specialist

You ARE expected to increasingly feel:

```text
“I understand this.”
```

and:

```text
“This is just SAS data.”
```

and ideally:

```text
“I can use this right away on one of my current projects.”
```

---

# Operational Context

Imagine a warehouse operation.

Forklifts move continuously through loading areas.

Cameras observe portions of the warehouse.

Telemetry systems attempt to answer operational questions such as:

- Which zones are active?
- Which areas are congested?
- Which docks are idle?
- Which forklifts remain stationary too long?
- Which operational areas experience heavy traffic?

The important idea:

```text
The telemetry is not the operation.
The telemetry is evidence about the operation.
```

That distinction matters.

---

# Bounding Boxes

Recommended visual:

[Open AF-002_LESSON_04_BOUNDING_BOXES.png](../media/AF-002_LESSON_04_BOUNDING_BOXES.png)

Observe the image first before discussing telemetry or coordinates.

Questions:
- What stands out first?
- Which objects received bounding boxes?
- Which objects did NOT receive bounding boxes?
- Why might that matter operationally?

---

# First Definition

A bounding box is:

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

[Open AF-002_LESSON_04_REGION_OVERLAY.png](../media/AF-002_LESSON_04_REGION_OVERLAY.png)

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

# Why Coordinates Exist

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

# Why Coordinates Exist

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

Example SAS DATA step:

```sas
DATA work.spatial_telemetry;
    LENGTH object_type $20 zone $20;

    INPUT
        timestamp :ANYDTDTM19.
        object_type $
        zone $
        x1
        y1
        x2
        y2;

    FORMAT timestamp datetime19.;

DATALINES;
24MAY2026:08:42:11 forklift dock_3 122 88 344 410
24MAY2026:08:42:14 forklift dock_3 128 90 350 412
24MAY2026:08:42:17 forklift dock_4 410 102 612 430
24MAY2026:08:42:22 forklift dock_4 420 108 620 438
24MAY2026:08:42:28 forklift dock_2 88 72 250 388
;
RUN;
```

---

# First SAS Inspection

Run:

```sas
PROC PRINT data=work.spatial_telemetry;
RUN;
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

# Human-in-Command

This lesson intentionally reinforces:

```text
Telemetry is evidence.
Not truth.
```

The system helps humans:

- observe
- detect
- summarize
- organize
- identify patterns

Humans still:

- interpret
- validate
- investigate
- decide
- act

That is Human-in-Command operational reasoning.

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
2026-05-24

Focus:
- onboarding survivability
- operational grounding
- visible telemetry evidence
- Human-in-Command reasoning
- SAS operational investigation

