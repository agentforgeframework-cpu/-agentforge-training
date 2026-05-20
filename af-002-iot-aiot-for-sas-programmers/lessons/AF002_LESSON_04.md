# AF002_LESSON_04.md

# AF-002 — IoT/AIoT for SAS Programmers

## Lesson 04 — Use Telemetry Operationally at Work

### Prototype Draft v0.7

Course: AF-002 — IoT and AIoT for SAS Programmers

Repository-relative path:

```text
/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_04.md
```

GitHub URL:

```text
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_04.md
```

Raw URL:

```text
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_04.md
```

---

# Lesson Purpose

In earlier lessons, you learned how to:

* generate telemetry
* inspect telemetry
* reason about telemetry
* use telemetry operationally with SAS

This lesson shifts from:

```text
learning telemetry
```

to:

```text
working operationally inside telemetry-driven organizations
```

The goal is to learn how experienced SAS professionals reason operationally inside changing organizations.

---

# Background Context

The company where you work operates several regional warehouse and distribution centers.

For years, the company operated mostly using local on-premises operational systems.

Several years ago, the CFO attended a cloud modernization conference.

Consultants promised:

* centralized telemetry
* unified dashboards
* lower operational costs
* AI-ready infrastructure

Leadership embraced:

```text
cloud-first
cloud-only
```

Modernization accelerated.

Dashboards multiplied.

Telemetry pipelines expanded.

But operations became more complicated than expected.

Now the company exists in an uncomfortable middle ground between:

* older local operational systems
* centralized cloud telemetry
* business pressure
* operational reality

Nobody is evil.

Nobody is stupid.

The organization is learning:

```text
architecture decisions are operational decisions
```

---

# Phase 1 of 7 — Start of Shift

It is 7:38 AM.

You arrive at work and sit down at your desk.

Before the morning operations meeting starts, you spend a few minutes reviewing overnight telemetry in SAS.

An overnight export is waiting in your inbox.

You open SAS.

Run this code now.

```sas
title "Lesson 04 - Overnight Warehouse Activity";

data overnight_activity;

length warehouse $5
       operating_phase $12
       telemetry_state $8 ;

input warehouse $
      operating_phase $
      queue_minutes
      delayed_shipments
      freezer_alerts
      telemetry_age_minutes
      manual_workaround_count ;

if telemetry_age_minutes > 20 then
   telemetry_state='STALE';
else
   telemetry_state='CURRENT';

datalines;
KC01 LOCALOPS    18 12  3  3  1
KC02 LOCALOPS    22 14  4  5  2
KC03 CLOUDOPS    41 31 11 29  8
KC04 CLOUDOPS    46 36 14 33 11
KC05 BALANCEDCO  24 18  5 10  3
KC06 BALANCEDCO  28 20  6 12  4
;
run;

proc print data=overnight_activity;
run;

proc means data=overnight_activity mean maxdec=1;
   class operating_phase;
   var queue_minutes
       delayed_shipments
       freezer_alerts
       telemetry_age_minutes
       manual_workaround_count;
run;

proc sgplot data=overnight_activity;
   vbar operating_phase / response=queue_minutes stat=mean;
   yaxis label="Average Queue Minutes";
   title "Queue Minutes by Operating Phase";
run;

title;
```

---

# Observation Moment

Questions:

* Which operating phase catches your attention first?
* Which telemetry appears freshest?
* Which telemetry appears least trustworthy?
* Which metrics feel meaningful?
* Which metrics feel incomplete?

Good operational SAS work is operationally meaningful.

---

# Phase 2 of 7 — The Operations Meeting

The operations meeting begins.

The vice president asks:

```text
Why are delays increasing
if all the dashboards still look healthy?
```

An operations supervisor responds:

```text
Because the floor teams are compensating manually
before the dashboards recognize the problem.
```

You already know several things from your SAS review:

* telemetry freshness varies significantly
* queue buildup increased sharply during the cloud-first phase
* manual workaround activity increased dramatically

One analyst quietly asks:

```text
Where are the timestamps?
```

The room becomes quieter.

---

# Phase 3 of 7 — Looking Closer

A refrigeration specialist says:

```text
Freezer alerts increased overnight.
```

You decide to inspect telemetry freshness more closely.

Run this SAS code.

```sas
title "Lesson 04 - Telemetry Freshness";

proc freq data=overnight_activity;
   tables operating_phase*telemetry_state / norow nocol nopercent;
run;

proc sgplot data=overnight_activity;
   vbar operating_phase /
      response=manual_workaround_count
      stat=mean;

   yaxis label="Average Manual Workarounds";

   title "Manual Operational Compensation";
run;

title;
```

---

# Phase 4 of 7 — A Tale of Three Companies

Leadership jokingly refers to the company internally as:

```text
The Tale of Three Companies
```

because the organization behaved like three different companies during three operational eras.

## LocalOps Era

* strong local operational awareness
* rapid local troubleshooting
* fragmented executive visibility

## CloudOps Era

* centralized dashboards
* unified reporting
* stale telemetry
* rising operational abstraction

## BalancedCo Era

The company is now trying to mature operationally.

Not anti-cloud.

Not anti-modernization.

Instead:

```text
proportional operational architecture
```

The organization is learning:

* telemetry trust matters
* dashboards alone do not create understanding
* humans remain operationally essential

---

# Phase 5 of 7 — Telemetry Conflict

Forklift telemetry reports:

```text
LOW UTILIZATION
```

But dock telemetry reports:

```text
HEAVY CONGESTION
```

Workers are manually rerouting shipments to avoid bottlenecks.

One manager says:

```text
The dashboards are technically correct,
but the operation still feels unstable.
```

Questions emerge:

* Which telemetry deserves trust?
* Which metrics are operationally meaningful?
* Which dashboards hide operational strain?

---

# Phase 6 of 7 — Human-in-Command

Leadership proposes automatically escalating all freezer alerts.

Operations pushes back.

Supervisors explain:

* workers are compensating manually
* timing drift affects interpretation
* not every alert deserves escalation

One supervisor warns:

```text
If every alert becomes an emergency,
eventually nobody will trust the system.
```

Humans remain operationally essential.

---

# Phase 7 of 7 — Final Reflection

By the end of the meeting, you understand something important:

```text
Good SAS work is not about generating reports.

Good SAS work is about helping organizations
make operationally credible decisions
inside imperfect telemetry environments.
```

---

# Key Takeaways

```text
Architecture decisions are operational decisions.
```

```text
Telemetry is evidence,
not truth.
```

```text
Visibility and operational understanding
are not identical.
```

```text
Good operational SAS work
must be operationally meaningful.
```

---

# Development & Test Environment

Platform: ChatGPT Web

Model: GPT-5.5 Thinking

Date: 2026-05-19

Status: Prototype Draft v0.7
```

---

# License

Paul McDonald Open Use License (MIT-style)

© 2026 Paul McDonald

---

# End of Lesson 04
