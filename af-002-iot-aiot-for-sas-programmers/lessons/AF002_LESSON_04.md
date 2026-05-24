# AF002_LESSON_04.md

# AF-002 — IoT/AIoT for SAS Programmers
## Lesson 04 — Use Spatial Telemetry Operationally

Status: Prototype Draft v0.1.1  
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

In this lesson, you will investigate visible telemetry evidence using SAS.

The goal is not merely to:
- look at images
- count objects
- trust AI detections
- build a dashboard

The goal is to ask:

```text
What operational condition does this spatial telemetry help us investigate?
```

This lesson uses:
- warehouse and distribution operations
- bounding-box telemetry
- operational regions
- visible telemetry evidence
- SAS operational investigation

The learner should finish this lesson thinking:

```text
I can use visible telemetry evidence
to investigate real operational conditions using SAS.
```

---

# Important Runtime Guidance

This lesson works best when:
- the learner performs one operational step at a time
- the instructor pauses after each visible result
- SAS output is inspected before moving forward
- operational interpretation happens interactively

Do not turn this lesson into:
- AI theory
- cloud architecture
- orchestration engineering
- telemetry philosophy
- modernization governance
- dashboard theater

Core lesson rhythm:

```text
Look
→ Investigate
→ Interpret
```

---

# Supporting Files

This lesson expects the following files:

```text
/data/sample_spatial_telemetry.csv
/sas/AF002_LESSON_04_SAS_UTILITIES.sas
/media/lesson04_*.png
/exercises/AF002_LESSON_04_OPERATIONAL_CHALLENGES.md
/validation/VALIDATION_AF002_LESSON_04.md
```

---

# Instructor Opening Example

Instructor:

Okay — now we begin using spatial telemetry operationally.

Not just looking at images.
Not just collecting detections.

We are going to investigate visible operational conditions using SAS.

Look at this warehouse scene first.

Recommended media:

```text
/media/lesson04_raw_frame.png
```

Then immediately show:

```text
/media/lesson04_bounding_boxes.png
```

Instructor:

Take a second and look at the scene before continuing.

What catches your attention first?

Do not start by trusting the AI.
Do not start by trusting the table.

Start by observing the visible evidence.

---

# Phase 1 of 6 — Visible Evidence and First Telemetry

Recommended media:

```text
/media/lesson04_region_overlay.png
```

The warehouse scene contains:
- visible objects
- operational regions
- bounding boxes
- structured telemetry opportunities

A bounding box is a rectangular coordinate region describing where a detected object appears.

Example:

```text
(x1,y1) ----------------
   |                   |
   |      object       |
   |                   |
   ---------------- (x2,y2)
```

Bounding boxes are not merely graphics.

In this lesson:

```text
Bounding boxes are operational measurements.
```

Example telemetry rows:

```text
timestamp,frame_number,object_type,confidence,x1,y1,x2,y2,center_x,center_y,zone
2026-05-24T08:00:01,1,person,0.94,420,170,520,340,470,255,RESTRICTED
2026-05-24T08:00:02,2,forklift,0.88,100,210,290,390,195,300,FORKLIFT
2026-05-24T08:00:03,3,pallet,0.91,600,200,760,360,680,280,LOADING
```

Instructor:

The AI system did not produce operational conclusions.

It produced rows.

Those rows contain:
- labels
- coordinates
- confidence values
- operational regions

Now SAS can help investigate what operational conditions may exist.

---

# Phase 2 of 6 — First SAS Investigation

The first operational question is:

```text
Did an object appear in a restricted region?
```

Run this SAS step immediately:

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

Pause after the PROC PRINT output.

Instructor:

Take a second and inspect the rows before continuing.

What catches your attention first?

---

# Visible Checkpoint

You should now have:
- a SAS dataset named WORK.SPATIAL_TELEMETRY
- visible telemetry rows
- object labels
- coordinate values
- operational zones
- confidence values

You should also now recognize:

```text
visible scene
→ bounding boxes
→ telemetry rows
→ SAS investigation
```

---

# Development and Test Environment

- Platform: ChatGPT Web
- Model: GPT-5.5 Thinking
- Date: 2026-05-24
- Notes: Prototype Draft v0.1.1. Startup sequence redesigned to improve operational ignition and reduce framing latency.

---
