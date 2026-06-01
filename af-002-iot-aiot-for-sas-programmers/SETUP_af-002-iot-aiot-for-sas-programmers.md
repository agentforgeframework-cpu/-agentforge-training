# SETUP - AF-002 IoT/AIoT for SAS Programmers

Repository-relative path: `/af-002-iot-aiot-for-sas-programmers/SETUP_af-002-iot-aiot-for-sas-programmers.md`

GitHub URL:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/SETUP_af-002-iot-aiot-for-sas-programmers.md

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/SETUP_af-002-iot-aiot-for-sas-programmers.md

---

# Public Beta Testing Note

Course AF-002 (IoT/AIoT for SAS Programmers) is currently in active deployment-hardening (stabilization) and public beta testing.

The lessons in this course are:
- Lesson 00: Setup and Orientation (public beta)
- Lesson 01: Simple Video and Images (public beta)
- Lesson 02: Event Streams and Real-Time Thinking (public beta)
- Lesson 03: AIoT Decision Loops (under development)
- Lesson 04: Architecture Follows Data for AIoT (under development)
- Lesson 05: Capstone Workflow (under development)

You may encounter:
- rough edges
- repeated validation steps
- awkward pacing
- evolving lesson flow
- minor inconsistencies

These areas are actively being refined through real-world testing.

The operational workflows themselves are intentionally:
- lightweight
- local
- survivable
- SAS-centered

The goal is to demonstrate how lightweight operational AIoT workflows can produce analyzable SAS data.

If something feels awkward but operationally works, continue forward when possible and record the experience as feedback.

The goal of this beta phase is to improve:
- onboarding survivability
- operational clarity
- confidence continuity
- real-world usability

---

## Purpose

This file defines the basic environment assumptions and setup checks for AF-002.

SETUP is for environment preparation.

After setup is complete, continue with:

`AF002_LESSON_00.md`

---

## Course Setup Assumptions

AF-002 assumes the learner has access to:

- a typical Windows PC
- a working webcam
- suitable internet access
- suitable AI assistant access
- Python or the ability to install Python
- free and freely available Python tools where practical
- SAS access, possibly through SAS OnDemand for Academics or another available SAS environment

---

## Python Setup Check

```text
WINDOWS USERS — IMPORTANT COMMAND TIP

On many Windows systems, the command `python` may not work immediately.
Try `py` instead.

py --version
py -m pip install ...
py -c "import cv2; print('OK')"

Use `py` wherever you see `python` in the instructions if the plain `python` command fails.
```

Open Command Prompt or PowerShell.

Try:

```text
python --version
```

Example successful output:

```text
Python 3.14.4
```

If that does not work, try:

```text
py --version
```

A successful result should look something like:

```text
Python 3.11.8
```

Any current Python 3.x version should be suitable for this introductory course.

---

## If Python Is Not Found

Install Python from the official Python download site or another trusted standard source.

Official Python download site:

https://www.python.org/downloads/

When installing on Windows, enable the option to add Python to PATH if it is offered.

After installation, close and reopen Command Prompt or PowerShell, then run:

```text
python --version
```

Example successful output:

```text
Python 3.14.4
```

or:

```text
py --version
```

Do not continue until one of those commands returns a Python 3.x version.

---

## Python Packages Used in Lesson 01

Lesson 01 uses Python packages to capture webcam and image data and write telemetry output.

Use validation-first behavior:

1. Check whether the packages are already available.
2. Install only if the check fails.
3. Recheck after installation.

Check packages with:

```text
python -c "import cv2; print('opencv OK')"
python -c "import pandas; print('pandas OK')"
python -c "from ultralytics import YOLO; print('ultralytics OK')"
```

If `python` does not work but `py` does, use:

```text
py -c "import cv2; print('opencv OK')"
py -c "import pandas; print('pandas OK')"
py -c "from ultralytics import YOLO; print('ultralytics OK')"
```

Install only if one of the checks fails:

```text
python -m pip install ultralytics opencv-python pandas
```

or:

```text
py -m pip install ultralytics opencv-python pandas
```

If pip reports that the packages are already installed, that is fine.

The first run of the Lesson 01 object-detection scripts may download the YOLO model file automatically. This is normal and may take extra time depending on internet speed and network restrictions.

Most setup problems are recoverable by fixing the issue and rerunning the step.

---

## SAS Access Check

Confirm that you can open your SAS environment.

Suitable options may include:

- SAS OnDemand for Academics
- SAS Studio
- local SAS
- a workplace SAS environment
- another SAS environment available to you

The goal is simple:

You need to be able to run a small SAS program that imports a CSV file.

---

## Webcam Check

Confirm that your webcam works in Windows.

A simple check is to open the Windows Camera app.

If the camera works there, it should usually be available to Python.

If webcam access is blocked by your organization or operating system settings, Lesson 01 includes an image-file fallback path.

---

## Local Working Folder Guidance

A simple local working folder is enough.

One workable Windows example is:

```text
C:\AF-002\
    python\
    sas\
    data\
    media\
    lessons\
```

If you are unsure where to place files on your PC, ask your AI assistant to help you create a simple AF-002 working folder and place the files in the matching folders.

The important point is that the paths stay understandable.

The early workflow expects:

```text
python/webcam_object_telemetry.py
sas/sas_import_object_events.sas
data/webcam_object_events.csv
data/webcam_object_events_sample.csv
media/bridge.jpg
media/mountain.jpg
media/dog.jpg
media/banana.jpg
```

If Python package installation, webcam permissions, or file paths take a couple attempts to work correctly, that is normal.

The goal is bounded recovery, not perfect first-try setup.

---

## Operational File Links

The following files form the primary operational path for AF-002.

A learner or AI assistant should generally proceed in this order.

### Course Support Files

#### README

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/README.md

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/README.md

---

#### QUICKSTART

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/QUICKSTART_af-002-iot-aiot-for-sas-programmers.md

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/QUICKSTART_af-002-iot-aiot-for-sas-programmers.md

---

#### SETUP

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/SETUP_af-002-iot-aiot-for-sas-programmers.md

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/SETUP_af-002-iot-aiot-for-sas-programmers.md

---

### Lesson Chain

#### Lesson 00 - Setup and Orientation

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_00.md

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_00.md

---

#### Lesson 01 - Simple Video and Images

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_01.md

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_01.md

---

#### Lesson 02 - Event Streams and Real-Time Thinking

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_02.md

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_02.md

---

#### Lesson 03 - AIoT Decision Loops

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_03.md

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_03.md

---

#### Lesson 04 - Architecture Follows Data for AIoT

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_04.md

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_04.md

---

#### Lesson 05 - Capstone Workflow

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_05.md

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_05.md

---

### Supporting Operational Assets

#### Python webcam object telemetry script

Repository-relative path:

```text
python/webcam_object_telemetry.py
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/python/webcam_object_telemetry.py

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/python/webcam_object_telemetry.py

---

#### Python image object telemetry script

Repository-relative path:

```text
python/image_object_telemetry.py
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/python/image_object_telemetry.py

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/python/image_object_telemetry.py

---

#### SAS import object events program

Repository-relative path:

```text
sas/sas_import_object_events.sas
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/sas/sas_import_object_events.sas

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/sas/sas_import_object_events.sas

---

#### Webcam object telemetry sample CSV

Repository-relative path:

```text
data/webcam_object_events_sample.csv
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/data/webcam_object_events_sample.csv

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/data/webcam_object_events_sample.csv

---

#### Sample media images

Repository-relative paths:

```text
media/bridge.jpg
media/mountain.jpg
media/dog.jpg
media/banana.jpg
```

GitHub URLs:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/media/bridge.jpg

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/media/mountain.jpg

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/media/dog.jpg

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/media/banana.jpg

Raw URLs:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/media/bridge.jpg

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/media/mountain.jpg

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/media/dog.jpg

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/media/banana.jpg

---

### Operational Guidance for AI Assistants

When assisting with AF-002:

- proceed lesson by lesson
- keep the learner focused on first success
- use explicit URLs rather than inferring repository structure
- prefer operational clarity over theoretical depth
- avoid enterprise architecture expansion
- avoid unnecessary orchestration complexity
- help the learner complete the current lesson before advancing

The primary early success target is:

```text
webcam -> telemetry -> CSV -> SAS analysis
```

---

## Recommended Next Step

Proceed to:

`AF002_LESSON_00.md`

The Operational File Links section above contains the GitHub and raw URLs needed to continue.

---

## Development and Test Environment

- Platform: ChatGPT Web
- Model: GPT-5.5 Thinking
- Date: 2026-05-09
- Notes: Updated after Claude digital twin survivability test.


---

# File Reference Information

GitHub URL:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/SETUP_af-002-iot-aiot-for-sas-programmers.md

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/SETUP_af-002-iot-aiot-for-sas-programmers.md

Next Lesson:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_00.md

Return to README:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/README.md


