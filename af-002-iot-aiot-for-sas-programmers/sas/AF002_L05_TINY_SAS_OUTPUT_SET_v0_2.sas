/*==============================================================================
AF002 Lesson 05 - Tiny SAS Operational Output Set
Course: AF-002 - IoT and AIoT for SAS Programmers
Lesson: 05 Capstone
File: AF002_L05_TINY_SAS_OUTPUT_SET_v0_2.sas

Purpose:
Create a small, runnable SAS output set for Lesson 05 using inline telemetry.
The outputs support operational investigation of queue growth, timestamp delay,
localized congestion, telemetry freshness, and intervention window impact.

Designed for:
SAS OnDemand for Academics / SAS Studio

Development & Test Environment:
Platform: ChatGPT
Model: GPT-5.5 Thinking
Date: 2026-05-26
Notes:
Corrected SAS program generated for AF002 Lesson 05 v0.1.1 artifact development. Plain ASCII titles used for SAS ODA compatibility.
==============================================================================*/

options nodate nonumber;
title;
footnote;

/*------------------------------------------------------------------------------
INPUT OPTIONS

Use only one input option.

OPTION 1 — REPOSITORY CSV

To use the repository CSV:
1. Remove the surrounding comment markers from Option 1.
2. Comment out Option 2, the embedded DATALINES block.

Update the file path when required by the local SAS environment.

OPTION 2 — EMBEDDED TEACHING DATA

This is the default input path.

No external CSV file is required.

To use Option 1 instead, comment out this entire DATA step.

------------------------------------------------------------------------------*/

/*
%let L05_TELEMETRY_CSV =
    data/AF002_L05_TELEMETRY_SAMPLE_v0_1.csv;

data work.l05_telemetry;
    infile "&L05_TELEMETRY_CSV"
        dsd
        dlm=','
        firstobs=2
        truncover
        lrecl=32767
    ;

    length
        camera_id $8
        zone $20
        object_type $12
        event_window $12
        operator_observation $40
    ;

    informat
        event_capture_time anydtdtm.
        telemetry_buffer_time anydtdtm.
        dashboard_refresh_time anydtdtm.
    ;

    format
        event_capture_time datetime19.
        telemetry_buffer_time datetime19.
        dashboard_refresh_time datetime19.
    ;

    input
        event_capture_time :anydtdtm.
        telemetry_buffer_time :anydtdtm.
        dashboard_refresh_time :anydtdtm.
        camera_id :$8.
        zone :$20.
        object_type :$12.
        queue_depth
        forklift_active_count
        staffing_level
        confidence
        event_window :$12.
        operator_observation :$40.
    ;

    buffer_delay_minutes =
        intck(
            'second',
            event_capture_time,
            telemetry_buffer_time
        ) / 60;

    dashboard_delay_minutes =
        intck(
            'second',
            event_capture_time,
            dashboard_refresh_time
        ) / 60;

    queue_growth_since_prior = .;
run;
*/


/*------------------------------------------------------------------------------
Step 1: Load inline telemetry sample data
------------------------------------------------------------------------------*/

data work.l05_telemetry;
    infile datalines dsd dlm='|' truncover;
    length
        camera_id $8
        zone $20
        object_type $12
        event_window $12
        operator_observation $40
    ;

    informat
        event_capture_time anydtdtm.
        telemetry_buffer_time anydtdtm.
        dashboard_refresh_time anydtdtm.
    ;

    format
        event_capture_time datetime19.
        telemetry_buffer_time datetime19.
        dashboard_refresh_time datetime19.
    ;

    input
        event_capture_time :anydtdtm.
        telemetry_buffer_time :anydtdtm.
        dashboard_refresh_time :anydtdtm.
        camera_id :$8.
        zone :$20.
        object_type :$12.
        queue_depth
        forklift_active_count
        staffing_level
        confidence
        event_window :$12.
        operator_observation :$40.
    ;

    buffer_delay_minutes =
        intck('second', event_capture_time, telemetry_buffer_time) / 60;

    dashboard_delay_minutes =
        intck('second', event_capture_time, dashboard_refresh_time) / 60;

    queue_growth_since_prior = .;

datalines;
2026-05-26 08:00:00|2026-05-26 08:02:00|2026-05-26 08:06:00|CAM-01|DOCK-03|FORKLIFT|2|3|5|0.94|5_MIN_AGG|slower unloading observed
2026-05-26 08:02:00|2026-05-26 08:04:00|2026-05-26 08:08:00|CAM-02|DOCK-03|FORKLIFT|3|2|5|0.92|5_MIN_AGG|dock congestion developing
2026-05-26 08:04:00|2026-05-26 08:08:00|2026-05-26 08:09:00|CAM-03|DOCK-03|FORKLIFT|4|3|5|0.92|5_MIN_AGG|dock congestion developing
2026-05-26 08:06:00|2026-05-26 08:10:00|2026-05-26 08:11:00|CAM-01|DOCK-03|FORKLIFT|5|3|6|0.89|5_MIN_AGG|temporary reroute
2026-05-26 08:08:00|2026-05-26 08:11:00|2026-05-26 08:14:00|CAM-02|DOCK-07|FORKLIFT|7|2|5|0.93|5_MIN_AGG|slower unloading observed
2026-05-26 08:10:00|2026-05-26 08:14:00|2026-05-26 08:16:00|CAM-03|DOCK-07|FORKLIFT|9|3|5|0.96|5_MIN_AGG|monitoring queue growth
2026-05-26 08:12:00|2026-05-26 08:17:00|2026-05-26 08:19:00|CAM-01|DOCK-07|FORKLIFT|12|3|5|0.91|5_MIN_AGG|dock congestion developing
2026-05-26 08:14:00|2026-05-26 08:18:00|2026-05-26 08:21:00|CAM-02|DOCK-07|FORKLIFT|14|4|6|0.97|5_MIN_AGG|temporary reroute
2026-05-26 08:16:00|2026-05-26 08:20:00|2026-05-26 08:23:00|CAM-03|NORTH-STAGING|FORKLIFT|17|3|5|0.90|5_MIN_AGG|dock congestion developing
2026-05-26 08:18:00|2026-05-26 08:23:00|2026-05-26 08:25:00|CAM-01|NORTH-STAGING|FORKLIFT|18|3|5|0.95|5_MIN_AGG|monitoring queue growth
2026-05-26 08:20:00|2026-05-26 08:24:00|2026-05-26 08:27:00|CAM-02|DOCK-03|FORKLIFT|19|2|5|0.94|5_MIN_AGG|slower unloading observed
2026-05-26 08:22:00|2026-05-26 08:26:00|2026-05-26 08:29:00|CAM-03|DOCK-07|FORKLIFT|20|3|6|0.98|5_MIN_AGG|temporary reroute
;
run;


/*------------------------------------------------------------------------------
Step 2: Add queue growth calculation
------------------------------------------------------------------------------*/

proc sort data=work.l05_telemetry;
    by event_capture_time;
run;

data work.l05_telemetry;
    set work.l05_telemetry;
    prior_queue_depth = lag(queue_depth);

    if _n_ = 1 then queue_growth_since_prior = .;
    else queue_growth_since_prior = queue_depth - prior_queue_depth;

    label
        event_capture_time       = "Event Capture Time"
        telemetry_buffer_time    = "Telemetry Buffer Time"
        dashboard_refresh_time   = "Dashboard Refresh Time"
        queue_depth              = "Queue Depth"
        forklift_active_count    = "Active Forklifts"
        staffing_level           = "Staffing Level"
        buffer_delay_minutes     = "Buffer Delay (Minutes)"
        dashboard_delay_minutes  = "Dashboard Delay (Minutes)"
        queue_growth_since_prior = "Queue Growth Since Prior Event"
        operator_observation     = "Operator Observation"
    ;
run;


/*------------------------------------------------------------------------------
Output 1: Queue Depth Timeline
Operational Question:
Was the queue buildup sudden, or was it visible earlier in the event data?
------------------------------------------------------------------------------*/

title "AF002 Lesson 05 - Queue Depth Timeline";
title2 "Operational telemetry shows queue buildup over event capture time";

proc sgplot data=work.l05_telemetry;
    series x=event_capture_time y=queue_depth / markers;
    xaxis label="Event Capture Time";
    yaxis label="Queue Depth";
run;


/*------------------------------------------------------------------------------
Output 2: Timestamp Comparison Table
Operational Question:
Which timestamp matters for operational response?
------------------------------------------------------------------------------*/

title "AF002 Lesson 05 - Timestamp Comparison";
title2 "Event capture, telemetry buffer, and dashboard refresh do not represent the same moment";

proc print data=work.l05_telemetry noobs label;
    var event_capture_time telemetry_buffer_time dashboard_refresh_time
        buffer_delay_minutes dashboard_delay_minutes queue_depth zone;
run;


/*------------------------------------------------------------------------------
Output 3: Queue Growth by Zone
Operational Question:
Does aggregation hide localized congestion behavior?
------------------------------------------------------------------------------*/

title "AF002 Lesson 05 - Queue Depth by Zone";
title2 "Localized operational views can show variation hidden in summary dashboards";

proc sgplot data=work.l05_telemetry;
    vbar zone / response=queue_depth stat=mean datalabel;
    xaxis label="Warehouse Zone";
    yaxis label="Average Queue Depth";
run;


/*------------------------------------------------------------------------------
Output 4: Operational Delay Summary
Operational Question:
How much delay exists between event capture and dashboard visibility?
------------------------------------------------------------------------------*/

title "AF002 Lesson 05 - Operational Delay Summary";
title2 "Telemetry freshness affects operational intervention timing";

proc means data=work.l05_telemetry n mean min max maxdec=2;
    var buffer_delay_minutes dashboard_delay_minutes queue_growth_since_prior;
run;


/*------------------------------------------------------------------------------
Output 5: Intervention Window Observation
Operational Question:
What does this mean operationally?
------------------------------------------------------------------------------*/

data work.l05_intervention_summary;
    set work.l05_telemetry;
    length intervention_note $120;

    if dashboard_delay_minutes >= 7 and queue_growth_since_prior >= 2 then
        intervention_note =
            "Potential shrinking intervention window: queue rising before dashboard visibility.";
    else if dashboard_delay_minutes >= 6 then
        intervention_note =
            "Dashboard visibility delayed; monitor timing before operational escalation.";
    else
        intervention_note =
            "Delay present but not yet operationally concerning.";

    label intervention_note = "Operational Interpretation";
run;

title "AF002 Lesson 05 - Intervention Window Notes";
title2 "Telemetry delay can reduce the time humans have to respond";

proc print data=work.l05_intervention_summary noobs label;
    var event_capture_time zone queue_depth queue_growth_since_prior
        dashboard_delay_minutes operator_observation intervention_note;
run;


/*------------------------------------------------------------------------------
Closing Note for Learner
------------------------------------------------------------------------------*/

title "AF002 Lesson 05 - Operational Takeaway";

data _null_;
    file print;
    put "The data does not prove the full operational story by itself.";
    put "It does show that queue growth was visible before the dashboard fully reflected it.";
    put "This creates a better operational question:";
    put "'Are our dashboards optimized for executive status, operational intervention, or both?'";
run;

title;
footnote;
