# SETUP — AF-002 IoT/AIoT for SAS Programmers

## Purpose

This file defines the basic environment assumptions and setup checks for AF-002.

SETUP is for environment preparation.

After setup is complete, continue with:

`LESSON_00_SETUP_AND_ORIENTATION.md`

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

Open Command Prompt or PowerShell.

Try:

```text
python --version
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

When installing on Windows, enable the option to add Python to PATH if it is offered.

After installation, close and reopen Command Prompt or PowerShell, then run:

```text
python --version
```

or:

```text
py --version
```

Do not continue until one of those commands returns a Python 3.x version.

---

## Python Packages Used in Lesson 01

Lesson 01 uses Python packages to capture webcam data and write telemetry output.

Install the expected packages with:

```text
python -m pip install opencv-python pandas
```

If `python` does not work but `py` does, use:

```text
py -m pip install opencv-python pandas
```

If pip reports that the packages are already installed, that is fine.

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

## After Setup

After setup is complete, continue with:

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_00_SETUP_AND_ORIENTATION.md

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_00_SETUP_AND_ORIENTATION.md

Repository-relative path:

```text
-agentforge-training/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_00_SETUP_AND_ORIENTATION.md
```

---

## Development and Test Environment

- Platform: ChatGPT Web
- Model: GPT-5.5 Thinking
- Date: 2026-05-09
- Notes: Updated after Claude digital twin survivability test.
