# Lesson 01 — Simple Video and Images

Status: Stabilization Draft  
Course: IoT/AIoT for SAS Programmers  
Lesson Folder: `01-simple-video-and-images`

## Purpose

This lesson introduces the basic AIoT pattern using simple video and image inputs.

Learners build small, understandable pipelines that convert:

```text
camera or image input
→ AI inference
→ structured event records
→ CSV telemetry
→ SAS-ready data
```

The goal is not production-grade computer vision.

The goal is to understand how real-world signals can become operational data.

## What This Lesson Demonstrates

This lesson demonstrates three related input patterns:

1. Live webcam input
2. Single image input
3. Batch image folder processing

Each pattern produces structured event records that can be read by SAS.

## Core Idea

The camera or image is only the input.

The real learning happens when detections are converted into structured events that can be analyzed.

```text
Detection is perception.
Events create operational meaning.
SAS analyzes the resulting telemetry.
```

## Lesson Files

- `LESSON_GUIDE.md` — main lesson narrative and teaching flow
- `LAB_GUIDE.md` — hands-on lab steps
- `STUDENT_HANDOUT.md` — concise learner reference
- `INSTRUCTOR_NOTES.md` — teaching notes and pacing guidance
- `LESSON_STATUS.md` — stabilization and readiness tracking
- `scripts/` — Python scripts used in the lab

## Required Tools

- Windows or similar desktop environment
- Python 3.x
- Webcam for live video test
- Sample image files for image tests
- SAS or SAS-compatible environment for optional analytics follow-up

## Primary Lesson Outcome

By the end of the lesson, the learner should understand the basic operational AIoT flow:

```text
real-world input
→ model inference
→ event generation
→ persistent telemetry
→ SAS analytics
```

## Scope Boundary

This lesson intentionally avoids:
- production deployment
- industrial camera setup
- cloud infrastructure
- Kafka/MQTT
- enterprise digital twin implementation
- model training

Those topics belong in later lessons.
