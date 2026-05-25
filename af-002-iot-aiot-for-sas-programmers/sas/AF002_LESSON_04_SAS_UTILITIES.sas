/*-----------------------------------------------------------------------------
AF002_LESSON_04_SAS_UTILITIES.sas

AF-002 — IoT/AIoT for SAS Programmers
Lesson 04 — Use Spatial Telemetry Operationally

Purpose:
Create WORK.SPATIAL_TELEMETRY for Lesson 04 investigations.

Preferred path:
Read local CSV from /data/sample_spatial_telemetry.csv.

Fallback path:
Use embedded teaching data with DATALINES.

Operational doctrine:
No GitHub runtime dependency is required.
Enterprise SAS environments may restrict outbound internet access.
-----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
OPTION 1 — Preferred local CSV path

Use this when sample_spatial_telemetry.csv is available locally.
Update the DATAFILE path if your folder structure differs.
-----------------------------------------------------------------------------*/

/*
proc import datafile="data/sample_spatial_telemetry.csv"
    out=work.spatial_telemetry
    dbms=csv
    replace;
    guessingrows=max;
run;
*/


/*-----------------------------------------------------------------------------
OPTION 2 — Fallback embedded teaching data

Use this when file upload or local file access is inconvenient.
This creates the working dataset needed for the core lesson examples.
-----------------------------------------------------------------------------*/

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

title "Lesson 04 - Spatial Telemetry";
proc print data=work.spatial_telemetry;
run;

title "Lesson 04 - Objects by Operational Zone";
proc freq data=work.spatial_telemetry;
    tables object_type*zone / norow nocol nopercent;
run;

title;
