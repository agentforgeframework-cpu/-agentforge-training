# LESSON 00 — Setup and Orientation

Course: AF-002 - IoT and AIoT for SAS Programmers

Repository-relative path: `/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_00_SETUP_AND_ORIENTATION.md`

GitHub URL:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_00_SETUP_AND_ORIENTATION.md

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_00_SETUP_AND_ORIENTATION.md

---

# Lesson Purpose

Prepare the learner for the AF-002 study and lab environment.

This lesson checks your gear, confirms the basic workspace, and helps you get grounded before the first telemetry workflow.

Think of this as the first day of class: where things are, what tools you need, and how to know you are ready.

---

# AI Assistant Guidance

If you are assisting a learner with this lesson:

- guide the learner step by step
- do not skip setup checks
- do not expand into advanced IoT architecture
- keep the tone practical and reassuring
- help troubleshoot only the current setup issue
- transition to Lesson 01 only when the learner has confirmed readiness

The goal is confidence and readiness, not technical depth.

---

# Learning Objectives

By the end of this lesson, the learner should be able to:

- identify the main course files
- verify Python access
- install or confirm required Python packages
- verify SAS access
- verify webcam access or understand the image-file fallback
- understand what will happen in Lesson 01

---

# What You Are Preparing For

In Lesson 01, you will create the first practical course success:

```text
webcam 
  → AI-assisted observations
    → telemetry 
       → raw data 
          → SAS analysis
```

In this course, "telemetry" means structured operational observations or measurements derived from webcams or other IoT/AIoT device input.

This means:

1. Python will use your webcam and an AI model to recognize simple operational objects.
2. Python will convert those observations into telemetry data.
3. The telemetry will be written as raw data for SAS analysis.
4. SAS will import and analyze the telemetry data.
5. You will see that AI-assisted operational observations can become analyzable SAS data.

---


> **🚀 Windows Users – Important Command Tip**
>
> On many Windows systems, the command `python` may not work immediately.
> Try `py` instead.
>
> ```text
> py --version
> py -m pip install ...
> py -c "import cv2; print('OK')"
> ```
>
> Use `py` wherever you see `python` in the instructions if the plain `python` command fails.

---

# Why This Lesson Matters

Modern systems constantly produce operational measurements.

Those measurements might come from:
- sensors
- cameras
- applications
- industrial equipment
- websites
- operational processes

This course demonstrates a lightweight version of that workflow using tools that many SAS professionals already understand.

You are NOT building a hyperscale streaming platform.

You are building a small operational telemetry workflow:

In Lesson 01, the webcam will recognize simple operational objects and generate telemetry that SAS can analyze.

```text
webcam
  → AI-assisted observations
    → telemetry
      → raw data
        → SAS analysis
```

The goal is not perfection.

The goal is operational familiarity and confidence.

You do not need to understand everything immediately.

If something feels confusing at first, that is normal.

Most setup and workflow problems are recoverable by correcting the issue and rerunning the step.

As you move through the lessons, focus on:

- understanding the workflow
- observing the outputs
- building confidence with operational data

You can always ask another person or an AI assistant for help if needed.

---


## Resume Here

If you are returning after interruption, continue from this step.

# Setup Check 1 — Confirm Python

Open Command Prompt or PowerShell.

Run:

```text
python --version
```

If that does not work, run:

```text
py --version
```

A successful result should look something like:

```text
Python 3.11.8
```

Any current Python 3.x version should be suitable for this introductory course.

Validation:
Python is available when `python --version` or `py --version` returns a Python 3.x version.

## If Python Is Not Found

Install Python using a current trusted Windows installation method.

During installation, choose the option to add Python to PATH if it is offered.

After installation:

1. Close Command Prompt or PowerShell.
2. Open it again.
3. Run `python --version` or `py --version` again.

Do not continue until one of those commands returns a Python 3.x version.

Most setup problems are recoverable by fixing the issue and rerunning the step.

---

# Setup Check 2 — Confirm Python Packages

Open Command Prompt or PowerShell.

First check whether the required packages already exist.

Run this command:

```text
python -c "import pandas; print('pandas OK')"
```

If that succeeds, run:

```text
python -c "import cv2; print('opencv OK')"
```

If that succeeds, run:

```text
python -c "from ultralytics import YOLO; print('ultralytics OK')"
```

If any command fails, install the required packages using:

```text
python -m pip install ultralytics opencv-python pandas
```

If `python` does not work on your system but `py` does, replace `python` with `py` in the commands above.

Validation:

This step is successful when the package check completes without errors.

Lesson 00 Milestone:

Python and required packages are operational.

---

# Setup Check 3 — Confirm Webcam Access

Open the Windows Camera app.

Confirm that the webcam displays an image.

If the webcam works in the Windows Camera app, it should usually be available to Python.

If your webcam is blocked by security settings, privacy settings, or organizational policy, do not panic. Lesson 01 can still use an image-file fallback path if needed.

If webcam permissions, Python packages, or local file paths take a couple attempts to work correctly, that is normal.

The goal is to recover calmly and keep the workflow understandable.

Validation:
This step is successful if the Windows Camera app displays an image, or if you have confirmed that the image-file fallback will be used.

---

# Setup Check 4 — Confirm SAS Access

Open your SAS environment.

Suitable options may include:

- SAS OnDemand for Academics
- SAS Studio
- local SAS
- a workplace SAS environment
- another SAS environment available to you

The basic requirement is simple:

You need to be able to run a small SAS program that imports a CSV file.

You do not need an enterprise IoT platform.

You do not need a cloud IoT service.

You do not need special hardware beyond the course assumptions.

Validation:

This step is successful when the learner can open and access a SAS environment.

---

# Setup Check 5 — Confirm File Awareness

You should know where these course folders are:

```text
/python
/sas
/data
/lessons
```

For Lesson 01, the most important supporting files are expected to be:

```text
python/webcam_object_telemetry.py
python/image_object_telemetry.py
sas/sas_import_object_events.sas
```

Verification:

The expected supporting files are present when you can locate:

`python/webcam_object_telemetry.py`
`python/image_object_telemetry.py`
`sas/sas_import_object_events.sas`

If those files are not present, pause and confirm that the course repository copied or downloaded correctly.

Lesson 00 Milestone:

Basic telemetry lab environment is ready for Lesson 01.

---

# Visible Checkpoint

You should now have or be able to access:

- a working Python command
- required Python packages, or a clear plan to install them
- SAS access
- webcam access or the image-file fallback
- the `/python/`, `/sas/`, `/data/`, and `/lessons/` folders
- the Lesson 01 raw URL listed below

If one item is not ready, fix that item and rerun the relevant check.

---

# Lesson 00 Success

You are ready when you can say:

> My basic lab environment is ready, and I know where the course files are.

You should also be able to say:

> I know that Lesson 01 will turn AI-assisted webcam observations into telemetry data and analyze that telemetry in SAS.

---

# What You Just Did

You checked the basic lab environment before running the first telemetry workflow.

That matters because IoT and AIoT work often fails from setup friction before it fails from analytics difficulty.

This lesson keeps setup simple so the first operational success can happen quickly.

---

# Restart Checkpoint

If you stop here, restart later by opening this lesson file again and confirming:

- Python works.
- Required Python packages are installed.
- SAS access works.
- Webcam or image-file fallback is available.
- You know where the `/python/`, `/sas/`, and `/data/` folders are.

Then continue to Lesson 01.

---

# Next Step

Continue to:

`LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md`

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md

---

# Recap

Lesson 00 checks your gear and helps you get grounded so you can succeed in the rest of the course.

---

# Development and Test Environment

- Platform: ChatGPT Web
- Model: GPT-5.5 Thinking
- Date: 2026-05-09
- Notes: Updated after Claude digital twin survivability test.

---

# License

Paul McDonald Open Use License (MIT-style)

© 2026 Paul McDonald


## Visual Brief

Review visual summary:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/media/AF-002_LESSON_00_VISUAL_BRIEF.png

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/media/AF-002_LESSON_00_VISUAL_BRIEF.png


---

# File Reference Information

GitHub URL:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_00_SETUP_AND_ORIENTATION.md

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_00_SETUP_AND_ORIENTATION.md

Previous Lesson:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/SETUP_af-002-iot-aiot-for-sas-programmers.md

Next Lesson:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md

Return to README:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/README.md
