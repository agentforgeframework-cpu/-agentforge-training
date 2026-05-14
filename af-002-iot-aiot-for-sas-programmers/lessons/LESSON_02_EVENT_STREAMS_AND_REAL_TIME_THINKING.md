# LESSON 02 — Event Streams and Real-Time Thinking

Course: AF-002 - IoT and AIoT for SAS Programmers

Repository-relative path: `/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_02_EVENT_STREAMS_AND_REAL_TIME_THINKING.md`

GitHub URL:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_02_EVENT_STREAMS_AND_REAL_TIME_THINKING.md

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_02_EVENT_STREAMS_AND_REAL_TIME_THINKING.md

---

# Lesson Purpose

Help the learner understand that continuously arriving data changes how some analyses are performed, and help the learner feel confident working with that operational reality in SAS.

This lesson uses standardized teaching data instead of live camera input so the examples are predictable, repeatable, and easy to test.

In this lesson, you will:

- create a small operational event stream in SAS
- simulate new events arriving
- compare incremental updates against full recalculation
- visualize changing operational behavior over time

You will run SAS code throughout the lesson and paste results into the AI assistant when prompted.

---

# AI Assistant Guidance

If you are assisting a learner with this lesson:

- keep the learner focused on operational thinking
- do not expand into Kafka, cloud streaming, distributed systems, or enterprise architecture
- do not expand into AI decision loops; that belongs in Lesson 03
- do not expand into Architecture Follows Data; that belongs in Lesson 04
- keep examples SAS-centered and DATA step friendly
- use the standardized teaching data unless the learner specifically asks to connect back to Lesson 01 telemetry
- explain event streams as ordered operational activity over time
- explain real-time thinking as reasoning about what is happening now and what changed
- emphasize visible state, restartability, and confidence
- move forward only after the learner can see the SAS output
- verify referenced files and URLs before relying on them
- do not assume previously viewed artifacts remain current
- if the learner pastes SAS output, use the visible output as the operational source of truth


The goal is not to teach streaming infrastructure.

The goal is to show that continuously arriving data can change how analysis should be handled.

---

# Learning Objectives

By the end of this lesson, the learner should be able to:

- explain what an event stream is in practical terms
- explain what real-time thinking means operationally
- recognize why timestamps matter
- distinguish cumulative event streams from rolling event windows
- identify which summary results can be updated from a new record
- identify which analytical results may require recalculation
- use SAS to inspect, summarize, and update simple event data
- recognize compute-savings opportunities from incremental update logic
- feel confident reasoning about continuously arriving operational data in SAS

The lesson begins with simple operational concepts and gradually moves toward stream-aware SAS reasoning.

---

# Core Idea

Lesson 01 showed this pattern:

```text
visual input → telemetry → CSV → SAS analysis
```

Lesson 02 adds time and change:

```text
new event arrives → operational state changes → SAS analysis may need to update
```

The important question becomes:

```text
Can this result be safely updated from the new event,
or does the analysis need to be recalculated from the broader data?
```

That question is the heart of this lesson.

You do not need streaming infrastructure to understand this operational thinking.

---

# EDGE Structure

This lesson follows the EDGE teaching pattern:

```text
Explain → Demonstrate → Guide → Enable
```

- Explain: what event streams and real-time thinking mean
- Demonstrate: show small SAS examples using standardized data
- Guide: walk through which results can and cannot be updated safely
- Enable: give the learner a small independent exercise

You are not expected to memorize terminology.

The goal is to build operational confidence through visible SAS behavior.

---

# Required Supporting Files

This first version of Lesson 02 is self-contained.

The teaching data is included inside the SAS code blocks.

No live webcam, Python script, cloud service, or streaming platform is required.

Optional tie-back files from Lesson 01:

```text
data/webcam_telemetry.csv
data/webcam_telemetry_sample.csv
data/image_telemetry.csv
```

Use those only after the learner understands the standardized example.

This lesson intentionally starts small and controlled so the operational behavior is easy to see and verify.

---

# Local File Map

This lesson primarily uses:

```text
lessons/LESSON_02_EVENT_STREAMS_AND_REAL_TIME_THINKING.md
```

Optional tie-back to Lesson 01 may use:

```text
data/webcam_telemetry.csv
data/webcam_telemetry_sample.csv
data/image_telemetry.csv
```

If the learner creates a SAS program while working through this lesson, a reasonable local filename is:

```text
sas/sas_lesson02_event_streams.sas
```

That file is optional in this first version.

---

# Success Target

You are successful when you can say:

> I understand that continuously arriving data changes how some analyses are performed, and I can reason about that operational reality in SAS.

---

# SECTION 1 — Explain: What Is an Event Stream?

An event stream is a sequence of operational events arriving over time.

An event might be:

- a sensor reading
- a webcam brightness reading
- a badge scan
- a door opening
- a machine status update
- a server CPU measurement
- a temperature reading
- a motion detection value

In a static dataset, the rows already exist.

In an event stream, the rows keep arriving.

That difference matters.

A normal dataset often asks:

```text
What happened?
```

An event stream often asks:

```text
What is happening now?
What just changed?
Is the current state still acceptable?
```

Operational thinking begins when the data is still changing.

---

# SECTION 2 — Explain: What Is Real-Time Thinking?

Real-time thinking does not always mean instantaneous processing.

In this lesson, real-time thinking means:

```text
reasoning about data while operational conditions are still changing
```

For a SAS programmer, this means asking practical questions:

- Did a new record arrive?
- What time did it arrive?
- Does the new record change the current state?
- Can the current summary be updated safely?
- Does this require a full recalculation?
- Is the data cumulative, or do old records expire?

This is not a replacement for traditional SAS analysis.

It is a different operational situation.

Timestamps indicate the order of events, which in turn helps understand the change in operational states.

---

# SECTION 3 — Why Timestamps Matter

Without time, rows are just records.

With time, rows become events.

SAS has three important time-related value types:

| Concept | SAS meaning | Practical use |
|---|---:|---|
| Date | Days since 01JAN1960 | calendar date |
| Time | Seconds since midnight | time of day |
| Datetime | Seconds since 01JAN1960:00:00:00 | event timestamp |

For event streams, datetime values are usually the most useful because they preserve both date and time.

Common SAS formats include:

```sas
format event_dttm datetime19.;
format event_date date9.;
format event_time time8.;
```

Operational point:

```text
The timestamp tells SAS the event order.
```

That order is what allows the SAS analyst to reason about recent activity, stale data, rolling windows, and current state.

Next, you will create a small standardized event stream in SAS and begin working with operational event data directly.

---

# SECTION 4 — Demonstrate: Create Standard Event Data

This teaching data represents simple environmental sensor readings.

It is intentionally small.

It is not meant to be impressive.

It is meant to be clear.

Run this SAS code:

```sas
title "AF-002 Lesson 02 - Standard Event Stream Data";

data work.sensor_events;
   length sensor_id $12 location $12 status $8;
   format event_dttm datetime19.;
   input event_id event_dttm :anydtdtm. sensor_id $ location $ reading_value status $;
   datalines;
1 12MAY2026:09:00:00 SENSOR_A LAB 71.2 OK
2 12MAY2026:09:01:00 SENSOR_A LAB 71.5 OK
3 12MAY2026:09:02:00 SENSOR_B DOOR 64.0 OK
4 12MAY2026:09:03:00 SENSOR_A LAB 72.1 OK
5 12MAY2026:09:04:00 SENSOR_B DOOR 65.8 OK
6 12MAY2026:09:05:00 SENSOR_C COOLER 39.5 OK
7 12MAY2026:09:06:00 SENSOR_A LAB 78.8 WARN
8 12MAY2026:09:07:00 SENSOR_C COOLER 40.1 OK
9 12MAY2026:09:08:00 SENSOR_B DOOR 70.4 WARN
10 12MAY2026:09:09:00 SENSOR_A LAB 80.2 WARN
;
run;

proc print data=work.sensor_events;
   title "Standard Event Stream Rows";
run;

title;
```

Expected visible result:

- 10 event rows
- ordered datetime values
- three sensors
- reading values
- OK and WARN statuses

If you can see the rows, it is safe to continue.

---

# SECTION 5 — Demonstrate: Basic Frequency State

Now summarize the current event state using PROC FREQ.

```sas
title "Current Frequency State";

proc freq data=work.sensor_events noprint;
   tables status / out=work.status_freq;
   tables sensor_id / out=work.sensor_freq;
run;

proc print data=work.status_freq;
   title "Status Frequency Output Stored as a SAS Dataset";
run;

proc print data=work.sensor_freq;
   title "Sensor Frequency Output Stored as a SAS Dataset";
run;

title;
```

Important point:

```text
PROC FREQ output can become current operational state.
```

If one new record arrives, some parts of that state can often be updated without rerunning the full original analysis.

For example:

```text
A new WARN event arrives.
Increase WARN count by 1.
Increase total count by 1.
Recalculate percentages.
```

That is stream-friendly thinking.

---

# SECTION 6 — Demonstrate: Basic Summary State

Now summarize numeric readings using PROC SUMMARY.

```sas
title "Current Summary State";

proc summary data=work.sensor_events nway;
   class sensor_id;
   var reading_value;
   output out=work.sensor_summary(drop=_type_ _freq_)
      n=N
      min=Min_Value
      max=Max_Value
      sum=Sum_Value
      mean=Mean_Value;
run;

proc print data=work.sensor_summary;
   title "PROC SUMMARY Output Stored as a SAS Dataset";
run;

title;
```

This output is also operational state.

If a new reading arrives for an existing sensor, SAS can update several values:

- N
- Sum
- Min
- Max
- Mean, if N and Sum are preserved

That can save compute.

The system does not always need to rerun every analysis from the beginning.

---

# SECTION 7 — Demonstrate: One New Event Arrives

Now simulate one new event.

This is not live streaming infrastructure.

It is a controlled teaching example showing what changes when a new event arrives.

```sas
data work.new_event;
   length sensor_id $12 location $12 status $8;
   format event_dttm datetime19.;
   input event_id event_dttm :anydtdtm. sensor_id $ location $ reading_value status $;
   datalines;
11 12MAY2026:09:10:00 SENSOR_A LAB 81.4 WARN
;
run;

proc print data=work.new_event;
   title "New Event Arrived";
run;

title;
```

Expected visible result:

```text
one new SENSOR_A event with WARN status and reading_value 81.4
```

This is the key moment.

A continuously arriving record may change the operational state.

---

# SECTION 8 — Guide: Update Frequency State from the New Event

The new event has:

```text
status = WARN
```

That means the WARN count should increase by 1.

The total count also increases by 1.

The percentages need to be recalculated.

Run this code:

```sas
proc sql noprint;
   select count(*) into :old_total trimmed
   from work.sensor_events;
quit;

proc sql noprint;
   select count(*) into :new_total trimmed
   from work.new_event;
quit;

%let updated_total = %eval(&old_total + &new_total);

data work.status_freq_updated;
   set work.status_freq;
   length status $8;

   if status = 'WARN' then count = count + 1;

   percent = count / &updated_total * 100;
run;

proc print data=work.status_freq_updated;
   title "Updated Status Frequency State After One New Event";
run;

title;
```

What just happened?

- SAS used the stored PROC FREQ output as current state.
- SAS applied one new event.
- SAS updated the WARN count.
- SAS recalculated the percent values.

This is an example of an incrementally maintainable result.

---

# SECTION 9 — Guide: Update Summary State from the New Event

The new event has:

```text
sensor_id = SENSOR_A
reading_value = 81.4
```

For SENSOR_A, the current summary can be updated.

Run this code:

```sas
data work.sensor_summary_updated;
   if _n_ = 1 then set work.new_event(keep=sensor_id reading_value rename=(sensor_id=new_sensor_id reading_value=new_value));

   set work.sensor_summary;

   if sensor_id = new_sensor_id then do;
      N + 1;
      Sum_Value + new_value;
      Min_Value = min(Min_Value, new_value);
      Max_Value = max(Max_Value, new_value);
      Mean_Value = Sum_Value / N;
   end;

   drop new_sensor_id new_value;
run;

proc print data=work.sensor_summary_updated;
   title "Updated Sensor Summary State After One New Event";
run;

title;
```

What just happened?

- N increased by 1 for SENSOR_A.
- Sum increased by 81.4.
- Min stayed the same unless the new value was lower.
- Max changed if the new value was higher.
- Mean was recalculated from updated Sum and N.

This is still ordinary SAS thinking.

The operational context changed, but the programming ideas are familiar.

---

# SECTION 10 — Guide: Which Results Can Be Updated?

Not all analytical results behave the same way when one new record arrives.

Some results can be safely updated from stored state.

Some results require more stored detail.

Some results should be recalculated from the broader data.

## Often Incrementally Maintainable

These can often be updated safely when the right supporting state is stored:

- count
- total N
- sum
- min
- max
- mean, if N and sum are stored
- simple frequency counts
- percentages based on updated counts
- threshold crossing counts
- latest event timestamp

## Requires Caution or More Stored State

These may be possible, but only if enough supporting detail is preserved:

- mode
- median
- percentiles
- skewness
- kurtosis
- rolling-window summaries
- distinct counts
- complex quality metrics

## Often Recalculated or Handled by Specialized Methods

These usually require broader recomputation or specialized incremental algorithms:

- regression models
- clustering
- statistical tests
- many model-fit statistics
- global optimization results
- full distributional analysis

Practical rule:

```text
If the stored state contains enough information to update the result safely,
incremental updating may be appropriate.

If the stored state does not contain enough information,
recalculate from the needed data.
```

---

# SECTION 11 — Guide: Cumulative Streams vs Rolling Windows

So far, the example has treated data as cumulative.

That means:

```text
new event arrives → add it to the current state
```

But many operational systems have staleness.

A record might only matter for:

- the last 5 minutes
- the last hour
- the current shift
- the current production run
- the current day

That changes the work.

A rolling window behaves more like this:

```text
new event arrives → add it
old event expires → remove it or recompute the active window
```

That is different from simple cumulative updating.

If records fall out of interest after one hour, the system must know which records are still active.

That usually means one of two things:

1. Keep enough detail to remove expired records safely.
2. Recalculate the current window from the detailed event data.

This is an important operational design choice.

Do not treat every stream as cumulative.

---

# SECTION 12 — Demonstrate: Full Recalculation Check

Incremental updates are useful, but they should be validated.

Now append the new event to the original data and rerun PROC FREQ and PROC SUMMARY.

```sas
data work.sensor_events_plus_one;
   set work.sensor_events work.new_event;
run;

title "Full Recalculation After New Event";

proc freq data=work.sensor_events_plus_one;
   tables status sensor_id / nocum;
run;

proc summary data=work.sensor_events_plus_one nway;
   class sensor_id;
   var reading_value;
   output out=work.sensor_summary_recalculated(drop=_type_ _freq_)
      n=N
      min=Min_Value
      max=Max_Value
      sum=Sum_Value
      mean=Mean_Value;
run;

proc print data=work.sensor_summary_recalculated;
   title "Full PROC SUMMARY Recalculation After New Event";
run;

title;
```

Compare the recalculated summary with the updated summary.

Expected result:

```text
For this simple example, the updated state and recalculated state should agree.
```

Operational lesson:

```text
Incremental update logic should be tested against full recalculation.
```

When the result matters, compare incremental logic against full recalculation periodically.
That is how confidence is earned.

---

# SECTION 13 — Demonstrate: Visualize the Event Stream

```sas
title "Sensor Readings Over Time";

proc sgplot data=work.sensor_events_plus_one;
   series x=event_dttm y=reading_value / group=sensor_id;
run;

title;
```

The graph makes operational behavior easier to see.

SENSOR_A trends upward over time.

The WARN condition is no longer just a row in a table.

It becomes visible operational behavior.

---

# SECTION 14 — Optional Tie-Back to Lesson 01 Telemetry

Lesson 01 generated visual telemetry.

That telemetry may contain fields such as:

```text
timestamp
frame_number
width
height
mean_brightness
```

The same thinking applies.

For webcam telemetry:

- frame count can be updated incrementally
- latest timestamp can be updated incrementally
- min brightness can be updated incrementally
- max brightness can be updated incrementally
- mean brightness can be updated if N and sum are stored
- median brightness usually cannot be updated safely from only N, min, max, sum, and mean

This is the bridge from Lesson 01 to Lesson 02:

```text
Lesson 01 showed that telemetry exists.
Lesson 02 shows that continuously arriving telemetry changes how analysis should be handled.
```

Do not spend much time here unless the learner is ready.

The standardized teaching data is the main path for this lesson.

---

# SECTION 15 — Enable: Learner Exercise

Use the same original data.

Create this new event:

```text
12 12MAY2026:09:11:00 SENSOR_D STORAGE 55.0 OK
```

This event introduces a new sensor.

Your task:

1. Add the new event as `work.new_event_2`.
2. Update the sensor frequency state.
3. Decide whether the summary state can be updated directly.
4. If needed, add a new row for SENSOR_D in the summary state.
5. Rerun the full recalculation to check your work.

Questions to answer:

- What changed because SENSOR_D is new?
- Which results were easy to update?
- Which results required special handling?
- Did the incremental update match the full recalculation?

This exercise is intentionally small.

The goal is confidence, not complexity.

---

# SECTION 16 — Visible Success Checklist

You should now have or be able to see:

- the original standardized event rows
- PROC FREQ output stored as SAS datasets
- PROC SUMMARY output stored as a SAS dataset
- one new event
- updated frequency state
- updated summary state
- full recalculation output
- agreement between simple incremental logic and full recalculation for this example

If you can see those outputs, Lesson 02 has achieved its operational purpose.

---

# Troubleshooting

## SAS datetime values do not look readable

Add or confirm this format:

```sas
format event_dttm datetime19.;
```

## The new event does not update the expected row

Check spelling and capitalization.

For example:

```text
SENSOR_A
```

is not the same as:

```text
Sensor_A
```

## Percentages do not add up as expected

Confirm the total record count.

After adding one new event to 10 existing events, the updated total should be:

```text
11
```

## Mean does not update correctly

Confirm that both N and Sum are stored.

Mean can be recalculated from:

```text
updated sum / updated N
```

## Median or mode seems tempting to update

Pause.

Median and mode may require more detail than the stored summary contains.

This is the point of the lesson.

Some results are stream-friendly.

Some are not safe to update from simple summary state alone.

---

# Restart Checkpoint

If you stop here, restart later by opening this lesson file and rerunning:

1. Section 4 — create `work.sensor_events`
2. Section 5 — create frequency state
3. Section 6 — create summary state
4. Section 7 — create `work.new_event`

After those four sections, you can continue with the update examples.

No external files are required for the main path of this lesson.

---

# First Success

You are successful when you can say:

> I used SAS to compare full recalculation with incremental update thinking for continuously arriving event data.

---

# What You Just Did

You treated event data as operational state.

You stored PROC FREQ and PROC SUMMARY output as SAS datasets.

You simulated one new event arriving.

You updated parts of the stored state from that event.

You checked the result against full recalculation.

You saw why continuously arriving data changes how some analyses are performed.

You compared incremental operational thinking against full recalculation.

---

# Recap

Continuously arriving data does not make SAS less relevant.

It makes operational thinking more important.

Some results can be updated from the next event.

Some results need more stored state.

Some results should be recalculated.

A good SAS programmer can tell the difference.

---

# Next Step

After completing this lesson, continue to:

`LESSON_03_AIOT_DECISION_LOOPS.md`

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_03_AIOT_DECISION_LOOPS.md

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_03_AIOT_DECISION_LOOPS.md

---

# Development and Test Environment

- Platform: ChatGPT Web
- Model: GPT-5.5 Thinking
- Date: 2026-05-12
- Notes: First expanded draft created for AF-002 deployment-hardening review. Designed to preserve freeze discipline, use standardized teaching data, and avoid architecture expansion before Iowa SAS User Group readiness.

---

# License

Paul McDonald Open Use License (MIT-style)

© 2026 Paul McDonald


> **Operational Guideline**
>
> Update what you can.
> Recalculate what you must.


This kind of incremental update thinking may feel familiar to experienced SAS programmers using techniques such as:
- PROC APPEND
- MODIFY statements
- maintaining stored summary tables


## Visual Brief

Review visual summary:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/media/AF-002_LESSON_02_VISUAL_BRIEF.png


---

# File Reference Information

GitHub URL:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_02_EVENT_STREAMS_AND_REAL_TIME_THINKING.md

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_02_EVENT_STREAMS_AND_REAL_TIME_THINKING.md

Previous Lesson:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md

Next Lesson:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_03_AIOT_DECISION_LOOPS.md

Return to README:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/README.md
