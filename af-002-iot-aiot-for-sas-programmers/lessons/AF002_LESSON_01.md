# Lesson 01 — Create Telemetry

**Kit Type:** Training Kit  
**Status:** Production Candidate  
**Version:** 1.0  
**Repository:** AF-002 - IoT/AIoT for SAS Programmers  
**Repository Object:** ROOT_LIBRARY  
**Raw:** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/LIBRARY.md  
**This File (Raw):** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_01.md  

---

# Purpose

Lesson 01 creates the first complete AF-002 workflow:

```text
visual input
    -> AI-assisted observation
        -> structured telemetry
            -> CSV data
                -> SAS analysis
```

The learner will use either a webcam or retained sample images, generate telemetry, and analyze the result in SAS.

---

# AI Assistant Guidance

When assisting with this lesson:

- focus on completing the first end-to-end workflow
- do not expand into computer-vision theory
- do not introduce enterprise IoT architecture
- help the learner run one input path successfully
- help locate and inspect the generated CSV
- help import the CSV into SAS
- explain errors in plain operational language
- do not move to Lesson 02 until visible SAS output has been produced

The goal is operational success, not technical depth.

---

# Learning Objectives

By the end of this lesson, the learner should be able to:

- use a webcam or still images as telemetry input
- generate a telemetry CSV
- identify timestamps, object labels, confidence values, and source fields
- import telemetry into SAS
- summarize telemetry with SAS procedures
- explain how an AI-assisted observation becomes operational data

---

# What Is Telemetry?

Telemetry is structured data produced while a system operates.

In this lesson, a webcam or image file acts as a simple visual sensor. An object-detection model converts visible objects into records containing fields such as:

```text
timestamp
frame_number
object_detected
confidence
detection_count
source
```

You are not training an AI model.

You are observing how AI-assisted output becomes data that SAS can inspect and summarize.

---

# Required Files

Confirm that these repository files are available:

```text
python/webcam_object_telemetry.py
python/image_object_telemetry.py
sas/sas_import_object_events.sas
data/webcam_object_events_sample.csv
media/bridge.jpg
media/mountain.jpg
media/dog.jpg
media/banana.jpg
```

Use `LIBRARY.md` as the authoritative location for repository objects.

The following files are generated during the lesson and are not expected to exist before the scripts run:

```text
data/webcam_object_events.csv
data/image_object_events.csv
```

---

# Choose an Input Path

Complete at least one of the following:

## Path A — Webcam Telemetry

Use this path when a webcam is available and permitted.

## Path B — Still-Image Telemetry

Use this path when webcam access is unavailable, blocked, or unsuitable.

Both are valid Lesson 01 completion paths.

---

# Path A — Webcam Telemetry

## Step 1 — Run the Script

From the AF-002 repository root, run:

```text
python python/webcam_object_telemetry.py
```

On Windows, use this command when `python` is unavailable:

```text
py python/webcam_object_telemetry.py
```

A successful run should:

- open the webcam
- process a series of frames
- identify visible objects or record `NONE`
- create:

```text
data/webcam_object_events.csv
```

If the webcam cannot be opened, continue with the still-image path or use the sample CSV.

---

## Step 2 — Inspect the CSV

Open:

```text
data/webcam_object_events.csv
```

The file should contain columns similar to:

```text
timestamp,frame_number,object_detected,confidence,detection_count,source
```

Example rows may resemble:

```text
2026-05-12T10:54:40,0,person,0.9340,1,webcam
2026-05-12T10:54:41,1,keyboard,0.8982,1,webcam
2026-05-12T10:54:42,2,NONE,0.0000,0,webcam
```

Exact values will vary. That is expected.

A `NONE` record means that no object passed the configured detection threshold for that frame.

---

# Path B — Still-Image Telemetry

## Step 1 — Confirm the Images

Confirm that these files are present:

```text
media/bridge.jpg
media/mountain.jpg
media/dog.jpg
media/banana.jpg
```

## Step 2 — Run the Script

From the AF-002 repository root, run:

```text
python python/image_object_telemetry.py
```

On Windows, use:

```text
py python/image_object_telemetry.py
```

A successful run should process the retained sample images and create:

```text
data/image_object_events.csv
```

## Step 3 — Inspect the CSV

Open the generated file.

It should use the same basic fields as the webcam telemetry:

```text
timestamp
frame_number
object_detected
confidence
detection_count
source
```

The `source` field should identify the image used for each observation.

Exact detections may vary by model version and confidence threshold.

---

# Stable Sample-Data Fallback

When neither generated-data path is available, use:

```text
data/webcam_object_events_sample.csv
```

This provides a stable dataset for completing the SAS portion of the lesson.

Using the sample file still satisfies the lesson’s analytical objective, but the live or image-generated path is preferred when available.

---

# Import the Telemetry into SAS

Use:

```text
sas/sas_import_object_events.sas
```

The program imports object-event telemetry and produces basic inspection and summary output.

Before running the program, confirm that its telemetry path points to the CSV being used:

```text
data/webcam_object_events.csv
```

or:

```text
data/image_object_events.csv
```

or:

```text
data/webcam_object_events_sample.csv
```

Local SAS installations may require an absolute path, such as:

```text
C:\AF-002\data\webcam_object_events.csv
```

SAS OnDemand or SAS Studio users may need to upload the CSV and use the server-side file path.

---

# Expected SAS Results

A successful run should create a SAS dataset and produce visible output using procedures such as:

```text
PROC PRINT
PROC FREQ
PROC MEANS
```

The output should allow you to inspect:

- telemetry rows
- detected object labels
- detection frequencies
- confidence values
- detection counts
- source values

The important result is:

```text
SAS can read and analyze AI-assisted operational telemetry.
```

---

# Human-in-Command Review

AI-assisted detections are observations, not final operational truth.

Review the output carefully.

Ask:

- Does the object label appear reasonable?
- Is the confidence value high or low?
- Does a `NONE` record mean nothing happened, or only that nothing was recognized?
- Could lighting, camera position, image quality, or model limits affect the result?
- What should a human verify before using the record operationally?

The model provides evidence.

The human determines significance.

---

# Troubleshooting

## Python command not found

Use:

```text
py --version
```

Then substitute `py` for `python`.

## Required package missing

Return to `SETUP.md` and complete the dependency installation steps.

## Webcam does not open

Check:

- Windows camera permissions
- whether another application is using the camera
- organizational restrictions
- the configured camera index

Then use the still-image path or sample-data fallback.

## CSV not created

Confirm:

- the command was run from the repository root
- the script completed without an error
- the `data/` folder exists
- the output path printed by the script

## SAS cannot find the CSV

Update the SAS program to use the correct local or server-side path.

Do not change field names or file structure unless the lesson specifically requires it.

---

# Lesson 01 Success

Lesson 01 is complete when you can say:

> I generated or used AI-assisted telemetry and analyzed it in SAS.

You should be able to identify:

- the input source
- the telemetry CSV
- the imported SAS dataset
- visible SAS output
- at least one limitation requiring human interpretation

---

# Restart Checkpoint

When returning after an interruption:

1. Check whether one of these files exists:

```text
data/webcam_object_events.csv
data/image_object_events.csv
```

2. If a generated file exists, continue with the SAS import.
3. If no generated file exists, rerun an input script or use:

```text
data/webcam_object_events_sample.csv
```

---

# What You Just Did

You used a webcam, still image, or stable sample file as an operational input.

You converted observations into structured telemetry.

You stored that telemetry as CSV data.

You used SAS to inspect and summarize the result.

This is the foundational pattern for the remainder of AF-002.

---

# Next Step

Continue to:

```text
AF002_LESSON_02.md
```

Retrieve the lesson from the authoritative location in `LIBRARY.md`.

---

End of Lesson 01
