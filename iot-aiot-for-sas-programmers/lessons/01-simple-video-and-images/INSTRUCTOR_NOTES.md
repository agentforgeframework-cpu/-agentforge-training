# Instructor Notes — Lesson 01: Simple Video and Images

Course: IoT/AIoT for SAS Programmers  
Status: Stabilization Draft

## Teaching Purpose

This lesson introduces AIoT as an operational event system, not as an AI magic trick.

The goal is to help SAS programmers see that computer vision output can become structured telemetry suitable for SAS analysis.

## Best Teaching Frame

Use this framing repeatedly:

```text
The camera provides input.
The model provides perception.
The code creates events.
CSV stores telemetry.
SAS analyzes the data.
```

## Target Learner

The primary learner is an experienced SAS programmer or analytics professional who may have limited exposure to:
- cameras
- computer vision
- middleware
- Python AI libraries
- event streams

Assume the learner understands:
- rows and columns
- operational data
- batch processing
- logs
- exception handling
- reporting

## Pacing Guidance

The lesson works best when the learner gets a visible result early.

Do not begin with a long lecture on AI, YOLO, middleware, or architecture.

Preferred rhythm:
1. run something
2. inspect output
3. explain what happened
4. refine the output
5. connect to SAS thinking
6. reflect architecturally

## What Worked Well in Prototype Testing

The prototype worked because the learner could mentally model the entire system.

The learner saw:
- webcam input
- model detections
- CSV rows
- classification errors
- batch image processing
- SAS-ready structure

This created confidence and momentum.

## Expected Friction Points

Common issues:
- Python or pip not available
- camera permissions
- first-time YOLO model download
- filename mismatches
- `.jpg` vs `.jpeg`
- no detections on some images
- unexpected classifications
- color detection instability if optional color work is attempted

Treat these as educational opportunities.

## Important Teaching Point

Do not overreact to imperfect model results.

Examples:
- a forklift detected as a truck
- no detections above threshold
- shirt color misclassification

These are useful because they reveal:
- model limitations
- category limitations
- confidence thresholds
- interpretation-layer tuning

## Keep Scope Controlled

Do not expand Lesson 1 into:
- production architecture
- cloud deployment
- Kafka
- MQTT
- edge hardware
- digital twin implementation
- model training

Mention these as future topics when useful.

## Good Discussion Prompts

- What changed when we filtered only for people?
- Why is the CSV event file more useful than the raw image?
- What does the model know?
- What does the model not know?
- Where does business meaning enter the system?
- What would SAS do with this data?
- What would count as an exception?
- What would need to be validated before workplace use?

## Instructor Reminder

The lesson succeeds when the learner understands the operational flow.

Perfect detection accuracy is not required.
