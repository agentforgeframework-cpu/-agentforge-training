# AF002_LESSON_04.md

# AF-002 — IoT/AIoT for SAS Programmers

## Lesson 04 — Use Telemetry Operationally at Work

### Prototype Draft v0.6

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

---

# Lesson Purpose

In earlier lessons, you learned how to:

* prepare the environment for learning telemetry
* generate telemetry
* understand telemetry
* use telemetry operationally

In this lesson, you will work inside a believable workplace environment where telemetry affects real operational decisions.

The goal is NOT to become:

* an enterprise architect
* a hyperscale engineer
* a cloud strategist
* an AI evangelist

The goal is:

```text
Learn to reason operationally
inside telemetry-driven organizations.
```

---

# Important Continuity Bridge

The telemetry concepts from earlier lessons still apply here.

The difference is:

* more operational pressure
* more timing sensitivity
* more organizational coordination
* more competing visibility needs

The telemetry itself is still:

```text
ordinary telemetry
```

That matters.

---

# Important Runtime Guidance

This lesson works best when handled in small operational cycles:

```text
operational situation
→ run SAS
→ inspect telemetry
→ interpret operationally
→ continue
```

Do NOT rush.

The learner should repeatedly feel:

```text
I can investigate this.
```

NOT:

```text
I am listening to a lecture.
```

---

# Phase 1 of 7 — Start of Shift

## Instructor / AI Assistant Direction

Do NOT continue until the learner responds.

Do NOT begin with a meeting.

The learner should begin with ordinary SAS workflow.

---

It is 7:38 AM.

You arrive at work and log into your workstation.

Before the morning operations meeting starts, you usually spend a few minutes checking overnight telemetry activity.

An overnight warehouse export is waiting in your inbox.

You open SAS and begin reviewing the data.

Run this SAS program now.

```sas
title "Lesson 04 - Overnight Warehouse Activity";

data overnight_activity;
length warehouse $4 company $10 telemetry_state $8;

input warehouse $
      company $
      avg_queue_minutes
      delayed_shipments
      freezer_alerts
      telemetry_age_minutes;

if telemetry_age_minutes > 20 then
   telemetry_state='STALE';
else
   telemetry_state='CURRENT';

datalines;
KC01 CloudOps   42 33 12 25
KC02 CloudOps   39 28 10 31
KC03 LocalOps   21 14  4  4
KC04 LocalOps   47 39 14  5
KC05 BalancedCo 24 17  5 11
KC06 BalancedCo 31 20  7 14
;
run;

proc print data=overnight_activity;
run;

proc means data=overnight_activity mean maxdec=1;
   var avg_queue_minutes
       delayed_shipments
       freezer_alerts
       telemetry_age_minutes;
run;

proc sgplot data=overnight_activity;
   vbar warehouse / response=avg_queue_minutes;
   yaxis label='Average Queue Minutes';
   title "Overnight Queue Minutes by Warehouse";
run;

title;
```

---

# Observation Moment

Take a moment and inspect the telemetry before continuing.

Questions:

* Which warehouse catches your attention first?
* Which telemetry appears freshest?
* Which telemetry appears questionable?
* What would you investigate next?
* What conclusions would be unsafe to make yet?

When ready:

* share observations
* ask a question
* offer an operational theory
* or say `continue`

Do NOT continue automatically.

---

# Phase 2 of 7 — The Operations Meeting Begins

## Instructor / AI Assistant Direction

Do NOT continue until the learner responds.

The learner should enter the meeting already carrying operational context from SAS.

---

The operations meeting begins.

The vice president opens with:

```text
Why are delays increasing
if all systems still appear green?
```

An operations supervisor responds:

```text
Because the dashboards don't show
what the dock teams are actually experiencing.
```

Another manager asks:

```text
Then why can't we see the problem?
```

You already know several things from your quick SAS review:

* some telemetry appears fresh
* some telemetry appears stale
* queue buildup is uneven
* operational visibility may not match operational reality

One analyst asks:

```text
Where are the timestamps?
```

The room becomes quieter.

---

# Operational Principle

```text
Visibility and operational understanding
are not identical.
```

Executives often need:

* summaries
* trends
* regional visibility

Operators often need:

* timestamps
* telemetry freshness
* queue buildup
* local operational context

That difference matters operationally.

---

# Stop Here

Questions:

* What did your SAS review help you understand?
* What did the SAS output NOT prove?
* What would you avoid claiming too strongly yet?
* What additional telemetry would help?

When ready:

* share observations
* ask a question
* offer an operational theory
* or say `continue`

Do NOT continue automatically.

---

# Phase 3 of 7 — Quick SAS Investigation

## Instructor / AI Assistant Direction

Run the SAS code before continuing.

This phase should feel like another quick operational check, not a giant analytics project.

---

A refrigeration specialist says:

```text
Freezer alerts increased overnight.
```

Another analyst responds:

```text
But the telemetry may already be delayed.
```

You run another quick SAS check.

```sas
title "Lesson 04 - Company Operational Summary";

proc means data=overnight_activity mean maxdec=1;
   class company;
   var avg_queue_minutes
       delayed_shipments
       freezer_alerts
       telemetry_age_minutes;
run;

title "Lesson 04 - Telemetry Freshness";

proc freq data=overnight_activity;
   tables company*telemetry_state / norow nocol nopercent;
run;

proc sgplot data=overnight_activity;
   vbar company / response=telemetry_age_minutes stat=mean;
   yaxis label='Average Telemetry Age';
   title "Average Telemetry Age by Company";
run;

title;
```

---

# Observation Moment

Questions:

* Which company appears strongest operationally?
* Which company appears easiest to troubleshoot locally?
* Which company appears most vulnerable to stale telemetry?
* Which operational tradeoff appears most obvious?

Important:

```text
Architecture decisions are operational decisions.
```

When ready:

* share observations
* ask a question
* offer an operational theory
* or say `continue`

Do NOT continue automatically.

---

# Phase 4 of 7 — A Tale of Three Companies

## CloudOps

CloudOps centralized telemetry aggressively.

Strengths:

* strong executive visibility
* centralized reporting
* enterprise coordination

Weaknesses:

* local operational drift may appear late
* dashboards can become abstracted from floor reality

Operational consequence:

```text
local reality drifts first
```

---

## LocalOps

LocalOps prioritized local operational continuity.

Strengths:

* strong local awareness
* rapid local troubleshooting
* operational resilience

Weaknesses:

* enterprise visibility weakens as operations scale
* coordination becomes harder across regions

Operational consequence:

```text
leadership visibility weakens first
```

---

## BalancedCo

BalancedCo attempted proportional architecture.

Strengths:

* flexible operational fit
* balanced visibility
* mixed survivability

Weaknesses:

* telemetry reconciliation complexity
* disagreement over which telemetry is freshest

Operational consequence:

```text
teams debate which telemetry is freshest
```

---

# Important Operational Insight

None of these organizations are:

* irrational
* incompetent
* magical
* perfect

Each evolved around:

* operational constraints
* staffing realities
* survivability priorities
* visibility tradeoffs

That is operationally realistic.

---

# Stop Here

Questions:

* Which company feels most familiar?
* Which company would be hardest to support at 2 AM?
* Which operational tradeoff feels most believable?
* Which approach creates the most operational tension?

When ready:

* share observations
* ask a question
* offer an operational theory
* or say `continue`

Do NOT continue automatically.

---

# Phase 5 of 7 — Telemetry Conflict

## Instructor / AI Assistant Direction

Do NOT continue until the learner responds.

The ambiguity should feel diagnosable, not confusing.

---

A new issue appears.

Forklift telemetry reports:

```text
LOW UTILIZATION
```

But dock telemetry reports:

```text
HEAVY CONGESTION
```

A refrigeration specialist adds:

```text
Freezer alerts are arriving BEFORE
the temperature telemetry
that explains them.
```

Another supervisor says:

```text
The dashboards are technically correct,
but operationally misleading.
```

The telemetry is not necessarily wrong.

The dashboards are not necessarily useless.

But the signals do not yet form a complete operational picture.

---

# Operational Reflection

Questions:

* Can stale telemetry appear current?
* Can dashboards simplify reality too much?
* Can synchronization drift create operational confusion?
* Can two true metrics point in different operational directions?
* Which telemetry would YOU trust first?

Important operational principle:

```text
Telemetry is evidence,
not truth.
```

When ready:

* share observations
* ask a question
* offer an operational theory
* or say `continue`

Do NOT continue automatically.

---

# Phase 6 of 7 — Human-in-Command

Leadership recommends:

```text
Automatically escalate freezer alerts.
```

Local supervisors disagree.

They report:

* no actual spoilage
* normal compressor operation
* normal product temperatures
* surge loading conditions overnight
* dock teams manually compensating for congestion

One supervisor warns:

```text
If we automate every alert,
eventually nobody will trust the alerts.
```

Another adds:

```text
The floor was signaling distress
before the dashboard showed failure.
```

Stable outputs do not always mean stable systems.

Sometimes they mean people are working harder to keep the system stable.

---

# Operational Trust Decision

You now have:

* stale telemetry
* fresh alerts
* conflicting operational indicators
* leadership pressure
* operator skepticism
* evidence of manual compensation

What should happen next?

Possible responses:

* immediate escalation
* human review
* threshold adjustment
* more telemetry collection
* workflow investigation
* synchronization review

There is probably not a perfect answer.

That is intentional.

Humans are not decoration.

```text
Humans are the operational decision engine.
```

---

# Stop Here

Questions:

* What would you recommend right now?
* What would you NOT automate yet?
* What would you monitor over the next hour?
* What would you tell leadership in plain operational language?

When ready:

* share observations
* ask a question
* offer an operational theory
* or say `continue`

Do NOT continue automatically.

---

# Phase 7 of 7 — Operational Reflection

Leadership now asks:

```text
Which operational approach
appears most sustainable?
```

You are NOT expected to recommend:

* all cloud
* all local
* all AI
* no AI

Instead, use proportional operational reasoning.

Think about:

* visibility
* latency
* throughput
* maintainability
* operational trust
* survivability
* bottleneck visibility
* Human-in-Command oversight

---

# Final Reflection

The goal of this lesson was NOT to:

* memorize architectures
* defend vendors
* promote technology trends

The goal was:

```text
Learn to reason operationally
inside telemetry-driven organizations.
```

Telemetry systems in real organizations are often:

* imperfect
* delayed
* partially visible
* operationally useful
* operationally dangerous if misunderstood

That operational reality matters.

---

# Key Takeaways

```text
Architecture decisions are operational decisions.
```

```text
Architecture follows data.
```

```text
Scale decisions you understand.
```

```text
Telemetry is evidence,
not truth.
```

```text
Visibility and operational continuity
are not identical.
```

```text
Operational ambiguity creates operational immersion.
```

```text
The goal is:
appropriate operational architecture
for the operational problem being solved.
```

---

# Completion Boundary

You have completed the core operational objectives of Lesson 04.

At this point, you should be better able to:

* reason about telemetry operationally
* question telemetry trustworthiness
* recognize visibility limitations
* identify operational bottlenecks
* discuss architecture tradeoffs proportionally
* participate intelligently in telemetry-driven operational discussions

---

# Optional Exploration

Possible future exploration areas include:

* rolling telemetry windows
* larger telemetry streams
* operational forecasting
* synchronization drift analysis
* anomaly escalation
* throughput forecasting

These are intentionally outside the core scope of Lesson 04.

---

# Next Step

Continue to:

```text
AF002_LESSON_05.md
```

---

# Development & Test Environment

Platform:

```text
ChatGPT Web
```

Model:

```text
GPT-5.5 Thinking
```

Date:

```text
2026-05-19
```

Status:

```text
Prototype Draft v0.6
```

---

# License

Paul McDonald Open Use License (MIT-style)

© 2026 Paul McDonald

---

# End of Lesson 04
