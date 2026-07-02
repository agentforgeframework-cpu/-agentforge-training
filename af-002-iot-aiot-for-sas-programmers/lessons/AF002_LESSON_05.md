# Lesson 05 — Deliver Practical Results Using Telemetry

**Kit Type:** Training Kit  
**Status:** Production Candidate  
**Version:** 1.0  
**Repository:** AF-002 - IoT/AIoT for SAS Programmers  
**Repository Object:** ROOT_LIBRARY  
**Raw:** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/LIBRARY.md  
**This File (Raw):** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_05.md  

---

# Purpose

Lesson 05 is the AF-002 capstone.

The learner will combine telemetry, SAS analysis, dashboards, timestamp lineage, operational judgment, and clear communication to investigate a modernization-related visibility gap.

The goal is not to redesign enterprise architecture.

The goal is to use evidence responsibly and communicate practical operational findings.

---

# AI Assistant Guidance

When assisting with this lesson:

- preserve ambiguity until the evidence supports a conclusion
- do not frame modernization as success or failure too early
- keep the learner focused on operational evidence
- use SAS output and visible artifacts as the source of truth
- separate executive, operational, and raw-telemetry views
- distinguish correlation from proven root cause
- help the learner communicate implications in plain language
- avoid executive roleplay, architecture evangelism, and dramatic conflict
- preserve Human-in-Command accountability
- explicitly identify remaining uncertainty

The instructional pattern is:

```text
Observe
    -> Compare
        -> Investigate
            -> Interpret
                -> Communicate
                    -> Recommend
```

---

# Human-in-Command Principle

This lesson reinforces:

```text
Telemetry is evidence, not truth.
Dashboards are views, not reality.
Humans remain responsible for operational judgment.
```

Technology may improve one operational capability while reducing another.

The task is to understand the tradeoff, not to declare a winner.

---

# Learning Objectives

By the end of this lesson, the learner should be able to:

- compare executive and operational telemetry views
- identify a possible visibility gap
- use SAS to investigate timing and queue behavior
- explain why timestamp lineage matters
- distinguish accurate reporting from timely operational awareness
- communicate findings without overstating certainty
- recommend proportional improvements
- identify what remains uncertain
- preserve Human-in-Command responsibility

---

# Operational Scenario

You support analytics for a regional warehouse distribution operation.

A recent modernization effort successfully:

- reduced infrastructure complexity
- centralized dashboard management
- improved telemetry buffering
- increased aggregation efficiency

Leadership considers the modernization successful.

Operations generally agrees.

However, warehouse supervisors report:

```text
The dashboards look normal,
but the warehouse floor feels different.
```

No major outage exists.

No emergency exists.

The concern is that staff may be reacting later than before.

You are asked to investigate before the next operational review meeting.

---

# Initial Evidence Package

Review these artifacts:

```text
media/AF002_L05_EXECUTIVE_DASHBOARD_v0_1.png
media/AF002_L05_OPERATIONS_DASHBOARD_v0_1.png
data/AF002_L05_TELEMETRY_SAMPLE_v0_1.csv
sas/AF002_L05_TINY_SAS_OUTPUT_SET_v0_2.sas
```

Use `LIBRARY.md` as the authoritative location for each file.

Do not explain the operational gap before reviewing the evidence.

---

# Executive Dashboard

Review:

```text
media/AF002_L05_EXECUTIVE_DASHBOARD_v0_1.png
```

The dashboard appears:

- modern
- stable
- professional
- operationally credible

It emphasizes:

- throughput
- summarized KPIs
- trend stability
- modernization reporting
- broad operational status

Ask:

```text
What becomes less visible
when telemetry is aggregated for executive simplicity?
```

---

# Operations Dashboard

Review:

```text
media/AF002_L05_OPERATIONS_DASHBOARD_v0_1.png
```

This view exposes more detail about:

- localized queue behavior
- zone variability
- escalation watches
- intervention timing
- forklift redistribution
- short-term operational change

Ask:

```text
Why might supervisors sense a problem
before an executive dashboard shows one?
```

Different dashboards may be accurate while serving different operational purposes.

---

# Initial Interpretation

A reasonable first hypothesis is:

```text
Possible staffing imbalance during peak dock activity.
```

That interpretation is not foolish.

It is incomplete.

Real operational analysis often begins with a plausible explanation that must be tested.

---

# Operational Communication

Avoid language that is technically correct but operationally vague.

Weak:

```text
The telemetry latency characteristics changed.
```

Stronger:

```text
We are still receiving operational telemetry,
but developing dock congestion becomes visible later than before.
```

The second statement explains operational consequence.

---

# Run the Initial SAS Investigation

Use:

```text
data/AF002_L05_TELEMETRY_SAMPLE_v0_1.csv
sas/AF002_L05_TINY_SAS_OUTPUT_SET_v0_2.sas
```

The program is intended to produce a bounded set of outputs for interpretation.

Focus on:

- queue depth timing
- dashboard refresh timing
- telemetry freshness
- staffing alignment
- intervention windows
- zone behavior

Do not treat the exercise as a SAS coding test.

The objective is operational interpretation.

---

# Checkpoint — Initial Investigation Complete

At this point, the evidence may suggest:

```text
Staffing may contribute,
but timing inconsistencies also appear in the telemetry path.
```

Do not claim root cause yet.

---

# Compare Event and Display Timing

Review:

```text
media/AF002_L05_TIMESTAMP_COMPARISON_v0_1.png
```

The graphic distinguishes:

- event capture time
- telemetry buffer time
- dashboard refresh time
- operational response time

These are different operational moments.

Example:

```text
A slowdown occurs at 08:12.
Telemetry becomes available at 08:17.
The dashboard refreshes at 08:19.
A human responds at 08:20.
```

The event may have been captured correctly.

The operational response may still have been delayed.

---

# Timestamp Lineage

## Event Capture Time

When the physical event occurred.

## Telemetry Buffer Time

When the event became available downstream after buffering or transport.

## Dashboard Refresh Time

When the dashboard displayed the event.

## Operational Response Time

When a human could reasonably act.

Important:

```text
Accurate timestamps can still describe different operational moments.
```

Ask:

- Which timestamp matters for intervention?
- Which timestamp matters for audit?
- Which timestamp matters for performance reporting?
- Could delayed display make a gradual buildup appear sudden?

---

# Optional Timeplot Exploration

Use:

```text
sas/AF002_L05_TIMESTAMP_TIMEPLOT_v0_1.sas
```

This optional program helps visualize differences among event capture, buffering, display, and response.

The goal is not advanced SAS programming.

The goal is to make delay visible.

---

# Emerging Discovery

The evidence suggests two modernization-related changes:

1. Dashboard aggregation intervals increased.
2. Telemetry buffering was introduced before dashboard refresh.

Neither change is inherently wrong.

Both may improve:

- infrastructure efficiency
- consistency
- centralized reporting
- dashboard stability

The possible side effect is:

```text
Reduced visibility into rapidly developing queue conditions.
```

This does not mean the dashboards are false.

It means they may be optimized for a different operational purpose.

---

# Checkpoint — Visibility Gap Identified

A reasonable evidence-based statement is:

```text
Executive reporting remains accurate at a higher level,
while operations may receive actionable queue information later than before.
```

This is a visibility-gap hypothesis.

It still requires validation.

---

# Compare Operational Views

## Executive View

- throughput remains acceptable
- modernization goals appear successful
- summarized KPIs remain stable

## Operations View

- queue buildup feels sudden
- staffing adjustments occur later
- intervention windows appear compressed

## Raw Telemetry View

- queue growth may be visible earlier
- timestamp semantics matter
- delay accumulates across stages

## SAS Investigation View

- freshness affects intervention timing
- aggregation can smooth escalation
- delay may reduce operational reaction time

No single view is complete.

---

# Operational Review Meeting

Participants include:

- warehouse operations lead
- modernization lead
- finance representative
- operations analytics staff
- the learner

The meeting should remain professional and evidence-driven.

Nobody is the villain.

Different participants are working from different abstractions.

---

# Meeting Prompts

## Prompt 1 — Executive Interpretation

```text
The executive dashboard still shows acceptable throughput.

Should operations still be concerned?
Why or why not?
```

## Prompt 2 — Timestamp Meaning

```text
Which timestamp matters most for intervention:
event capture,
dashboard refresh,
or operational response?
```

## Prompt 3 — Operational Tradeoff

```text
The modernization improved efficiency and reporting consistency.

What operational capability may have become less visible?
```

## Prompt 4 — Human Feedback

```text
Supervisors sensed discomfort before dashboards showed clear congestion.

How should that feedback be treated?
```

## Prompt 5 — SAS Contribution

```text
What did SAS reveal
that the dashboards made less visible?
```

## Prompt 6 — Remaining Uncertainty

```text
Do the findings prove the root cause?

What still needs validation?
```

---

# Primary Realization

The modernization did not necessarily fail.

The dashboards are not useless.

The telemetry is not fake.

The operational lesson is:

```text
Different operational phases require different visibility.
```

Executive reporting may need stable, aggregated views.

Operational intervention may need fresher, more granular views.

This is a tradeoff discussion, not a technology war.

---

# Develop an Operational Findings Summary

Use this structure:

## Observations

What operational behavior was observed?

## Findings

What evidence supports the interpretation?

## Operational Implications

What consequence may result?

## Recommendations

What proportional changes may help?

## Remaining Uncertainty

What still requires validation?

---

# Example Findings Summary

## Observations

Warehouse supervisors report that queue buildup appears suddenly and that staffing adjustments occur later than expected.

## Findings

SAS analysis indicates that raw queue growth begins before the operational dashboards visibly reflect escalation. Timestamp comparison suggests delay between event capture, buffering, dashboard refresh, and human response.

## Operational Implications

Operations may have less time to intervene even when executive reporting remains accurate at the summary level.

## Recommendations

- preserve a fresher operational telemetry view
- retain higher-granularity queue visibility for supervisors
- separate executive and operational dashboard purposes
- expose timestamp lineage where delay matters
- periodically compare raw telemetry with dashboard presentation
- preserve human review and escalation authority

## Remaining Uncertainty

- whether the pattern repeats across multiple days
- whether staffing also contributes
- whether buffering or aggregation is the primary source of delay
- whether sensor or ingestion gaps exist
- whether the proposed visibility changes improve intervention timing

---

# Proportional Recommendations

Appropriate recommendations may include:

- a lower-latency operational view
- shorter refresh intervals for selected metrics
- separate executive and operations dashboards
- visibility into event capture and refresh timestamps
- alerts based on freshness as well as queue depth
- periodic raw-versus-dashboard reconciliation
- supervisor feedback loops

Avoid recommendations such as:

- replace everything
- reverse all modernization
- abandon dashboards
- remove aggregation everywhere
- treat human intuition as unquestionable truth

The response should fit the evidence.

---

# Human-in-Command Closure

This lesson is not about rejecting technology.

It is about maintaining operational responsibility inside increasingly abstract systems.

Telemetry assisted the investigation.

Dashboards assisted the investigation.

SAS assisted the investigation.

Humans still had to:

- interpret the evidence
- test assumptions
- identify uncertainty
- decide what mattered
- choose a proportional response

---

# Lesson 05 Success

Lesson 05 is complete when the learner can say:

> I used telemetry, SAS analysis, dashboard evidence, and timestamp lineage to explain an operational visibility gap without overstating certainty.

The learner should be able to:

- compare multiple operational views
- explain why accurate data may still arrive too late
- communicate findings in operational language
- recommend proportional improvements
- identify remaining uncertainty
- preserve Human-in-Command responsibility

---

# Restart Checkpoint

When returning after interruption:

1. Review the executive dashboard.
2. Review the operations dashboard.
3. Run `AF002_L05_TINY_SAS_OUTPUT_SET_v0_2.sas`.
4. Review the timestamp comparison graphic.
5. Rebuild the findings summary from visible evidence.

Do not assume prior SAS WORK datasets or conclusions remain available.

---

# Course Completion

You have completed the AF-002 course when you can explain and demonstrate this progression:

```text
visual input
    -> telemetry
        -> SAS analysis
            -> operational interpretation
                -> Human-in-Command decision support
```

You should now understand that IoT and AIoT become operationally useful when:

- evidence is understandable
- timing is explicit
- limitations are visible
- human judgment remains accountable
- the resulting action is proportional to the evidence

---

End of Lesson 05
