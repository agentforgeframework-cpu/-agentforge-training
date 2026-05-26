# LL-2026-05-25 — Runtime Facilitator Variance

Status: APPROVED

## Summary

Lesson 04 revealed that AI runtime facilitation behavior is itself a deployment surface.

The lesson content, artifacts, repository structure, SAS code, and operational workflow all survived validation. However, runtime agents sometimes:
- summarized instead of surfacing
- narrated instead of staging
- compressed instead of pausing
- hid operational checkpoints
- omitted learner-facing links
- omitted embedded SAS execution blocks

This created survivability failures even when the lesson itself was correct.

## Key Discovery

An instructional artifact existing is not the same as the learner seeing it.

This is especially important for:
- images
- SAS execution blocks
- operational transitions
- learner checkpoints

## Operational Implication

AI-assisted education systems must account for:
- facilitator behavioral variance
- pacing compression
- hidden summarization
- artifact surfacing failures

The runtime AI became part of the operational environment.

## Corrective Pattern

Critical learner actions should use explicit operational commands such as:

STOP.

Open this image BEFORE continuing.

Do not continue until the learner confirms the image is visible.

Likewise for SAS execution:
- clearly isolate runnable blocks
- explicitly pause the learner
- confirm successful execution before proceeding

## Broader AF Principle

Runtime delivery behavior and repository correctness are separate concerns.

A technically correct lesson can still fail operationally if the runtime facilitator hides or compresses critical learner actions.

## Development & Test Environment

Project:
AF-002 — IoT/AIoT for SAS Programmers

Lesson:
Lesson 04 — Use Spatial Telemetry Operationally

Model:
GPT-5.5

Date:
2026-05-25
