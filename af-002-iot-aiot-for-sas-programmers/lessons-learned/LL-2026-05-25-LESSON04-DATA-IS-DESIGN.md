# LL-2026-05-25 — Data Is Design

Project:
AF-002 — IoT/AIoT for SAS Programmers

Lesson:
Lesson 04 — Use Spatial Telemetry Operationally

Date:
2026-05-25

Status:
APPROVED

---

# Summary

Lesson 04 exposed an important operational and instructional principle:

```text
Data is Design.
```

The issue discovered was not:
- SAS syntax
- AI detection quality
- graph generation
- telemetry ingestion

The issue was:

```text
credibility architecture
```

The learner subconsciously evaluates:
- whether the telemetry feels manipulated
- whether operational conclusions appear pre-decided
- whether the evidence chain feels trustworthy
- whether the workflow feels operationally believable

---

# Original Problem

The original congestion dataset contained:

```text
overlap_flag
```

inside the raw telemetry dataset.

This created several operational realism problems:
- analytical conclusions were embedded in the source telemetry
- the lesson appeared to "pre-answer" the investigation
- SAS appeared to confirm a precomputed result
- learner trust weakened

Additionally:

```text
SHARED
```

zone activity only appeared during congestion periods.

This unintentionally created:
- selection bias
- incomplete operational evidence
- questionable telemetry collection realism

The learner correctly identified:
- missing ordinary SHARED activity
- precomputed analytical interpretation
- possible telemetry collection inconsistency

---

# Corrective Action

The telemetry dataset was redesigned as:

```text
square operational telemetry
```

The corrected dataset:
- removed overlap_flag
- removed precomputed congestion states
- preserved only raw operational observations
- added ordinary SHARED-zone activity outside congestion periods
- preserved realistic operational variation

SAS then derived:
- overlap windows
- shared-zone escalation
- operational interpretation

This materially improved:
- learner trust
- operational realism
- instructional integrity
- Human-in-Command reasoning

---

# Important Instructional Discovery

The strongest instructional outcome became:

```text
SAS helped reveal a normalized workflow problem.
```

instead of:

```text
The dataset already contained the answer.
```

This distinction proved extremely important.

---

# Operational Realism Discovery

The congestion pattern became believable because:
- normal baseline periods existed
- ordinary SHARED activity existed
- escalation became visible through contrast
- congestion appeared operationally emergent

The resulting operational conclusion:

```text
Move the time clock.
```

felt:
- simple
- realistic
- inexpensive
- operationally believable

This strongly reinforced:
- Human-in-Command reasoning
- operational investigation
- SAS operational analysis
- telemetry skepticism

---

# Runtime Survivability Discovery

Another major runtime issue was discovered:

The learner should NEVER need to ask for runnable SAS code.

The lesson must:
- provide copy/paste-ready SAS code
- provide file-based execution options secondarily
- support environments where `%INCLUDE` is restricted
- support environments where filesystem access differs

This became known as:

```text
copy-and-run SAS survivability
```

The approved operational pattern became:
1. Copy-and-run code block first
2. File-based `%INCLUDE` option second

---

# Broader AF Principle

Lesson 04 reinforced a broader AgentForge principle:

```text
Operational understanding emerges from
visible evidence plus bounded uncertainty.
```

Additionally:

```text
Data structure itself influences operational trust.
```

This may have future relevance to:
- Human-in-Command governance
- telemetry curriculum design
- operational analytics
- SAS instructional design
- AI governance discussions
- credibility architecture
- "Data is Design"

---

# Related Concepts

- Human-in-Command reasoning
- active evidence
- operational realism
- bounded uncertainty
- credibility architecture
- square datasets
- telemetry skepticism
- copy-and-run survivability

---

# Development & Test Environment

Project:
AF-002 — IoT/AIoT for SAS Programmers

Lesson:
Lesson 04 — Use Spatial Telemetry Operationally

Model:
GPT-5.5

Date:
2026-05-25