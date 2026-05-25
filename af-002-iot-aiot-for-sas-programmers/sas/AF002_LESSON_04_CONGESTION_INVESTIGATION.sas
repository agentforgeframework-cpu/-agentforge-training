/*-----------------------------------------------------------------------------
AF002_LESSON_04_CONGESTION_INVESTIGATION.sas

AF-002 — IoT/AIoT for SAS Programmers
Lesson 04 — Congestion Escalation Investigation

Purpose:
Show a simple operational escalation:
Forklift and pedestrian activity in the SHARED zone spikes every morning.

Important:
The source telemetry is intentionally "clean" raw detection data.
It does NOT contain a precomputed overlap flag.

SAS derives the operational insight from:
- object_type
- zone
- event_window
- timestamp

Operational doctrine:
- Telemetry is evidence, not truth.
- Identities are intentionally blinded.
- The data shows "person", not Bob, Sam, or Mary.
- Humans interpret operational meaning.
-----------------------------------------------------------------------------*/

title "Lesson 04 - Congestion Escalation";

/* Preferred local CSV import.
   Update DATAFILE if your local folder structure differs. */

/*
proc import datafile="data/sample_spatial_telemetry_congestion_clean.csv"
    out=work.spatial_congestion_raw
    dbms=csv
    replace;
    guessingrows=max;
run;
*/

/* Fallback embedded raw detection data. */

data work.spatial_congestion_raw;
    length object_type $20 zone $20 event_window $20 camera_id $12 notes $80;
    format timestamp datetime19.;

    infile datalines dsd dlm='|' truncover;

    input
        timestamp :anydtdtm.
        frame_number
        object_type $
        confidence
        x1 y1 x2 y2
        center_x center_y
        zone $
        event_window $
        camera_id $
        notes $
    ;

datalines;
2026-05-24T07:30:00|970|forklift|0.91|125|210|315|390|220|300|FORKLIFT|07:30-07:40|CAM-03|normal forklift lane
2026-05-24T07:33:00|971|person|0.93|420|150|510|340|465|245|PEDESTRIAN|07:30-07:40|CAM-03|normal pedestrian path
2026-05-24T07:36:00|972|pallet|0.88|620|250|760|390|690|320|LOADING|07:30-07:40|CAM-03|normal loading activity
2026-05-24T07:38:00|973|person|0.9|510|165|600|350|555|258|SHARED|07:30-07:40|CAM-03|single pedestrian crossing shared zone
2026-05-24T07:40:00|980|forklift|0.9|130|215|320|395|225|305|FORKLIFT|07:40-07:50|CAM-03|normal forklift lane
2026-05-24T07:43:00|981|person|0.92|430|150|520|350|475|250|PEDESTRIAN|07:40-07:50|CAM-03|normal pedestrian movement
2026-05-24T07:46:00|982|pallet|0.89|630|250|770|390|700|320|LOADING|07:40-07:50|CAM-03|normal loading activity
2026-05-24T07:48:00|983|forklift|0.89|330|220|520|405|425|312|SHARED|07:40-07:50|CAM-03|single forklift crossing shared zone
2026-05-24T07:52:00|990|forklift|0.91|120|210|310|390|215|300|FORKLIFT|07:50-08:00|CAM-03|normal pre-shift movement
2026-05-24T07:54:00|991|person|0.92|430|150|520|350|475|250|PEDESTRIAN|07:50-08:00|CAM-03|normal pedestrian movement
2026-05-24T07:56:00|992|pallet|0.88|620|250|760|390|690|320|LOADING|07:50-08:00|CAM-03|normal loading activity
2026-05-24T07:58:00|993|person|0.9|505|160|595|350|550|255|SHARED|07:50-08:00|CAM-03|single pedestrian crossing shared zone
2026-05-24T08:00:00|1000|person|0.94|500|160|590|350|545|255|SHARED|08:00-08:10|CAM-03|morning pedestrian traffic
2026-05-24T08:02:00|1001|forklift|0.89|300|220|500|410|400|315|SHARED|08:00-08:10|CAM-03|forklift moving through shared zone
2026-05-24T08:03:00|1002|person|0.91|525|165|615|355|570|260|SHARED|08:00-08:10|CAM-03|morning pedestrian traffic
2026-05-24T08:04:00|1003|forklift|0.87|320|225|520|415|420|320|SHARED|08:00-08:10|CAM-03|forklift near pedestrian traffic
2026-05-24T08:06:00|1004|pallet|0.86|640|250|780|390|710|320|LOADING|08:00-08:10|CAM-03|loading continues during morning traffic
2026-05-24T08:08:00|1005|person|0.93|570|172|660|362|615|267|SHARED|08:00-08:10|CAM-03|morning pedestrian traffic
2026-05-24T08:10:00|1010|person|0.92|505|160|595|350|550|255|SHARED|08:10-08:20|CAM-03|late morning pedestrian traffic
2026-05-24T08:11:00|1011|forklift|0.88|315|220|515|410|415|315|SHARED|08:10-08:20|CAM-03|forklift near shared area
2026-05-24T08:12:00|1012|person|0.89|520|164|610|354|565|259|SHARED|08:10-08:20|CAM-03|late morning pedestrian traffic
2026-05-24T08:15:00|1013|forklift|0.9|330|228|530|418|430|323|SHARED|08:10-08:20|CAM-03|forklift crossing shared path
2026-05-24T08:16:00|1014|person|0.91|548|169|638|359|593|264|SHARED|08:10-08:20|CAM-03|late morning pedestrian traffic
2026-05-24T08:18:00|1015|pallet|0.84|650|255|790|395|720|325|LOADING|08:10-08:20|CAM-03|normal loading activity
2026-05-24T08:21:00|1020|forklift|0.92|130|215|320|395|225|305|FORKLIFT|08:20-08:30|CAM-03|traffic returns to normal
2026-05-24T08:24:00|1021|person|0.93|420|150|510|340|465|245|PEDESTRIAN|08:20-08:30|CAM-03|normal pedestrian path
2026-05-24T08:27:00|1022|pallet|0.89|620|250|760|390|690|320|LOADING|08:20-08:30|CAM-03|normal loading activity
2026-05-24T08:29:00|1023|forklift|0.88|325|225|515|410|420|318|SHARED|08:20-08:30|CAM-03|single forklift crossing shared zone
2026-05-24T08:30:00|1030|forklift|0.91|150|215|340|395|245|305|FORKLIFT|08:30-08:40|CAM-03|normal forklift lane
2026-05-24T08:33:00|1031|person|0.92|425|150|515|340|470|245|PEDESTRIAN|08:30-08:40|CAM-03|normal pedestrian path
2026-05-24T08:36:00|1032|pallet|0.88|635|250|775|390|705|320|LOADING|08:30-08:40|CAM-03|normal loading activity
2026-05-24T08:38:00|1033|person|0.9|515|165|605|350|560|258|SHARED|08:30-08:40|CAM-03|single pedestrian crossing shared zone
2026-05-24T08:40:00|1040|forklift|0.9|145|216|335|396|240|306|FORKLIFT|08:40-08:50|CAM-03|normal forklift lane
2026-05-24T08:43:00|1041|person|0.92|435|152|525|342|480|247|PEDESTRIAN|08:40-08:50|CAM-03|normal pedestrian path
2026-05-24T08:46:00|1042|pallet|0.89|640|252|780|392|710|322|LOADING|08:40-08:50|CAM-03|normal loading activity
2026-05-24T08:48:00|1043|forklift|0.89|330|225|520|410|425|318|SHARED|08:40-08:50|CAM-03|single forklift crossing shared zone
;
run;

title "Raw Telemetry Review";
proc print data=work.spatial_congestion_raw;
run;

/* Derive a window-level operational summary.
   This is where SAS turns raw detections into operational evidence. */

proc sql;
    create table work.window_summary as
    select
        event_window,
        sum(zone = "SHARED" and object_type = "forklift") as shared_forklift_detections,
        sum(zone = "SHARED" and object_type = "person") as shared_person_detections,
        sum(zone = "SHARED" and object_type in ("forklift", "person")) as shared_movement_detections,
        count(*) as total_detections
    from work.spatial_congestion_raw
    group by event_window
    order by event_window;
quit;

data work.window_summary;
    set work.window_summary;
    if shared_forklift_detections > 0 and shared_person_detections > 0 then overlap_window = "YES";
    else overlap_window = "NO";
run;

title "Morning Shared-Zone Summary Derived by SAS";
proc print data=work.window_summary noobs;
run;

title "Shared Forklift and Person Detections by Time Window";
proc sgplot data=work.window_summary;
    vbar event_window / response=shared_forklift_detections
        legendlabel="Forklift in Shared Zone"
        discreteoffset=-0.18
        barwidth=0.35;
    vbar event_window / response=shared_person_detections
        legendlabel="Person in Shared Zone"
        discreteoffset=0.18
        barwidth=0.35;
    yaxis label="Detection Count";
    xaxis label="Time Window";
run;

title "Derived Overlap Windows";
proc freq data=work.window_summary;
    tables event_window*overlap_window / norow nocol nopercent;
run;

title;
