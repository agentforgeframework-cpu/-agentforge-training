# Lesson 03 — Use Telemetry Operationally

**Kit Type:** Training Kit  
**Status:** Production Candidate  
**Version:** 1.0  
**Repository:** AF-002 - IoT/AIoT for SAS Programmers  
**Repository Object:** ROOT_LIBRARY  
**Raw:** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/LIBRARY.md  
**This File (Raw):** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_03.md  

---

# Purpose

Lesson 03 moves from analyzing telemetry to using telemetry operationally.

The learner will begin asking:

```text
What operational behavior does this telemetry represent?
What deserves attention?
What should a human verify?
```

The lesson uses a small bird-feeder telemetry scenario because it is understandable, visible, and operationally useful without requiring specialized hardware knowledge.

The subject is not birdwatching.

The subject is operational interpretation.

---

# Instructional Mode

This lesson is designed for conversational delivery.

Use this pattern:

```text
Explain
    -> Run
        -> Observe
            -> Interpret
                -> Continue
```

Deliver one operational idea and one SAS action at a time.

Pause after each visible result.

Do not move forward until the learner has interpreted what the output means.

Operational understanding emerges through guided interaction.

---

# AI Assistant Guidance

When assisting with this lesson:

- proceed one phase at a time
- do not deliver the entire lesson as one uninterrupted block
- ask the learner what they notice before explaining the result
- use visible SAS output as the source of truth
- distinguish evidence from interpretation
- do not make operational decisions for the learner
- do not introduce advanced architecture or hardware deployment
- rebuild the lesson dataset when session state is uncertain
- explicitly state when the core lesson is complete

The goal is operational reasoning, not procedural completion alone.

---

# Human-in-Command Principle

This lesson reinforces:

```text
Systems increase awareness.
Humans make decisions.
```

Telemetry can support:

- visibility
- detection
- investigation
- comparison
- operational awareness

Telemetry does not replace:

- human judgment
- context
- accountability
- responsibility

The system identifies evidence.

A human determines what that evidence means and what action is appropriate.

---

# Learning Objectives

By the end of this lesson, the learner should be able to:

- read telemetry as operational evidence
- distinguish a record from an operational condition
- identify conditions that may deserve attention
- make telemetry output easier for humans to understand
- explain how thresholds change alerts without changing source telemetry
- distinguish summary statistics from event-level evidence
- recognize that inactivity can be meaningful
- identify what a human should verify before acting

---

# Operational Scenario

The lesson uses AI-assisted bird-feeder telemetry.

The telemetry could have originated from:

- a camera
- an image-recognition system
- a movement sensor
- an environmental sensor
- an event log
- a small automated monitoring system

The specific hardware is not important.

The operational pattern is:

```text
observation
    -> telemetry record
        -> operational interpretation
            -> human review
```

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

Approved operational states are:

```text
ACTIVE
HIGH_ACTIVITY
NO_ACTIVITY
```

---

# Phase 1 of 7 — Create Operational Telemetry

Run the DATA step and initial `PROC PRINT` together.

```sas
title "Lesson 03 - Operational Telemetry";

data work.birdfeeder_telemetry;
   length event_id $4
          species_detected $20
          movement_detected $3
          activity_level $12
          operational_state $20
          alert_flag $3
          time_of_day $12;

   format timestamp datetime20.;

   input
      timestamp :datetime20.
      event_id $
      species_detected $
      species_count
      confidence_score
      movement_detected $
      activity_level $
      operational_state $
      alert_flag $
      time_of_day $
   ;

   datalines;
18MAY2026:07:00:00 E001 cardinal 2 0.91 YES moderate ACTIVE NO morning
18MAY2026:07:05:00 E002 cardinal 3 0.94 YES high HIGH_ACTIVITY YES morning
18MAY2026:07:10:00 E003 none 0 0.00 NO low NO_ACTIVITY NO morning
;
run;

proc print data=work.birdfeeder_telemetry;
   title "Lesson 03 - Initial Telemetry Rows";
run;

title;
```

Pause and inspect the three rows.

Ask:

- Which event attracts attention first?
- Which event looks routine?
- Which event is ambiguous?
- What can be observed directly?
- What still requires interpretation?

Do not assume that `HIGH_ACTIVITY` automatically means danger or that `NO_ACTIVITY` automatically means failure.

---

# Phase 2 of 7 — Make Telemetry Human-Readable

Operational output should be understandable to a human under imperfect conditions.

Run:

```sas
proc format;
   value $opstate
      'ACTIVE'        = 'Normal telemetry presence'
      'HIGH_ACTIVITY' = 'Elevated operational condition'
      'NO_ACTIVITY'   = 'Possible quiet or idle condition';
run;

proc print data=work.birdfeeder_telemetry label;
   label
      timestamp         = 'Event Timestamp'
      species_detected  = 'Detected Species'
      species_count     = 'Bird Count'
      confidence_score  = 'Detection Confidence'
      movement_detected = 'Movement Detected'
      activity_level    = 'Activity Level'
      operational_state = 'Operational State'
      alert_flag        = 'Alert Flag'
      time_of_day       = 'Time of Day'
   ;

   format operational_state $opstate.;
run;
```

Operational question:

```text
Could a tired operator understand this output quickly?
```

Readable labels and state descriptions do not change the telemetry.

They improve the human interface to the telemetry.

---

# Phase 3 of 7 — Summarize Operational State

Run:

```sas
proc freq data=work.birdfeeder_telemetry;
   tables operational_state alert_flag species_detected / nocum;
   title "Lesson 03 - Operational State Summary";
run;

title;
```

Ask:

- Which state appears most often?
- Which event created the alert?
- Does one alert establish a persistent problem?
- What additional context would be useful?
- Would you investigate the alert, the quiet event, or both?

The output shows conditions.

It does not explain them.

---

# Restart Checkpoint

At this point, the learner should have:

- `work.birdfeeder_telemetry`
- readable telemetry output
- frequency summaries
- an initial operational interpretation

If session state is lost, restart from Phase 1.

The lesson is intentionally small enough to rebuild safely.

---

# Phase 4 of 7 — Interpret Evidence Carefully

Review the three events directly.

```sas
proc print data=work.birdfeeder_telemetry noobs;
   var timestamp
       event_id
       species_detected
       species_count
       confidence_score
       movement_detected
       operational_state
       alert_flag;
   title "Lesson 03 - Evidence Review";
run;

title;
```

For each row, distinguish:

```text
What the telemetry says
What the telemetry may mean
What a human should verify
```

Example:

```text
Telemetry says:
Three cardinals were detected with confidence 0.94.

Telemetry may mean:
The feeder experienced elevated activity.

A human should verify:
Whether the image supports the count,
whether repeated detections were possible,
and whether the alert threshold is appropriate.
```

Avoid statements that convert telemetry directly into certainty.

---

# Phase 5 of 7 — Change the Threshold

The source telemetry can remain unchanged while operational interpretation changes.

Create a new alert result using a threshold of four birds.

```sas
data work.birdfeeder_alerts;
   set work.birdfeeder_telemetry;

   if species_count >= 4 then
      alert_flag = 'YES';
   else
      alert_flag = 'NO';
run;

proc print data=work.birdfeeder_alerts noobs;
   var timestamp
       event_id
       species_detected
       species_count
       operational_state
       alert_flag;
   title "Lesson 03 - Alert Threshold Set to Four";
run;

title;
```

Compare the original and revised alert flags.

Operational lesson:

```text
The telemetry did not change.
The threshold changed.
The operational interpretation changed.
```

Ask:

- Did the underlying event change?
- Did the alert decision change?
- Who selected the threshold?
- What evidence should support that threshold?
- What could happen if the threshold is too low or too high?

Thresholds are operational decisions, not natural facts.

---

# Phase 6 of 7 — Compare Summary Data with Event Data

Run:

```sas
proc means data=work.birdfeeder_telemetry mean maxdec=2;
   var species_count;
   title "Lesson 03 - Average Bird Count";
run;

title;
```

The average bird count for the three events is approximately:

```text
1.67 birds
```

That result is mathematically valid.

It is not a literal event that occurred.

No event contained 1.67 birds.

Operational lesson:

```text
Summary data and event-level telemetry answer different questions.
```

The average describes the dataset.

The individual rows describe specific operational events.

Ask:

- Could the average hide the high-activity event?
- Could it hide the no-activity event?
- Which view is better for immediate investigation?
- Which view is better for broader comparison?

Neither view is automatically superior.

They serve different purposes.

---

# Phase 7 of 7 — Interpret Quiet Telemetry

Review the `NO_ACTIVITY` event.

```sas
proc print data=work.birdfeeder_telemetry noobs;
   where operational_state = 'NO_ACTIVITY';

   var timestamp
       event_id
       species_detected
       species_count
       confidence_score
       movement_detected
       operational_state
       alert_flag;

   title "Lesson 03 - Quiet Telemetry Review";
run;

title;
```

`NO_ACTIVITY` may indicate:

- normal quiet conditions
- an expected gap in activity
- environmental change
- an obstructed view
- a failed sensor
- a failed data feed
- a detection-model limitation

The record alone does not establish which explanation is correct.

Ask:

- Was quiet activity expected at this time?
- Was the sensor still reporting?
- Was movement detection working?
- Was the camera view obstructed?
- Did surrounding events also become quiet?
- What should a human inspect next?

Operational silence can be meaningful.

It can also be misleading.

---

# Independent Review

Choose one event and write a short operational review using this structure:

```text
Telemetry shows:
This may matter because:
A human should verify:
```

Example:

```text
Telemetry shows:
A high-activity event with three detected cardinals,
movement present, and confidence of 0.94.

This may matter because:
The event exceeded the original attention threshold.

A human should verify:
Whether the count is visually supported,
whether duplicate detection occurred,
and whether the selected threshold reflects a real operational need.
```

The review should report evidence without overstating certainty.

---

# Lesson 03 Success

Lesson 03 is complete when the learner can say:

> I can use SAS telemetry output to identify operational conditions, question thresholds, distinguish summaries from events, and identify what a human should verify.

The learner should be able to explain:

- why readable telemetry matters
- why an alert is not the same as a confirmed problem
- how thresholds change interpretation
- why averages can hide operational behavior
- why inactivity can be meaningful
- why human review remains necessary

The instructor or AI assistant should explicitly state:

```text
You have completed the core operational objectives of Lesson 03.
```

---

# Restart Checkpoint

When returning after interruption:

1. Recreate `work.birdfeeder_telemetry` from Phase 1.
2. Reapply the format from Phase 2.
3. Continue from the phase where work stopped.

Do not assume that prior SAS WORK datasets remain available.

---

# What You Just Did

You moved from observing telemetry to interpreting it operationally.

You:

- made telemetry human-readable
- summarized operational states
- reviewed individual evidence
- changed an alert threshold
- compared summaries with event-level data
- treated inactivity as an operational condition
- preserved human judgment and accountability

This is the transition from telemetry analysis to operational use.

---

# Next Step

Continue to:

```text
AF002_LESSON_04.md
```

Retrieve the lesson from the authoritative location in `LIBRARY.md`.

---

End of Lesson 03
