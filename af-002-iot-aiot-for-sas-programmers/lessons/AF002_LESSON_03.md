# AF002_LESSON_03.md

# AF-002 — IoT/AIoT for SAS Programmers
## Lesson 03 — Use Telemetry Operationally

Status: Draft — Survivability Hardened Conversational Prototype  
Course Status: Public Beta  
Instructional Mode: Conversational Instructor-Led Operational Lab

Repository-relative path: `/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_03.md`

GitHub URL:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_03.md

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_03.md

---

# Lesson Purpose

In Lesson 02, you learned that telemetry changes over time.

In this lesson, you will begin using telemetry operationally.

The goal is not merely to:
- collect telemetry
- summarize telemetry
- graph telemetry

The goal is to begin asking:

```text
What operational behavior does this telemetry represent?
```

This lesson intentionally uses:
- small understandable operational systems
- guided operational interaction
- incremental instructor pacing
- Human-in-Command operational reasoning

---

# Important Instructional Note

This lesson is intentionally designed to be delivered conversationally.

This lesson works best when:
- an instructor guides the learner
- the learner runs one step at a time
- operational interpretation occurs interactively
- the learner influences investigation direction naturally

This lesson is NOT intended to behave like:
- a textbook chapter
- a workbook dump
- long-form instructional prose

The operational teaching doctrine for this lesson is:

```text
Operational understanding emerges through guided operational interaction.
```

---

# Human-in-Command

This lesson reinforces:

```text
Systems increase awareness.
Humans make decisions.
```

Telemetry supports:
- visibility
- awareness
- investigation
- operational understanding

Telemetry does NOT replace:
- human judgment
- operational accountability
- human responsibility

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

---

# Recommended Instruction Pattern

Recommended pacing:

```text
Explain
→ Run
→ Observe
→ Interpret
→ Continue
```

Strong recommendation:
The instructor should deliver:
- one operational idea
- one SAS action
- one interpretation opportunity

per interaction cycle.

Visible learner pacing is intentional.

The learner should generally understand:
- where they are in the lesson
- what phase they are currently completing
- that the lesson has bounded scope

This reduces unnecessary cognitive load and improves operational focus.

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
AI-assisted bird feeder telemetry
```

This scenario is intentionally:
- understandable
- low-cost
- operationally relatable
- visually meaningful

The bird feeder telemetry is a model for operational telemetry systems generally.

This is NOT:
- a birdwatching course
- ornithology training
- Raspberry Pi deployment instruction


Operational note:

```text
If you eventually want telemetry like this yourself,
the telemetry source could come from:
- cameras
- AI-assisted image systems
- environmental sensors
- operational logs
- event streams
- simple automation systems
```

The important lesson here is NOT the specific hardware.

The important lesson is:
- operational visibility
- telemetry interpretation
- Human-in-Command reasoning
- operational awareness

---

# Canonical Telemetry Schema

```text
timestamp
event_id
species_detected
species_count
confidence_score
movement_detected
activity_level
operational_state
alert_flag
time_of_day
```

---

# Approved Operational States

```text
ACTIVE
HIGH_ACTIVITY
NO_ACTIVITY
```

---

# Instructor Opening Example

Instructor:

Okay — now we begin using telemetry operationally.

Not just collecting telemetry.
Not just graphing telemetry.

We are going to start asking:

```text
What deserves attention?
```

We will stay small and simple.

One step at a time.

---

# Phase 1 of 7 — Create Tiny Operational Telemetry

Strong recommendation:

Combine:
- DATA step
- initial PROC PRINT

into a SINGLE interaction cycle.

Reason:
This creates:
- immediate operational visibility
- immediate learner success
- confidence continuity
- fresh-session survivability

Example:

```sas
title "Lesson 03 - Tiny Operational Telemetry";

data work.birdfeeder_telemetry;
   length event_id $4
          species_detected $20
          movement_detected $3
          activity_level $12
          operational_state $20
          alert_flag $3
          time_of_day $12;

   format timestamp datetime20.;

   input timestamp :datetime20.
         event_id $
         species_detected $
         species_count
         confidence_score
         movement_detected $
         activity_level $
         operational_state $
         alert_flag $
         time_of_day $;

datalines;
18MAY2026:07:00:00 E001 cardinal 2 0.91 YES moderate ACTIVE NO morning
18MAY2026:07:05:00 E002 cardinal 3 0.94 YES high HIGH_ACTIVITY YES morning
18MAY2026:07:10:00 E003 none 0 0.00 NO low NO_ACTIVITY NO morning
;
run;

proc print data=work.birdfeeder_telemetry;
run;

title;
```

Instructor guidance example:

```text
Take a second and look at the rows before continuing.

Which row catches your attention first?
```

---

# Phase 2 of 7 — Human-Readable Telemetry

Goal:
Demonstrate that operational telemetry must be understandable by humans.

Introduce:
- PROC FORMAT
- LABEL statements
- readable operational state descriptions

Operational principle:

```text
Can a tired engineer understand this at 2 AM?
```

Example:

```sas
proc format;
   value $opstate
      'ACTIVE'        = 'normal telemetry presence'
      'HIGH_ACTIVITY' = 'elevated operational condition'
      'NO_ACTIVITY'   = 'possible quiet or idle condition';
run;

proc print data=work.birdfeeder_telemetry label;
   label operational_state = 'Operational State'
         species_count     = 'Bird Count'
         confidence_score  = 'Detection Confidence'
         alert_flag        = 'Alert Flag';

   format operational_state $opstate.;
run;
```

---

# Phase 3 of 7 — Operational State Awareness

Goal:
Transition the learner from:
- rows
to:
- operational conditions

Strong emphasis:

```text
These are not just rows anymore.
They represent changing operational behavior.
```

Recommended procedures:
- PROC PRINT
- PROC FREQ

Recommended instructor prompts:
- What changed?
- What catches your attention?
- Does this seem normal?
- Would this deserve investigation?

---

# Restart Checkpoint

At this point, the learner should have:
- a working telemetry dataset
- readable operational telemetry output
- basic operational state awareness
- operational interpretation experience

If interrupted:
restart from Phase 1 to rebuild operational context safely.

---

---

# Phase 4 of 7 — Human Operational Interpretation

Goal:
Teach operational interpretation.

The learner should begin determining:
- what deserves attention
- what appears normal
- what may require investigation
- whether telemetry is trustworthy

Strong emphasis:
Operational ambiguity is valuable instructional territory.

The instructor should encourage:
- curiosity
- skepticism
- operational reasoning
- investigative thinking

---

# Phase 5 of 7 — Threshold Manipulation

Goal:
Demonstrate that changing thresholds changes operational interpretation.

Strong emphasis:
The telemetry itself may remain unchanged while:
- alerts
- visibility
- operational attention
- investigation triggers

change dramatically.

Example:

```sas
data work.birdfeeder_alerts;
   set work.birdfeeder_telemetry;

   if species_count >= 4 then
      alert_flag = 'YES';
   else
      alert_flag = 'NO';
run;
```

Important operational lesson:

```text
The telemetry did not change.
The operational interpretation changed.
```

---

# Phase 6 of 7 — Summary Data vs Telemetry Data

Goal:
Demonstrate that summary statistics answer different questions than telemetry streams.

Strong instructional anchor:

```text
2.2 birds
```

This tested extremely well operationally.

The learner naturally recognizes:
- mathematically valid
- operationally absurd

This strongly reinforces:
- averages can hide operational behavior
- telemetry and summaries serve different purposes

Example:

```sas
proc means data=work.birdfeeder_telemetry mean;
   var species_count;
run;
```

Operational lesson:

```text
Summary data and telemetry data answer different operational questions.
```

---

# Phase 7 of 7 — Quiet Telemetry Interpretation

Goal:
Teach that:
- silence
- inactivity
- lack of telemetry

can also represent operational telemetry.

Strong emphasis:
NO_ACTIVITY is not automatically failure.

The learner should consider:
- expected quiet periods
- environmental conditions
- telemetry trustworthiness
- sensor failure possibilities

---

# Optional Expansion Areas

Strong survivability success occurred when learners explored:
- anomaly detection
- fleet telemetry
- operational dashboards
- weather correlation
- telemetry trustworthiness
- missing telemetry
- fleet comparison
- operational visualization enhancement
- ingestion gaps
- sensor reliability

These should remain optional expansion paths.

---

# Learner Artifacts

By the end of Lesson 03, the learner should possess:
- telemetry dataset
- SAS operational outputs
- threshold analysis examples
- operational state summaries
- telemetry interpretation experience
- operational reasoning exposure

---

# Lesson Completion Signal

The instructor should explicitly state:

```text
You have completed the core operational objectives of Lesson 03.
```

This is REQUIRED for:
- closure
- confidence continuity
- learner reassurance
- survivability


Strong recommendation:

The instructor should pause here and allow the learner to recognize:

```text
I can now:
- observe telemetry
- interpret operational conditions
- reason about operational meaning
- manipulate thresholds
- recognize operational ambiguity
inside a SAS workflow.
```

Optional continuation prompt:

```text
Would you like to explore additional operational scenarios?
```

---

# Emotional Handoff To Lesson 04

The learner should finish Lesson 03 feeling:

```text
This is operationally useful.
How could I realistically use this at work?
```

NOT:

```text
I learned bird feeder analytics.
```

---

# Development & Test Environment

Course:
AF-002 — IoT/AIoT for SAS Programmers

Lesson:
Lesson 03 — Use Telemetry Operationally

Primary Validation Method:
- human survivability testing
- conversational instructor testing
- digital twin instructional analysis

Validated Instructional Identity:
- guided operational telemetry instruction
- conversational operational coaching
- incremental operational interaction

Key Validated Doctrine:

```text
Operational understanding emerges through guided operational interaction.
```

---

# File Reference Information

Repository:
-agentforge-training

Suggested Path:
af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_03.md

Human URL:
(TBD after repository commit)

Raw URL:
(TBD after repository commit)

---

# License

Copyright (c) AgentForge Framework

Status:
Public Beta Educational Material

Additional licensing details:
(TBD)
