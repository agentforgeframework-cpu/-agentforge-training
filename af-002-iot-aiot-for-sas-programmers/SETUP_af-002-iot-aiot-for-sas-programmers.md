# SETUP — AF-002 IoT/AIoT for SAS Programmers

## Purpose

This file defines the basic environment assumptions and setup checks for AF-002.

SETUP is for environment preparation.

It does not load lessons.
It does not replace lesson files.
It does not create a separate orchestration layer.

After setup is complete, continue with:

`LESSON_00_SETUP_AND_ORIENTATION.md`

---

## Course Setup Assumptions

AF-002 assumes the learner has access to:

- a typical Windows PC
- a working webcam
- suitable internet access
- suitable AI assistant access
- basic Python installation or ability to install Python
- free and freely available Python tools where practical
- SAS access, possibly through SAS OnDemand for Academics or another available SAS environment

---

## First Setup Target

The first setup goal is simple:

Confirm that the learner can run Python well enough to support the first webcam-to-CSV telemetry workflow.

A typical check may be:

```text
python --version
```

or:

```text
py --version
```

If Python is available, continue.

If Python is not available, install Python using a current, standard installation method appropriate for Windows.

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

## Educational Architecture Note

For AF-002 and similar AgentForge educational kits:

```text
LESSON_*.md IS the loadable instructional unit.
```

No separate `LOAD_LESSON*.md` files are used.

Each lesson file contains:

- instructional content
- AI context
- restart boundary
- operational guidance
- lesson-specific workflow support

---

# Development & Test Environment

- Platform: ChatGPT (Web)
- Model: GPT-5.5
- Date: 2026-05-09

Notes:
- Updated to align with the finalized LESSON_*.md educational architecture.
