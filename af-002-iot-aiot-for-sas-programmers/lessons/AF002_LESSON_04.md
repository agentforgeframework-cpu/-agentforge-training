# AF002_LESSON_04.md

# AF-002 — IoT/AIoT for SAS Programmers

## Lesson 04 — Use Telemetry Operationally at Work

### Prototype Draft v0.9

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

# Lesson Identity

This is a SAS lesson.

The learner is not watching a telemetry discussion.

The learner is not attending a modernization seminar.

The learner is not roleplaying a manager in meetings.

The learner is acting as a SAS programmer who uses SAS to investigate operational telemetry before, during, and after an operational discussion.

The central lesson pattern is:

```text
SAS action
→ learner observation
→ operational question
→ architecture implication
```

If the learner is not doing or modifying SAS, the lesson is drifting.

---

# Lesson Purpose

In earlier lessons, you learned how to:

* generate telemetry
* inspect telemetry
* reason about telemetry
* work with telemetry operationally in SAS

This lesson shifts from:

```text
learning telemetry
```

to:

```text
using SAS to investigate telemetry behavior
inside a changing organization
```

The goal is NOT to become:

* a cloud architect
* an AI evangelist
* a dashboard theorist
* a modernization consultant

The goal is:

```text
use SAS to discover how architecture decisions
change operational reality
```

---

# Hard Runtime Rules For The Instructor / AI Assistant

Do NOT teach this lesson primarily through explanation.

Do NOT summarize future phases.

Do NOT turn this into a meeting simulation.

Do NOT give the learner conclusions before the learner investigates through SAS.

Do NOT invent alternate SAS code unless the learner asks for help correcting a failure.

Do NOT continue automatically after a stop point.

Do NOT allow architecture to remain abstract.

Every major phase must include at least one of the following:

* run SAS
* inspect SAS output
* modify SAS code
* filter observations
* classify telemetry
* challenge a metric
* test an operational hypothesis
* identify an architecture consequence from SAS evidence

The AI assistant may guide, but the learner must investigate.

---

# Required Files

Run this lesson from the AF-002 repository.

Primary lesson file:

```text
lessons/AF002_LESSON_04.md
```

Core SAS program:

```text
sas/AF002_LESSON_04_OPERATIONAL_TELEMETRY.sas
```

Optional visual review program:

```text
sas/AF002_LESSON_04_VISUAL_REVIEW.sas
```

The core SAS program is required.

The optional visual review program is not required for first pass completion.

---

# Background Context

The company where you work operates several regional warehouse and distribution centers.

For years, the company operated mostly using local on-premises operational systems.

Local teams had strong operational awareness.

SAS reporting was tightly connected to day-to-day operations.

Leadership often complained that:

* enterprise visibility was fragmented
* reporting was inconsistent
* coordination across regions was difficult

Several years ago, the CFO attended a cloud modernization conference.

Consultants promised:

* centralized telemetry
* unified dashboards
* lower operational costs
* AI-ready infrastructure
* simplified enterprise visibility

Leadership embraced:

```text
cloud-first
cloud-only
```

Modernization accelerated.

New dashboards appeared everywhere.

Telemetry pipelines expanded rapidly.

But operations became more complicated than expected.

Now the organization exists in an uncomfortable middle ground between:

* older local operational systems
* centralized telemetry platforms
* executive dashboard expectations
* operational reality

Nobody is evil.

Nobody is stupid.

The organization is learning:

```text
architecture decisions are operational decisions
```

But the learner should not accept that sentence as a slogan.

The learner should prove or challenge it through SAS.

---

# Phase 1 of 7 — Start of Shift: Run The Operational Telemetry Program

It is 7:38 AM.

You arrive at work and sit down at your desk.

The regional operations meeting begins in about twenty minutes.

Before the meeting, you open SAS and review overnight telemetry.

Open and run:

```text
sas/AF002_LESSON_04_OPERATIONAL_TELEMETRY.sas
```

Do not continue until the program has run.

Confirm the log shows that the teaching data was created successfully.

You should see a line similar to:

```text
NOTE: The data set WORK.AF002_L04_WAREHOUSE has 6 observations
```

If the dataset does not have 6 observations, stop and fix the SAS issue before continuing.

---

## SAS Investigation Task 1

Review the first output:

```text
AF-002 Lesson 04 - Overnight Warehouse Telemetry
```

You are looking for operational evidence, not just rows and columns.

Identify:

* which rows appear most concerning
* which telemetry appears stale
* which sites show manual compensation
* which phase appears to have the greatest operational stress
* which fields you would trust least without more context

Do NOT let the AI assistant interpret this for you first.

The learner must make the first operational observations.

---

## Stop Point 1 — Learner Response Required

Answer briefly:

```text
Which two rows would you bring to the meeting first, and why?
```

Optional SAS prompt:

```text
Would you filter this table before showing it to leadership?
```

Do not continue automatically.

---

# Phase 2 of 7 — Modify The Report: Make SAS Prepare The Meeting

The raw table is useful, but a SAS programmer should not stop at the first PROC PRINT.

The next task is to create a meeting-focused view.

Use the dataset created by the core program:

```text
work.af002_l04_review
```

If needed, run this small SAS modification after the core program:

```sas
title "Lesson 04 - Learner Meeting Prep View";

proc print data=work.af002_l04_review label;
   where credibility_flag ne 'Monitor';

   var warehouse
       operating_phase
       credibility_flag
       queue_minutes
       telemetry_age_minutes
       manual_workaround_count
       site_note;
run;

title;
```

This is not advanced SAS.

That is intentional.

Operational SAS often starts with a small, practical report that helps people ask better questions.

---

## SAS Investigation Task 2

Inspect your meeting prep output.

Ask:

* Is this report better than the raw table?
* Does the filter remove useful context?
* Is `credibility_flag` helpful or too simplistic?
* Are the site notes operationally useful?
* Would this report help a real supervisor?

---

## Architecture Implication 1

If the highest concern rows cluster in one operating phase, ask why.

Do not say:

```text
Cloud is bad.
```

Do not say:

```text
Local is good.
```

Ask:

```text
What architectural behavior is visible in the telemetry?
```

Possible architecture clues:

* stale telemetry
* centralized visibility
* delayed local awareness
* manual compensation
* dashboard lag
* local review
* reconciliation effort

Architecture becomes topical only when the learner connects SAS evidence to system behavior.

---

## Stop Point 2 — Learner Response Required

Answer briefly:

```text
What does the meeting prep report show that the raw table did not show as clearly?
```

Then answer:

```text
What architecture behavior might explain that pattern?
```

Do not continue automatically.

---

# Phase 3 of 7 — Challenge The Score Before Trusting It

The core program includes:

```text
operational_score
```

This score is intentionally crude.

It adds unlike measures:

* queue minutes
* delayed shipments
* freezer alerts
* manual workaround count

This is exactly the kind of quick composite score that can appear during modernization efforts.

It may help sort discussion.

It may also create fake precision.

A SAS programmer must not blindly trust it.

---

## SAS Investigation Task 3

Run this review:

```sas
title "Lesson 04 - Challenge The Simple Discussion Score";

proc print data=work.af002_l04_meeting label;
   var warehouse
       operating_phase
       operational_score
       queue_minutes
       delayed_shipments
       freezer_alerts
       manual_workaround_count
       telemetry_age_minutes
       credibility_flag;
run;

title;
```

Now challenge the metric.

Ask:

* What does the score combine?
* Are the units compatible?
* Are the weights justified?
* Does sorting by this score help or mislead?
* Should this score be used for escalation?
* Who would need to approve this as an operational metric?

---

## Architecture Implication 2

This is where architecture and governance meet.

A centralized dashboard may make a composite score look official.

A local operational team may know the score hides important context.

A balanced architecture may require the score to remain a discussion starter, not an automatic decision rule.

Architecture is not just where data lives.

Architecture affects:

* who sees the metric
* when they see it
* how official it looks
* whether humans can challenge it
* whether local context survives aggregation

---

## Stop Point 3 — Learner Response Required

Answer briefly:

```text
Would you trust operational_score as an escalation metric?
```

Then answer:

```text
Would you trust it as a meeting discussion sort?
```

Do not continue automatically.

---

# Phase 4 of 7 — Investigate The Three Phases Through SAS

Leadership informally refers to the situation as:

```text
The Tale of Three Companies
```

But the company did not split into three businesses.

It behaved like three different companies during three different operational eras:

```text
LocalOps Era
→ CloudOps Era
→ BalancedCo Era
```

The learner must not accept those phases as story labels.

The learner must inspect them through SAS.

---

## SAS Investigation Task 4

Review the phase summaries produced by the core program:

```text
AF-002 Lesson 04 - Quick Operational Summary by Phase
```

and:

```text
AF-002 Lesson 04 - Telemetry Freshness by Operating Phase
```

If you want to rerun only the phase summary, use:

```sas
title "Lesson 04 - Phase Summary Review";

proc means data=work.af002_l04_warehouse mean maxdec=1;
   class operating_phase;
   var queue_minutes
       delayed_shipments
       freezer_alerts
       telemetry_age_minutes
       manual_workaround_count
       operational_score;
run;

proc freq data=work.af002_l04_warehouse;
   tables operating_phase*telemetry_state / norow nocol nopercent;
run;

title;
```

---

## Learner Interpretation Required

Use the SAS output to complete this comparison:

```text
LocalOps:
What looks operationally strong?
What looks limited?

CloudOps:
What looks improved?
What looks degraded?

BalancedCo:
What looks recovered?
What still looks imperfect?
```

Do not let the AI assistant complete this table first.

The learner must complete the comparison from SAS output.

---

## Architecture Implication 3

Now architecture should become unavoidable.

LocalOps may show:

* fresh telemetry
* low manual workarounds
* strong local awareness
* weaker enterprise coordination

CloudOps may show:

* centralized reporting
* stale telemetry
* higher manual compensation
* dashboard abstraction

BalancedCo may show:

* improved freshness
* moderate queues
* restored local review
* reconciliation still required

The point is not:

```text
Which architecture wins?
```

The point is:

```text
What operational consequences did each architecture create?
```

---

## Stop Point 4 — Learner Response Required

Answer briefly:

```text
Which phase would you rather support at 2 AM, and why?
```

Then answer:

```text
Which phase gives executives the cleanest view?
```

Then answer:

```text
Are those the same phase?
```

Do not continue automatically.

---

# Phase 5 of 7 — Use Plots To See Relationships, Not Decorations

The core program produces visual checks.

Focus on:

```text
Queue Minutes vs Telemetry Freshness
```

and:

```text
Manual Compensation vs Delayed Shipments
```

These are not dashboard decorations.

They are operational relationship checks.

---

## SAS Investigation Task 5

Inspect the scatter plots.

Ask:

* Do older telemetry readings appear near higher queue pressure?
* Do manual workarounds appear near delayed shipments?
* Do the operating phases separate visually?
* Is this enough evidence to prove causation?
* What would you investigate next?

Optional rerun:

```sas
title "Lesson 04 - Queue Minutes vs Telemetry Freshness";

proc sgplot data=work.af002_l04_review;
   scatter x=telemetry_age_minutes
           y=queue_minutes
           / group=operating_phase
             datalabel=warehouse;

   xaxis label="Telemetry Age in Minutes";
   yaxis label="Average Queue Minutes";
run;

title "Lesson 04 - Manual Compensation vs Delayed Shipments";

proc sgplot data=work.af002_l04_review;
   scatter x=manual_workaround_count
           y=delayed_shipments
           / group=operating_phase
             datalabel=warehouse;

   xaxis label="Manual Workaround Count";
   yaxis label="Delayed Shipments";
run;

title;
```

---

## Architecture Implication 4

If telemetry age rises while queue pressure rises, that may indicate the architecture is losing operational freshness where freshness matters.

If manual workarounds rise while delays rise, that may indicate workers are stabilizing operations before dashboards fully reflect the stress.

Architecture decisions affect:

* telemetry freshness
* local visibility
* central visibility
* escalation timing
* human workload
* trust in automated reporting

---

## Stop Point 5 — Learner Response Required

Answer briefly:

```text
Which plot gives the strongest operational signal?
```

Then answer:

```text
What architecture weakness might that signal reveal?
```

Do not continue automatically.

---

# Phase 6 of 7 — Meeting Pressure: The Learner Brings SAS Evidence

Now the operations meeting begins.

The vice president asks:

```text
Why are delays increasing
if the dashboards still look stable?
```

An operations supervisor responds:

```text
Because the floor teams are compensating manually
before the dashboards recognize the problem.
```

You are not empty-handed.

You have SAS evidence.

You may bring:

* the filtered meeting prep report
* the telemetry freshness summary
* the phase comparison
* the plots
* your concerns about `operational_score`

---

## Learner SAS Brief Required

Before continuing, prepare a short spoken briefing from your SAS work.

Use this structure:

```text
1. What I checked in SAS:
2. What I found:
3. What I do not trust yet:
4. What architecture behavior this may indicate:
5. What I recommend we investigate next:
```

The briefing should be operational, not theatrical.

Example tone:

```text
I would not treat the dashboard as false,
but I also would not treat it as operationally complete.
The SAS output suggests stale telemetry and manual compensation
are concentrated in the CloudOps-era sites.
```

Do not let the AI assistant write the whole briefing first.

The learner should draft the first version.

---

## Architecture Implication 5

This is the moment the lesson becomes architecture-topical.

Not because someone says:

```text
Let us discuss architecture.
```

But because the SAS evidence suggests:

```text
the current architecture may be creating visibility
without enough operational freshness
```

That is architecture as operational consequence.

---

## Stop Point 6 — Learner Response Required

Draft the five-part SAS briefing.

Do not continue automatically.

---

# Phase 7 of 7 — Human-in-Command Decision

Leadership proposes:

```text
Automatically escalate all freezer alerts.
```

Operations pushes back.

Supervisors explain:

* workers are already compensating manually
* timing drift affects interpretation
* not every alert deserves escalation
* local context still matters
* the dashboard may be stable but incomplete

One supervisor warns:

```text
If every alert becomes an emergency,
eventually nobody will trust the system.
```

Another adds:

```text
The floor knew there was stress
long before the dashboards admitted it.
```

---

## Final SAS-Centered Decision

Use your SAS evidence to decide what you would recommend.

Possible recommendations:

* improve telemetry freshness
* restore local visibility for certain workflows
* revise dashboard freshness indicators
* require human review before escalation
* validate thresholds before automation
* separate executive trend dashboards from operator freshness views
* revise or retire `operational_score`
* collect additional telemetry before changing escalation rules

The answer does not need to be perfect.

It must be grounded in SAS evidence.

---

## Final Response Required

Complete this:

```text
My recommendation:
The SAS evidence I would cite:
The metric or output I would NOT over-trust:
The architecture consequence I see:
The Human-in-Command safeguard I would preserve:
```

Do not continue automatically.

---

# Final Reflection

By the end of this lesson, you should not merely have discussed telemetry.

You should have used SAS to investigate telemetry.

You should have seen how operational architecture affects:

* telemetry freshness
* dashboard trust
* local awareness
* manual compensation
* escalation risk
* human workload
* operational credibility

The lesson is not:

```text
cloud vs local
```

The lesson is:

```text
architecture decisions create operational consequences
that SAS programmers can help reveal
```

---

# Key Takeaways

Keep these practical.

```text
Good operational SAS work is operationally meaningful.
```

```text
Telemetry is evidence, not truth.
```

```text
A dashboard can be technically correct
and operationally incomplete.
```

```text
A metric that looks official may still lack governance.
```

```text
Architecture decisions affect telemetry freshness,
visibility, latency, human workload, and trust.
```

```text
Humans remain the operational decision engine.
```

```text
The SAS programmer protects operational credibility
by investigating before accepting the story.
```

---

# Completion Boundary

You have completed the core objectives of Lesson 04 if you can:

* run the Lesson 04 SAS program
* inspect telemetry outputs
* modify or rerun small SAS reports
* challenge a questionable metric
* compare LocalOps, CloudOps, and BalancedCo through SAS evidence
* identify architecture consequences from telemetry behavior
* prepare a meeting briefing grounded in SAS output
* preserve Human-in-Command reasoning under modernization pressure

If you only discussed telemetry but did not investigate through SAS, the lesson was not completed.

---

# Optional Follow-Up

Run:

```text
sas/AF002_LESSON_04_VISUAL_REVIEW.sas
```

Use it only to explore whether additional plots support operational reasoning.

Do not add plots simply because they look impressive.

A plot earns its place only if it helps answer an operational question.

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
2026-05-20
```

Status:

```text
Prototype Draft v0.9
```



---

# Development & Test Environment

Platform: ChatGPT Web

Model: GPT-5.5 Thinking

Date: 2026-05-19

Status: Prototype Draft v0.7


---

# License

Paul McDonald Open Use License (MIT-style)

© 2026 Paul McDonald

---

# End of Lesson 04
