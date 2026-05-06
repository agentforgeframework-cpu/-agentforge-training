# Student Handout — Lesson 01: Simple Video and Images

Course: IoT/AIoT for SAS Programmers  
Status: Stabilization Draft

## Big Idea

A camera or image does not become useful just because AI detects something.

It becomes useful when detections are turned into structured operational events.

```text
input
→ inference
→ event
→ telemetry
→ SAS analytics
```

## Core Vocabulary

## Input

The source being analyzed.

Examples:
- webcam frame
- image file
- folder of images

## Inference

The model’s attempt to identify objects in the input.

In this lesson, YOLO performs inference.

## Detection

The model output.

Example:

```text
person, confidence=0.87
```

## Event

A structured record created from a detection.

Example:

```text
timestamp,camera_id,event_type,label,confidence
2026-05-05T19:12:34,BasementWebcam,person_detected,person,0.87
```

## Telemetry

The stream or collection of event records produced by the system.

## Why SAS Fits

Once events are written to CSV, SAS can:
- import the data
- summarize event counts
- review confidence scores
- identify exceptions
- analyze patterns over time

AIoT output can be treated as operational data.

## Basic SAS Import Example

```sas
proc import datafile="C:\path\to\events.csv"
    out=work.aiot_events
    dbms=csv
    replace;
    guessingrows=max;
run;

proc freq data=work.aiot_events;
    tables event_type label;
run;
```

## What YOLO Does

YOLO provides object detection.

It can identify categories such as:
- person
- dog
- bicycle
- keyboard
- chair
- truck

It does not automatically know business meaning.

## Important Distinction

```text
YOLO detects.
Event logic decides what matters.
SAS analyzes the resulting telemetry.
```

## Key Lesson

The AI model is only one layer.

The operational value comes from the full system:

```text
input layer
→ inference layer
→ event logic layer
→ persistence layer
→ analytics layer
```

## Reflection Questions

1. What is the difference between a detection and an event?
2. Why is a CSV file useful in this first lesson?
3. Where does SAS enter the pipeline?
4. What could cause a wrong detection?
5. Why is a missed detection still useful information?
6. What would need to change for a workplace system?
