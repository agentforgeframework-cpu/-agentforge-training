# AF002_LESSON_04.md

# AF-002 — IoT/AIoT for SAS Programmers

## Lesson 04 — Use Telemetry Operationally at Work

### Prototype Draft v0.5

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

* prepare the environment for learning telemetry
* generate telemetry
* understand telemetry
* use telemetry operationally

In this lesson, you will work inside a believable workplace situation where telemetry affects real operational decisions.

The goal is NOT to become:

* an enterprise architect
* a hyperscale engineer
* a cloud strategist
* an AI evangelist
* a dashboard theorist

The goal is:

```text
Learn to reason operationally
inside telemetry-driven organizations.
```

---

# Important Continuity Bridge

The telemetry concepts from earlier lessons still apply here.

The webcam telemetry, image telemetry, event-stream examples, and operational telemetry from earlier lessons were smaller.

This lesson scales the same basic idea into a workplace setting.

The difference is:

* more operational pressure
* more timing sensitivity
* more organizational coordination
* more competing visibility needs
* more people interpreting the same signals differently

The telemetry itself is still:

```text
ordinary telemetry
```

That matters.

You are still working with:

```text
events
timestamps
counts
states
summaries
freshness
operational interpretation
```

This lesson simply places those familiar ideas into a workplace conversation.

---

# Important Runtime Guidance

This lesson is intentionally designed to run in small operational cycles.

Recommended pattern:

```text
operational situation
→ run SAS
→ inspect telemetry
→ interpret operationally
→ continue
```

Do NOT rush.

Do NOT dump the entire lesson at once.

Do NOT turn this into an architecture lecture.

The learner should repeatedly feel:

```text
I can investigate this.
```

NOT:

```text
I am listening to a lecture.
```

---

# Phase 1 of 7 — Quick Operational Triage

## Instructor / AI Assistant Direction

Do NOT continue past this phase until the learner responds to the observation questions.

Keep this phase SAS-first.

Do not place the learner inside the meeting yet.

The learner is preparing for the meeting.

---

It is 7:42 AM.

You have about ten minutes before a regional warehouse operations meeting begins.

Overnight shipment delays increased again.

Nothing catastrophic happened.

But leadership is asking questions.

A supervisor forwarded you a partial overnight export with the note:

```text
Can you take a quick look before the meeting?
Something feels off.
```

You open SAS immediately.

Run this SAS program now.

```sas
title "Lesson 04 - Overnight Operational Snapshot";

data warehouse_status;
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

proc print data=warehouse_status;
run;

proc sgplot data=warehouse_status;
   vbar warehouse / response=avg_queue_minutes;
   yaxis label='Average Queue Minutes';
   title "Dock Queue Minutes by Warehouse";
run;

title;
```

---

# Observation Moment

Take a second and actually inspect the telemetry.

Questions:

* Which warehouse catches your attention first?
* Which telemetry appears freshest?
* Which telemetry appears questionable?
* What deserves investigation first?
* What would you NOT want to claim too strongly yet?

When ready:

* share observations
* ask a question
* offer an operational theory
* or say `continue`

Do not continue automatically.

---

# Phase 2 of 7 — The Meeting Starts

## Instructor / AI Assistant Direction

Do NOT continue past this phase until the learner responds.

Use the learner's Phase 1 observations as the starting point.

The learner should feel that the quick SAS review gave them something useful, but incomplete, before the meeting began.

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

You already know something important from your quick SAS review:

* some telemetry appears fresh
* some telemetry appears stale
* queue buildup is not evenly distributed
* operational visibility may not match operational reality

One analyst asks:

```text
Where are the timestamps?
```

The room becomes quieter.

That question matters.

A dashboard without timing context may still be useful.

But it may also be misleading.

---

# Operational Principle

```text
Visibility and operational understanding
are not identical.
```

Executives often need:

* trends
* summaries
* enterprise visibility
* broad operational posture

Operators often need:

* timestamps
* queue buildup
* telemetry freshness
* local context
* current operational state

That difference matters operationally.

---

# Stop Here

Think about the situation.

Questions:

* What did your quick SAS review help you see before the meeting?
* What did the SAS output NOT prove?
* What would you be careful saying in front of leadership?
* What additional telemetry would help?

When ready:

* share observations
* ask a question
* offer an operational theory
* or say `continue`

Do not continue automatically.

---

# Phase 3 of 7 — Quick SAS Investigation

## Instructor / AI Assistant Direction

Run the SAS code before continuing.

This phase should feel like a second quick investigation, not a full analytics project.

The learner should use SAS to support operational judgment.

---

A refrigeration specialist says:

```text
Freezer alerts increased overnight.
```

Another analyst responds:

```text
But the telemetry may already be delayed.
```

You run a slightly broader SAS check.

```sas
title "Lesson 04 - Company-Level Operational Summary";

proc means data=warehouse_status mean maxdec=1;
   class company;
   var avg_queue_minutes
       delayed_shipments
       freezer_alerts
       telemetry_age_minutes;
run;

title "Lesson 04 - Telemetry Freshness by Company";

proc freq data=warehouse_status;
   tables company*telemetry_state / norow nocol nopercent;
run;

title "Lesson 04 - Telemetry Freshness by Company";

proc sgplot data=warehouse_status;
   vbar company / response=telemetry_age_minutes stat=mean;
   yaxis label='Average Telemetry Age (Minutes)';
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
* What would you want to validate before making a recommendation?

Important:

```text
Architecture decisions are operational decisions.
```

When ready:

* share observations
* ask a question
* offer an operational theory
* or say `continue`

Do not continue automatically.

---

# Phase 4 of 7 — A Tale of Three Companies

## Instructor / AI Assistant Direction

Keep this section brief.

Do not drift into architecture theory.

The purpose is to explain why the SAS output and meeting tension make operational sense.

---

The organizations now begin making more sense operationally.

They are not cartoon examples.

They are not good company / bad company examples.

Each company evolved around real operational choices.

---

## CloudOps

CloudOps centralized telemetry aggressively.

Strength:

* broad enterprise visibility
* easier cross-site reporting
* more consistent executive summaries

Weakness:

* local operational conditions may drift before dashboards reflect them
* local teams may feel disconnected from the monitoring process

Operational consequence:

```text
local reality drifts first
```

CloudOps may retain broad visibility longer, but that visibility can become stale or abstracted.

---

## LocalOps

LocalOps prioritized local operational continuity.

Strength:

* warehouse teams retain strong local awareness
* local supervisors can keep work moving during upstream disruption
* local troubleshooting is often faster

Weakness:

* enterprise coordination weakens as operations scale
* leadership may lose visibility before local teams lose control

Operational consequence:

```text
leadership visibility weakens first
```

LocalOps may keep operating, but the broader organization may struggle to understand what is happening.

---

## BalancedCo

BalancedCo attempted proportional architecture.

Strength:

* flexible operational fit
* local activity can continue
* central reporting can still occur

Weakness:

* multiple telemetry views require reconciliation
* teams must ask which telemetry source is freshest

Operational consequence:

```text
teams debate which telemetry is freshest
```

BalancedCo may be more adaptable, but adaptability creates coordination work.

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
* cost pressure
* visibility tradeoffs

That is operationally realistic.

The goal is not to decide which company is morally superior.

The goal is to understand:

```text
appropriate operational architecture
for the operational problem being solved
```

---

# Stop Here

Questions:

* Which company feels most familiar from real workplace experience?
* Which company would be easiest to explain in a meeting?
* Which company would be hardest to support at 2 AM?
* Which architecture creates the clearest operational tradeoff?

When ready:

* share observations
* ask a question
* offer an operational theory
* or say `continue`

Do not continue automatically.

---

# Phase 5 of 7 — Telemetry Conflict

## Instructor / AI Assistant Direction

Do NOT continue past this phase until the learner responds.

This phase should create bounded ambiguity.

The ambiguity should feel diagnosable, not confusing.

---

A new issue appears.

Forklift telemetry reports:

```text
LOW UTILIZATION
```

But dock telemetry shows:

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

This is a realistic operational problem.

The telemetry is not necessarily fake.

The dashboards are not necessarily useless.

The people are not necessarily confused.

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

Do not continue automatically.

---

# Phase 6 of 7 — Human-in-Command

## Instructor / AI Assistant Direction

This phase should not become philosophical.

Human-in-Command must be shown through operational pressure.

---

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

That statement matters.

Humans may notice operational compensation before summary metrics show breakdown.

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
* temporary manual monitoring

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
* What would you monitor for the next hour?
* What would you tell leadership in plain operational language?

When ready:

* share observations
* ask a question
* offer an operational theory
* or say `continue`

Do not continue automatically.

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
* understand how telemetry affects operational reality

---

# Optional Exploration

Possible future exploration areas include:

* rolling telemetry windows
* larger telemetry streams
* operational forecasting
* synchronization drift analysis
* anomaly escalation
* throughput forecasting
* executive vs operator dashboard design
* more detailed SAS operational reporting

These are intentionally outside the core scope of Lesson 04.

---

# Next Step

Continue to:

```text
AF002_LESSON_05.md
```

GitHub URL:

```text
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_05.md
```

Raw URL:

```text
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_05.md
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
Prototype Draft v0.5
```

Primary Validation Sources:

* human survivability testing
* digital twin testing
* operational pacing analysis
* telemetry cognition testing

---

# License

Paul McDonald Open Use License (MIT-style)

© 2026 Paul McDonald

---

# File Reference Information

GitHub URL:

```text
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_04.md
```

Raw URL:

```text
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_04.md
```

Previous Lesson:

```text
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_03.md
```

Next Lesson:

```text
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_05.md
```

Return to README:

```text
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/README.md
```

---

# End of Lesson 04
