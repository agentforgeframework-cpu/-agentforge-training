# USER GUIDE — AF-002 IoT/AIoT for SAS Programmers

## Purpose

This guide explains how to use AF-002 as an AgentForge educational kit.

AF-002 is designed to help SAS professionals see that their existing operational analytics mindset applies naturally to telemetry systems, event systems, and AIoT workflows.

---

## How to Use This Course

Start with:

`QUICKSTART_af-002-iot-aiot-for-sas-programmers.md`

Then continue to:

`LESSON_00_SETUP_AND_ORIENTATION.md`

The course proceeds through the lesson files in `/lessons/`.

---

## Lesson Files

Each `LESSON_*.md` file acts as a self-contained instructional compartment.

A lesson file contains:

- instructional content
- operational workflow
- AI context
- restart boundary
- lesson-specific guidance

This means the lesson file itself is the AI-loadable instructional unit.

No separate `LOAD_LESSON*.md` files are used.

---

## Lesson Sequence

```text
LESSON_00_SETUP_AND_ORIENTATION.md
LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md
LESSON_02_EVENT_STREAMS_AND_REAL_TIME_THINKING.md
LESSON_03_AIOT_DECISION_LOOPS.md
LESSON_04_ARCHITECTURE_FOLLOWS_DATA_FOR_AIOT.md
LESSON_05_CAPSTONE_WORKFLOW.md
```

---

## Working With an AI Assistant

A learner may provide the current `LESSON_*.md` file to an AI assistant and work through that lesson.

The AI assistant should:

- follow the lesson file directly
- keep the learner oriented
- help troubleshoot setup and execution issues
- avoid adding unnecessary scope
- prompt the learner when ready to continue
- suggest moving to the next lesson when the current lesson is complete

The learner should not need to manually invoke separate lesson-loading files.

---

## Restarting a Lesson

To restart or continue a lesson:

1. Open the appropriate `LESSON_*.md` file.
2. Provide it to the AI assistant.
3. Ask the AI assistant to continue from that lesson.
4. If the result seems incorrect, copy the response back to the current support chat for troubleshooting.

---

## Course Design Principles

AF-002 is intentionally:

- lightweight
- practical
- operational
- survivable
- low-friction
- friendly to SAS professionals

The course should not drift into:

- AI hype
- enterprise architecture sprawl
- hardware complexity
- cloud lock-in
- unnecessary dependency chains
- LMS-style orchestration

---

## Primary Success Pattern

The central early success pattern is:

```text
webcam → telemetry → CSV → SAS analysis
```

This gives the learner a fast operational win and helps reframe IoT as operational analytics data rather than mysterious hardware.

---

# Development & Test Environment

- Platform: ChatGPT (Web)
- Model: GPT-5.5
- Date: 2026-05-09

Notes:
- Updated to align with the finalized LESSON_*.md educational architecture.
