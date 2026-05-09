/*
AF-002 SAS Import Telemetry Example

Purpose:
Import the webcam telemetry CSV created in Lesson 01 and produce simple output.

Update the filename path before running.
*/

filename telecsv "telemetry_webcam_sample.csv";

proc import datafile=telecsv
    out=work.telemetry
    dbms=csv
    replace;
    guessingrows=max;
run;

proc print data=work.telemetry(obs=10);
    title "AF-002 Lesson 01 - First Telemetry Records";
run;

proc means data=work.telemetry mean min max;
    var brightness_mean brightness_min brightness_max;
    title "AF-002 Lesson 01 - Simple Telemetry Summary";
run;

data work.telemetry_events;
    set work.telemetry;
    if brightness_mean < 60 then event_flag = "LOW_LIGHT";
    else event_flag = "NORMAL";
run;

proc freq data=work.telemetry_events;
    tables event_flag;
    title "AF-002 Lesson 01 - Simple Event Flag";
run;
