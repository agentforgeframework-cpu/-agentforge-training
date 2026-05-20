/*****************************************************************************************
AF-002 — IoT/AIoT for SAS Programmers
Lesson 04 — Use Telemetry Operationally at Work

Program:
AF002_LESSON_04_OPERATIONAL_TELEMETRY.sas

Purpose:
Create stable, repeatable SAS output for Lesson 04.

Instructional role:
- Start with SAS first.
- Review ordinary warehouse telemetry.
- Compare one company across three operational phases.
- Surface telemetry freshness, manual compensation, and meeting discussion points.
- Support the "Tale of Three Companies" as three phases of one evolving organization.

Notes:
- Uses CARDS4 because site notes contain semicolons.
- Avoids external files, datetime parsing, imports, macros, and fragile delimiter logic.
*****************************************************************************************/


/*----------------------------------------------------------------------------*/
/* Section 1 — Create teaching telemetry                                       */
/*----------------------------------------------------------------------------*/

title "AF-002 Lesson 04 - Create Overnight Warehouse Telemetry";

data work.af002_l04_warehouse;
   length warehouse $5
          operating_phase $12
          telemetry_state $8
          site_note $80;

   input warehouse $
         operating_phase $
         queue_minutes
         delayed_shipments
         freezer_alerts
         telemetry_age_minutes
         manual_workaround_count
         site_note & $80.;

   if telemetry_age_minutes > 20 then telemetry_state = 'STALE';
   else telemetry_state = 'CURRENT';

   /*
      This operational_score is intentionally simple.

      It is NOT presented as a final governed metric.
      It exists only to create discussion about crude operational scoring,
      metric ownership, weighting, and whether unlike measures should be combined.
   */
   operational_score =
        queue_minutes
      + delayed_shipments
      + freezer_alerts
      + manual_workaround_count;

cards4;
KC01 LOCALOPS    18 12  3  3  1 Local systems current; local teams report stable flow
KC02 LOCALOPS    22 14  4  5  2 Local systems current; enterprise rollup delayed
KC03 CLOUDOPS    41 31 11 29  8 Central dashboard available; dock teams report manual rerouting
KC04 CLOUDOPS    46 36 14 33 11 Central dashboard available; telemetry freshness questionable
KC05 BALANCEDCO  24 18  5 10  3 Mixed local/cloud reporting; moderate reconciliation needed
KC06 BALANCEDCO  28 20  6 12  4 Mixed local/cloud reporting; local review confirms most alerts
;;;;
run;


proc print data=work.af002_l04_warehouse label;
   title "AF-002 Lesson 04 - Overnight Warehouse Telemetry";

   label warehouse                = "Warehouse"
         operating_phase          = "Operating Phase"
         queue_minutes            = "Average Queue Minutes"
         delayed_shipments        = "Delayed Shipments"
         freezer_alerts           = "Freezer Alerts"
         telemetry_age_minutes    = "Telemetry Age in Minutes"
         manual_workaround_count  = "Manual Workaround Count"
         telemetry_state          = "Telemetry Freshness"
         operational_score        = "Simple Discussion Score"
         site_note                = "Site Note";
run;


/*----------------------------------------------------------------------------*/
/* Section 2 — Quick operational triage                                        */
/*----------------------------------------------------------------------------*/

title "AF-002 Lesson 04 - Quick Operational Summary by Phase";

proc means data=work.af002_l04_warehouse mean maxdec=1;
   class operating_phase;
   var queue_minutes
       delayed_shipments
       freezer_alerts
       telemetry_age_minutes
       manual_workaround_count
       operational_score;
run;


title "AF-002 Lesson 04 - Telemetry Freshness by Operating Phase";

proc freq data=work.af002_l04_warehouse;
   tables operating_phase*telemetry_state / norow nocol nopercent;
run;


/*----------------------------------------------------------------------------*/
/* Section 3 — Visual operational checks                                       */
/*----------------------------------------------------------------------------*/

title "AF-002 Lesson 04 - Queue Minutes vs Telemetry Freshness";

proc sgplot data=work.af002_l04_warehouse;
   scatter x=telemetry_age_minutes
           y=queue_minutes
           / group=operating_phase
             datalabel=warehouse;

   xaxis label="Telemetry Age in Minutes";
   yaxis label="Average Queue Minutes";
run;


title "AF-002 Lesson 04 - Manual Compensation vs Delayed Shipments";

proc sgplot data=work.af002_l04_warehouse;
   scatter x=manual_workaround_count
           y=delayed_shipments
           / group=operating_phase
             datalabel=warehouse;

   xaxis label="Manual Workaround Count";
   yaxis label="Delayed Shipments";
run;


/*----------------------------------------------------------------------------*/
/* Section 4 — Operational credibility checks                                  */
/*----------------------------------------------------------------------------*/

title "AF-002 Lesson 04 - Operational Credibility Flags";

data work.af002_l04_review;
   set work.af002_l04_warehouse;

   length credibility_flag $40;

   if telemetry_state = 'STALE' and queue_minutes >= 40 then
      credibility_flag = 'High queue with stale telemetry';
   else if manual_workaround_count >= 8 then
      credibility_flag = 'High manual compensation';
   else if freezer_alerts >= 10 then
      credibility_flag = 'Elevated freezer alerts';
   else
      credibility_flag = 'Monitor';

run;


proc print data=work.af002_l04_review label;
   var warehouse
       operating_phase
       queue_minutes
       delayed_shipments
       freezer_alerts
       telemetry_age_minutes
       telemetry_state
       manual_workaround_count
       credibility_flag
       site_note;

   label warehouse                = "Warehouse"
         operating_phase          = "Operating Phase"
         queue_minutes            = "Average Queue Minutes"
         delayed_shipments        = "Delayed Shipments"
         freezer_alerts           = "Freezer Alerts"
         telemetry_age_minutes    = "Telemetry Age in Minutes"
         telemetry_state          = "Telemetry Freshness"
         manual_workaround_count  = "Manual Workaround Count"
         credibility_flag         = "Operational Credibility Flag"
         site_note                = "Site Note";
run;


/*----------------------------------------------------------------------------*/
/* Section 5 — Meeting support output                                          */
/*----------------------------------------------------------------------------*/

proc sort data=work.af002_l04_review
          out=work.af002_l04_meeting;
   by descending operational_score;
run;


title "AF-002 Lesson 04 - What Should Be Discussed In The Meeting";

proc print data=work.af002_l04_meeting label;
   where credibility_flag ne 'Monitor';

   var warehouse
       operating_phase
       operational_score
       credibility_flag
       queue_minutes
       delayed_shipments
       freezer_alerts
       telemetry_age_minutes
       manual_workaround_count
       site_note;

   label warehouse                = "Warehouse"
         operating_phase          = "Operating Phase"
         operational_score        = "Simple Discussion Score"
         credibility_flag         = "Meeting Discussion Point"
         queue_minutes            = "Average Queue Minutes"
         delayed_shipments        = "Delayed Shipments"
         freezer_alerts           = "Freezer Alerts"
         telemetry_age_minutes    = "Telemetry Age in Minutes"
         manual_workaround_count  = "Manual Workaround Count"
         site_note                = "Site Note";
run;


/*----------------------------------------------------------------------------*/
/* Section 6 — Site-level risk review                                          */
/*----------------------------------------------------------------------------*/

title "AF-002 Lesson 04 - Site-Level Queue Risk by Operating Phase";

proc sgplot data=work.af002_l04_review;
   vbox queue_minutes / category=operating_phase
                        datalabel=warehouse;

   yaxis label="Queue Minutes";
   xaxis label="Operating Phase";
run;


title;


/*****************************************************************************************
End of AF002_LESSON_04_OPERATIONAL_TELEMETRY.sas
*****************************************************************************************/
