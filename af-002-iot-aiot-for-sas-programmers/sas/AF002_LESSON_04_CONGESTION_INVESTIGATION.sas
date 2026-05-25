/* AF-002 Lesson 04 Congestion Investigation */

title "Lesson 04 - Congestion Escalation";

/* Preferred local CSV import */

/*
proc import datafile="data/sample_spatial_telemetry_congestion.csv"
    out=work.spatial_congestion
    dbms=csv
    replace;
    guessingrows=max;
run;
*/

/* Embedded fallback data */

data work.spatial_congestion;
    length object_type $20 zone $20 event_window $20 overlap_flag $3 notes $80;
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
        overlap_flag $
        notes $
    ;

datalines;
2026-05-24T07:54:00|1001|forklift|0.91|120|210|310|390|215|300|LOADING|07:50-08:00|NO|normal pre-shift movement
2026-05-24T08:00:00|1004|person|0.94|500|160|590|350|545|255|SHARED|08:00-08:10|YES|time clock traffic begins
2026-05-24T08:02:00|1006|forklift|0.89|300|220|500|410|400|315|SHARED|08:00-08:10|YES|forklift moving through shared area
2026-05-24T08:03:00|1007|person|0.91|525|165|615|355|570|260|SHARED|08:00-08:10|YES|time clock queue
2026-05-24T08:04:00|1008|forklift|0.87|320|225|520|415|420|320|SHARED|08:00-08:10|YES|forklift near time clock traffic
2026-05-24T08:08:00|1012|person|0.93|570|172|660|362|615|267|SHARED|08:00-08:10|YES|time clock queue
2026-05-24T08:10:00|1013|person|0.92|505|160|595|350|550|255|SHARED|08:10-08:20|YES|late time clock traffic
2026-05-24T08:11:00|1014|forklift|0.88|315|220|515|410|415|315|SHARED|08:10-08:20|YES|forklift near shared area
2026-05-24T08:15:00|1018|forklift|0.90|330|228|530|418|430|323|SHARED|08:10-08:20|YES|forklift crosses shared path
2026-05-24T08:21:00|1021|forklift|0.92|130|215|320|395|225|305|FORKLIFT|08:20-08:30|NO|traffic returns to normal
;
run;

title "Telemetry Review";
proc print data=work.spatial_congestion;
run;

title "Forklift and Pedestrian Overlap by Time Window";
proc freq data=work.spatial_congestion;
    tables event_window*overlap_flag / norow nocol nopercent;
run;

title "Shared Zone Activity";
proc sgplot data=work.spatial_congestion;
    where zone = "SHARED";
    vbar event_window / group=object_type groupdisplay=cluster;
run;

title;
