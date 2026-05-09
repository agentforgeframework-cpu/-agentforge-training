# Lesson 01 - Simple Video and Images

Course: AF-002 - IoT and AIoT for SAS Programmers

Repository-relative path: `/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md`  
GitHub URL: pending repository placement

---

# Lesson Purpose

Create the first webcam-to-CSV-to-SAS success.

---

# Learning Objectives

- capture simple webcam or image information
- generate a small telemetry CSV
- import the CSV into SAS
- produce visible SAS output
- recognize telemetry as operational data

---

## Core Workflow

1. Capture webcam or image input.
2. Generate a simple telemetry row.
3. Save telemetry to CSV.
4. Import the CSV into SAS.
5. Produce visible SAS output.

## First Success

> I generated operational telemetry data and analyzed it with SAS.

## Activity

Use `core-tools/webcam_telemetry_capture.py` to create a simple CSV file.

Then use `examples/sas_import_telemetry.sas` to import and inspect the CSV in SAS.

## Recap

IoT stops being mysterious when it becomes timestamped operational data.


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
