# README.md

**Kit Type:** Training Kit  
**Status:** Production Candidate  
**Version:** 1.0  
**Repository:** AF-002 - IoT/AIoT for SAS Programmers  
**Repository Object:** ROOT_LIBRARY  
**Raw:** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/LIBRARY.md  
**This File (Raw):** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/sas/README.md  

---

# Purpose

The `sas/` folder contains the SAS programs used by AF-002 lessons.

These programs import telemetry, analyze spatial and operational patterns, and create selected Lesson 05 outputs.

Use the authoritative file locations defined in `LIBRARY.md`.

---

# Contents

## Lessons 00 and 01

```text
sas_import_object_events.sas
```

Imports object-event telemetry into SAS for inspection and analysis.

## Lesson 04

```text
AF002_LESSON_04_SAS_UTILITIES.sas
AF002_LESSON_04_CONGESTION_INVESTIGATION.sas
```

`AF002_LESSON_04_SAS_UTILITIES.sas` supports spatial telemetry, bounding-box, coordinate, and region analysis.

`AF002_LESSON_04_CONGESTION_INVESTIGATION.sas` supports congestion and operational-pattern investigation.

## Lesson 05

```text
AF002_L05_TINY_SAS_OUTPUT_SET_v0_2.sas
AF002_L05_TIMESTAMP_TIMEPLOT_v0_1.sas
```

`AF002_L05_TINY_SAS_OUTPUT_SET_v0_2.sas` creates the compact SAS output used in Lesson 05.

`AF002_L05_TIMESTAMP_TIMEPLOT_v0_1.sas` creates the timestamp comparison and time-plot output used in Lesson 05.

---

# Use

Run the SAS program identified by the active lesson.

Confirm that the required source CSV is available in `data/` before running a program.

Review and update any local path values required by the active SAS environment.

Do not rename programs or expected data files unless the lesson explicitly directs that action.

If a required program or dataset cannot be retrieved, follow the retrieval-failure guidance in `SETUP.md`.

---

End of README
