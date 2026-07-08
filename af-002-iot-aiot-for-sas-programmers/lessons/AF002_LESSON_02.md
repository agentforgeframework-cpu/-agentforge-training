# Lesson 02 — Understand Event Streams

**Kit Type:** Training Kit  
**Status:** Production Candidate  
**Version:** 1.0  
**Repository:** AF-002 - IoT/AIoT for SAS Programmers  
**Repository Object:** ROOT_LIBRARY  
**Raw:** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/LIBRARY.md  
**This File (Raw):** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_02.md  

---

# Purpose

Lesson 02 introduces event streams and real-time operational thinking.

The learner will use standardized SAS data to:

- create a small operational event stream
- simulate a newly arriving event
- update stored analytical state
- compare incremental updates with full recalculation
- distinguish cumulative streams from rolling windows
- visualize operational change over time

No live camera, Python program, cloud service, or streaming platform is required for the main lesson path.

---

# AI Assistant Guidance

When assisting with this lesson:

- keep the examples SAS-centered
- use the standardized teaching data
- do not introduce Kafka, cloud streaming, or distributed architecture
- do not introduce automated decision loops; those belong later in the course
- explain event streams as ordered operational activity over time
- explain real-time thinking as reasoning about what changed and what matters now
- use visible SAS output as the operational source of truth
- move forward only after the learner confirms the expected output

The goal is not to teach streaming infrastructure.

The goal is to show how continuously arriving data changes analytical handling.

---

# Learning Objectives

By the end of this lesson, the learner should be able to:

- explain an event stream in practical terms
- explain real-time operational thinking
- describe why timestamps matter
- distinguish cumulative streams from rolling windows
- identify results that can be updated incrementally
- identify results that require more state or full recalculation
- use SAS to inspect and update simple event data
- validate incremental logic against full recalculation

---

# Core Idea

Lesson 01 established this workflow:

```text
visual input
    -> telemetry
        -> CSV data
            -> SAS analysis
```

Lesson 02 adds continuing arrival and change:

```text
new event arrives
    -> operational state changes
        -> analysis may need to update
```

The central question is:

```text
Can this result be safely updated from the new event,
or must it be recalculated from broader data?
```

---

# What Is an Event Stream?

An event stream is a sequence of operational events arriving over time.

An event might represent:

- a sensor reading
- a badge scan
- a door opening
- a machine status change
- a server measurement
- an object detection
- a temperature reading

In a static dataset, the rows already exist.

In an event stream, new rows continue to arrive.

A static analysis often asks:

```text
What happened?
```

An operational stream may ask:

```text
What is happening now?
What changed?
Is the current state still acceptable?
```

---

# What Is Real-Time Thinking?

Real-time thinking does not always mean instantaneous processing.

In this lesson, it means:

```text
reasoning about data while operational conditions are still changing
```

For a SAS programmer, that means asking:

- Did a new event arrive?
- When did it arrive?
- What state did it change?
- Can the current result be updated safely?
- Is full recalculation required?
- Do older records remain relevant?
- Is the data cumulative, or does it use a rolling window?

---

# Why Timestamps Matter

Without time, rows are records.

With time, rows become ordered events.

SAS uses three primary time-related value types:

| Concept  |               SAS representation | Practical use        |
| -------- | -------------------------------: | -------------------- |
| Date     |             Days since 01JAN1960 | Calendar date        |
| Time     |           Seconds since midnight | Time of day          |
| Datetime | Seconds since 01JAN1960:00:00:00 | Full event timestamp |

Common formats include:

```sas
format event_dttm datetime19.;
format event_date date9.;
format event_time time8.;
```

The timestamp establishes event order and supports reasoning about recency, staleness, rolling windows, and current state.

---

# Create Standard Event Data

Run:

```sas
title "AF-002 Lesson 02 - Standard Event Stream Data";

data work.sensor_events;
   length sensor_id $12 location $12 status $8;
   format event_dttm datetime19.;

   input
      event_id
      event_dttm :anydtdtm.
      sensor_id $
      location $
      reading_value
      status $
   ;

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

Expected result:

- 10 event rows
- ordered datetime values
- three sensors
- numeric readings
- `OK` and `WARN` statuses

Continue when the rows are visible.

---

# Create Frequency State

Run:

```sas
title "Current Frequency State";

proc freq data=work.sensor_events noprint;
   tables status / out=work.status_freq;
   tables sensor_id / out=work.sensor_freq;
run;

proc print data=work.status_freq;
   title "Status Frequency State";
run;

proc print data=work.sensor_freq;
   title "Sensor Frequency State";
run;

title;
```

The resulting datasets represent stored analytical state.

When one new event arrives, some values can be updated without rerunning the complete original analysis.

---

# Create Summary State

Run:

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
   title "Sensor Summary State";
run;

title;
```

If a new reading arrives for an existing sensor, these values can often be updated from stored state:

- N
- Sum
- Min
- Max
- Mean, when N and Sum are preserved

---

# Simulate a New Event

Run:

```sas
data work.new_event;
   length sensor_id $12 location $12 status $8;
   format event_dttm datetime19.;

   input
      event_id
      event_dttm :anydtdtm.
      sensor_id $
      location $
      reading_value
      status $
   ;

   datalines;
11 12MAY2026:09:10:00 SENSOR_A LAB 81.4 WARN
;
run;

proc print data=work.new_event;
   title "New Event Arrived";
run;

title;
```

Expected result:

```text
One new SENSOR_A event with WARN status and reading value 81.4
```

---

# Update Frequency State

The new event adds one `WARN` record and increases the total number of events by one.

Run:

```sas
proc sql noprint;
   select count(*) into :old_total trimmed
   from work.sensor_events;

   select count(*) into :new_total trimmed
   from work.new_event;
quit;

%let updated_total = %eval(&old_total + &new_total);

data work.status_freq_updated;
   set work.status_freq;

   if status = "WARN" then count = count + 1;

   percent = count / &updated_total * 100;
run;

proc print data=work.status_freq_updated;
   title "Updated Status Frequency State";
run;

title;
```

This demonstrates an incrementally maintainable result:

- the `WARN` count increases
- the total increases
- percentages are recalculated

---

# Update Summary State

The new event belongs to `SENSOR_A` and has a reading of `81.4`.

Run:

```sas
data work.sensor_summary_updated;
   if _n_ = 1 then
      set work.new_event(
         keep=sensor_id reading_value
         rename=(
            sensor_id=new_sensor_id
            reading_value=new_value
         )
      );

   set work.sensor_summary;

   if sensor_id = new_sensor_id then do;
      N = N + 1;
      Sum_Value = Sum_Value + new_value;
      Min_Value = min(Min_Value, new_value);
      Max_Value = max(Max_Value, new_value);
      Mean_Value = Sum_Value / N;
   end;

   drop new_sensor_id new_value;
run;

proc print data=work.sensor_summary_updated;
   title "Updated Sensor Summary State";
run;

title;
```

For `SENSOR_A`:

- N increases by one
- Sum increases by `81.4`
- Min remains or changes appropriately
- Max updates if needed
- Mean is recalculated from the updated Sum and N

---

# Which Results Can Be Updated?

## Often Incrementally Maintainable

These can often be updated when the necessary supporting state is stored:

- count
- total N
- sum
- min
- max
- mean, when N and Sum are stored
- simple frequency counts
- percentages based on updated counts
- threshold counts
- latest timestamp

## Requires More State or Caution

These may be maintainable only when additional detail is preserved:

- median
- mode
- percentiles
- distinct counts
- rolling-window summaries
- skewness
- kurtosis
- complex data-quality measures

## Often Recalculated or Handled by Specialized Methods

These typically require broader recomputation or specialized incremental algorithms:

- regression models
- clustering
- statistical tests
- model-fit statistics
- global optimization
- full distributional analysis

Operational rule:

```text
Update what the stored state supports safely.
Recalculate what the stored state cannot support.
```

---

# Cumulative Streams and Rolling Windows

The current example is cumulative:

```text
new event arrives
    -> add it to the current state
```

Many operational systems use rolling windows instead.

Examples include:

- the last five minutes
- the last hour
- the current shift
- the current production run
- the current day

A rolling window behaves like this:

```text
new event arrives
    -> add it

old event expires
    -> remove it or recalculate the active window
```

Rolling windows require enough retained detail to identify and remove expired records, or they require recalculation from the active event data.

Do not assume every stream is cumulative.

---

# Validate with Full Recalculation

Incremental logic should be checked against full recalculation.

Run:

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
   title "Recalculated Sensor Summary";
run;

title;
```

Compare:

```text
work.sensor_summary_updated
```

with:

```text
work.sensor_summary_recalculated
```

For this example, the values should agree.

Operational lesson:

```text
Incremental update logic earns confidence through validation.
```

---

# Visualize the Stream

Run:

```sas
title "Sensor Readings Over Time";

proc sgplot data=work.sensor_events_plus_one;
   series x=event_dttm y=reading_value / group=sensor_id;
run;

title;
```

The graph makes changing operational behavior visible.

`SENSOR_A` trends upward and enters repeated `WARN` conditions.

---

# Tie Back to Lesson 01

Lesson 01 telemetry contains fields such as:

```text
timestamp
frame_number
object_detected
confidence
detection_count
source
```

The same stream-aware thinking applies:

- total event count can be updated
- object frequencies can be updated
- latest timestamp can be updated
- confidence sum and N can support an updated mean
- min and max confidence can be updated
- median confidence usually cannot be updated safely from simple summary state alone

Lesson 01 showed that telemetry exists.

Lesson 02 shows that continuing telemetry changes how analysis may be maintained.

---

# Learner Exercise

Create a second new event:

```text
12 12MAY2026:09:11:00 SENSOR_D STORAGE 55.0 OK
```

Complete these tasks:

1. Create the event as `work.new_event_2`.
2. Update the sensor frequency state.
3. Determine whether the existing summary can be updated directly.
4. Add a new summary row for `SENSOR_D` if needed.
5. Append the event to the detailed data.
6. Perform a full recalculation.
7. Compare the incremental and recalculated results.

Answer:

- What changed because `SENSOR_D` was new?
- Which results were easy to update?
- Which required special handling?
- Did the incremental result match full recalculation?

---

# Troubleshooting

## Datetime values are not readable

Apply:

```sas
format event_dttm datetime19.;
```

## The expected row does not update

Check spelling and capitalization.

```text
SENSOR_A
```

is different from:

```text
Sensor_A
```

## Percentages are incorrect

Confirm that the updated total is 11 after adding one event to the original 10.

## Mean is incorrect

Confirm that both N and Sum are stored and updated before recalculating Mean.

## Median or mode appears easy to update

Pause and determine whether the retained state actually contains enough information.

Do not infer maintainability from convenience.

---

# Lesson 02 Success

Lesson 02 is complete when you can say:

> I used SAS to compare incremental update logic with full recalculation for continuously arriving event data.

You should be able to explain:

- what an event stream is
- why timestamps matter
- which summaries are easily maintained
- why rolling windows are different
- why incremental results must be validated

---

# Restart Checkpoint

When returning after an interruption, rerun these sections:

1. Create `work.sensor_events`.
2. Create `work.status_freq` and `work.sensor_freq`.
3. Create `work.sensor_summary`.
4. Create `work.new_event`.

Then continue with the update and validation sections.

No external files are required for the main lesson path.

---

# What You Just Did

You treated event data as changing operational state.

You stored frequency and summary results as SAS datasets.

You simulated a new event.

You updated maintainable state.

You compared the updated state with full recalculation.

You saw why continuously arriving data changes analytical handling.

---

# Next Step

When the Lesson 02 success conditions are complete, state:

```text
LESSON 02 COMPLETE
```

Retrieve and verify `AF002_LESSON_03.md` through the authoritative routing defined in `SETUP.md` and `LIBRARY.md`.

Display the minimum identity check, then state:

```text
LESSON 03 VERIFIED — BEGINNING LESSON 03
```

Declare Lesson 03 active and begin instruction from that retrieved file.

If retrieval or identity verification fails, stop and follow the failure rules in `SETUP.md`.

---

End of Lesson 02
