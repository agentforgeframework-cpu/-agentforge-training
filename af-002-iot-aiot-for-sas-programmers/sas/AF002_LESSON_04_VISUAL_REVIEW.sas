/*****************************************************************************************
AF-002 — IoT/AIoT for SAS Programmers
Lesson 04 — Use Telemetry Operationally at Work

Program:
AF002_LESSON_04_VISUAL_REVIEW.sas

Purpose:
Optional visual review program for Lesson 04.

Prerequisite:
Run AF002_LESSON_04_OPERATIONAL_TELEMETRY.sas first.

Instructional role:
- Provides a small set of optional plots for discussion.
- Helps evaluate whether plots add value before they are promoted into the core lesson.
*****************************************************************************************/


/* Safety check */
%macro af002_l04_require_data;
   %if %sysfunc(exist(work.af002_l04_review)) = 0 %then %do;
      %put ERROR: Required data set WORK.AF002_L04_REVIEW does not exist.;
      %put ERROR: Run AF002_LESSON_04_OPERATIONAL_TELEMETRY.sas first.;
   %end;
%mend;

%af002_l04_require_data;


/* Plot 1 — Relationship between freshness and queue pressure */

title "AF-002 Lesson 04 - Queue Minutes vs Telemetry Freshness";

proc sgplot data=work.af002_l04_review;
   scatter x=telemetry_age_minutes
           y=queue_minutes
           / group=operating_phase
             datalabel=warehouse;

   xaxis label="Telemetry Age in Minutes";
   yaxis label="Average Queue Minutes";
run;


/* Plot 2 — Relationship between manual compensation and delays */

title "AF-002 Lesson 04 - Manual Compensation vs Delayed Shipments";

proc sgplot data=work.af002_l04_review;
   scatter x=manual_workaround_count
           y=delayed_shipments
           / group=operating_phase
             datalabel=warehouse;

   xaxis label="Manual Workaround Count";
   yaxis label="Delayed Shipments";
run;


/* Plot 3 — Site-level spread by phase */

title "AF-002 Lesson 04 - Site-Level Queue Risk by Operating Phase";

proc sgplot data=work.af002_l04_review;
   vbox queue_minutes / category=operating_phase
                        datalabel=warehouse;

   yaxis label="Queue Minutes";
   xaxis label="Operating Phase";
run;


title;


/*****************************************************************************************
End of AF002_LESSON_04_VISUAL_REVIEW.sas
*****************************************************************************************/
