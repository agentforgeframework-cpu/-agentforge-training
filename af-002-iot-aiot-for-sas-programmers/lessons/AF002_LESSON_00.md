# Lesson 00 — Prepare

**Kit Type:** Training Kit  
**Status:** Production Candidate  
**Version:** 1.0  
**Repository:** AF-002 - IoT/AIoT for SAS Programmers  
**Repository Object:** ROOT_LIBRARY  
**Raw:** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/LIBRARY.md  
**This File (Raw):** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_00.md  

---

# Purpose

Lesson 00 confirms that the learner is ready to begin the AF-002 telemetry workflow.

This lesson does not repeat the full setup process. If Python, required packages, SAS access, or repository files are not ready, return to `SETUP.md` before continuing.

---

# AI Assistant Guidance

When assisting with this lesson:

- verify each readiness check
- address only the current problem
- use `SETUP.md` for installation and recovery guidance
- do not introduce advanced IoT architecture
- do not begin Lesson 01 until the readiness checks are complete

The goal is readiness and confidence.

---

# Learning Objectives

By the end of this lesson, the learner should be able to:

- identify the main AF-002 workflow
- confirm access to Python and required packages
- confirm access to SAS
- confirm webcam access or the still-image fallback
- locate the files required by Lesson 01
- state what Lesson 01 will accomplish

---

# The AF-002 Workflow

AF-002 begins with a small operational telemetry workflow:

```text
webcam or still image
    -> AI-assisted observation
        -> structured telemetry
            -> CSV data
                -> SAS analysis
```

In this course, telemetry means structured operational observations or measurements derived from device input.

The purpose is not to build a large streaming platform.

The purpose is to show how AI-assisted observations can become understandable data that SAS programmers can inspect, summarize, and use operationally.

---

# Readiness Check 1 — Python

Run one of the following commands:

```text
python --version
```

or:

```text
py --version
```

The check is complete when one command returns a Python 3.x version.

If neither command works, return to `SETUP.md`.

---

# Readiness Check 2 — Required Packages

Run:

```text
python -c "import pandas; print('pandas OK')"
python -c "import cv2; print('opencv OK')"
python -c "from ultralytics import YOLO; print('ultralytics OK')"
```

Use `py` instead of `python` when required by the local Windows installation.

The check is complete when all three commands run without import errors.

If a package is missing, return to `SETUP.md`.

---

# Readiness Check 3 — Input Path

Lesson 01 can use either:

* a live webcam
* the still-image fallback

For the live path, confirm that the Windows Camera app can display an image.

For the fallback path, confirm that these files exist:

```text
media/bridge.jpg
media/mountain.jpg
media/dog.jpg
media/banana.jpg
```

The check is complete when at least one input path is available.

---

# Readiness Check 4 — SAS

Open the SAS environment that will be used for the course.

The environment must be able to:

* run a SAS program
* import a CSV file
* display printed or summarized results

The check is complete when SAS is accessible.

If SAS is not available, return to `SETUP.md`.

---

# Readiness Check 5 — Lesson 01 Files

Confirm that these files are available:

```text
python/webcam_object_telemetry.py
python/image_object_telemetry.py
sas/sas_import_object_events.sas
data/webcam_object_events_sample.csv
```

These files provide:

* live webcam telemetry
* still-image telemetry
* SAS CSV import
* a stable sample-data fallback

Use `LIBRARY.md` as the authoritative location for repository objects.

---

# Lesson 00 Success

Lesson 00 is complete when you can say:

> Python, SAS, and at least one telemetry input path are ready.

You should also be able to say:

> I know that Lesson 01 will turn AI-assisted observations into structured telemetry and analyze that telemetry in SAS.

---

# Restart Checkpoint

When returning after an interruption, confirm:

* Python works.
* Required packages load.
* SAS is accessible.
* Webcam or still-image input is available.
* Lesson 01 support files are present.

Then continue to Lesson 01.

---

# Next Step

When the Lesson 00 success conditions are complete, state:

```text
LESSON 00 COMPLETE
```

Retrieve and verify `AF002_LESSON_01.md` through the authoritative routing defined in `SETUP.md` and `LIBRARY.md`.

Display the minimum identity check, then state:

```text
LESSON 01 VERIFIED — BEGINNING LESSON 01
```

Declare Lesson 01 active and begin instruction from that retrieved file.

If retrieval or identity verification fails, stop and follow the failure rules in `SETUP.md`.

---

End of Lesson 00
