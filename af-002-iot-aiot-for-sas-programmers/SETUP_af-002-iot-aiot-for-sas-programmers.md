# SETUP - AF-002 IoT and AIoT for SAS Programmers

Repository-relative path: `/af-002-iot-aiot-for-sas-programmers/SETUP_af-002-iot-aiot-for-sas-programmers.md`  
GitHub URL: pending repository placement

---

# Purpose

This file defines the AF-002 study and lab environment.

Setup is intentionally practical. The goal is not to build an enterprise AIoT platform. The goal is to prepare a survivable learning environment.

---

# Required Environment

AF-002 assumes:

- Typical Windows PC
- Webcam
- Current Windows deployment
- Basic Python installed
- Free and freely available Python tools
- SAS access, possibly through SAS OnDemand for Academics
- Suitable internet access
- Suitable AI assistant access

This required list defines the v1.0 setup boundary.

---

# Python Check

Open Command Prompt and run:

```bat
python --version
```

If you see a Python version, continue.

If not, install Python from the official Python distribution or a trusted organization-approved source, then repeat the check.

---

# Python Package Check

Lesson 1 uses OpenCV for webcam capture.

Run:

```bat
python -m pip show opencv-python
```

If it is not installed and your environment permits Python packages, run:

```bat
python -m pip install opencv-python
```

If your organization blocks package installation, continue with still image examples or ask your AI assistant to help adapt the lesson.

---

# SAS Check

Confirm you can run SAS code in one of these environments:

- local SAS
- SAS Studio
- SAS OnDemand for Academics
- organization-provided SAS environment

You need to be able to import a CSV file and run basic SAS procedures.

---

# Webcam Check

Confirm the PC has a working webcam.

If webcam access is blocked, Lesson 1 can still use saved image files as a fallback.

---

# Orientation Check

After setup, continue to:

`lessons/LESSON_00_SETUP_AND_ORIENTATION.md`


---

# Development and Test Environment

- Platform: ChatGPT Web
- Model: GPT-5.5 Thinking
- Date: 2026-05-09
- Notes: Implemented during AgentForge Step 5 Wave 2 operational rollout for AF-002.

---

# License

Paul McDonald Open Use License (MIT-style)

© 2026 Paul McDonald
