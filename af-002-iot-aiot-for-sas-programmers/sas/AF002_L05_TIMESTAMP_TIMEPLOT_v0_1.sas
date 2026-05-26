/*==============================================================================
AF002_L05_TIMESTAMP_TIMEPLOT_v0_1.sas

AF-002: IoT / AIoT for SAS Programmers
Lesson 05 — Deliver Practical Results Using Telemetry

Purpose:
This optional SAS evidence check visualizes separation between:
   - event capture time
   - telemetry buffer time
   - dashboard refresh time

The goal is NOT to create a polished dashboard.

The goal is to help operational investigators:
   - observe timestamp lag
   - identify possible telemetry gaps
   - compare operational timing behavior
   - reason about freshness and visibility

This is intentionally simple, practical, and operational.

Recommended usage:
Run after importing:
   AF002_L05_TELEMETRY_SAMPLE_v0_1.csv

Expected input dataset:
   work.l05_telemetry

Required variables:
   zone
   event_capture_time
   telemetry_buffer_time
   dashboard_refresh_time

Timestamp markers used:
   C = Event Capture
   B = Telemetry Buffer
   D = Dashboard Refresh

==============================================================================*/

/*------------------------------------------------------------------------------
Step 1 — Sort telemetry by operational zone and capture time
------------------------------------------------------------------------------*/

proc sort data=work.l05_telemetry
          out=work.byzone ;
   by zone event_capture_time ;
run ;

/*------------------------------------------------------------------------------
Step 2 — Determine overall datetime range for report titles

This helps establish the operational window being investigated.
------------------------------------------------------------------------------*/

proc summary data=work.l05_telemetry ;
   var event_capture_time
       telemetry_buffer_time
       dashboard_refresh_time ;

   output out=work.summary_datetime
      (keep=min1 min2 min3 max1 max2 max3)
      min=min1 min2 min3
      max=max1 max2 max3 ;
run ;

data _null_ ;
   set work.summary_datetime ;

   call symput(
      'start',
      put(min(min1, min2, min3), datetime.)
   );

   call symput(
      'end',
      put(max(max1, max2, max3), datetime.)
   );
run ;

/*------------------------------------------------------------------------------
Step 3 — Build plotting dataset

TIMEPLOT expects observations in sequence.

The retained counter helps preserve plotting order within each zone.
------------------------------------------------------------------------------*/

data work.timeplot ;

   set work.byzone ;

   by zone event_capture_time ;

   retain telemetry_record ;

   if first.zone then telemetry_record = 1 ;
   else telemetry_record = sum(telemetry_record, 1) ;

run ;

/*------------------------------------------------------------------------------
Step 4 — Generate operational timeplot

Interpretation guidance:
- Large separation between C/B/D markers may indicate operational lag
- Missing intervals may indicate telemetry gaps or incomplete visibility
- Dashboard timing may not reflect real-time operational conditions
- Different zones may behave differently operationally

This output is intentionally "old-school SAS" and evidence-oriented.
------------------------------------------------------------------------------*/

title1
"Telemetry date-time report: Capture, Buffer, and Dashboard Refresh" ;

title2
"From &start to &end" ;

proc timeplot data=work.timeplot ;

   by zone ;

   format event_capture_time
          telemetry_buffer_time
          dashboard_refresh_time
          datetime. ;

   plot
      event_capture_time='C'
      telemetry_buffer_time='B'
      dashboard_refresh_time='D'
      / overlay ;

run ;

title ;
footnote ;