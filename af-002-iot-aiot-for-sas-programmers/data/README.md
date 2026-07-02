# README.md

**Kit Type:** Training Kit  
**Status:** Production Candidate  
**Version:** 1.0  
**Repository:** AF-002 - IoT/AIoT for SAS Programmers  
**Repository Object:** ROOT_LIBRARY  
**Raw:** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/LIBRARY.md  
**This File (Raw):** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/data/README.md  

---

# Purpose

The `data/` folder contains sample telemetry datasets required by AF-002 lessons and SAS programs.

These files support:

- introductory object-event analysis
- spatial telemetry analysis
- congestion investigation
- Lesson 05 timestamp and dashboard analysis

Use the authoritative file locations defined in `LIBRARY.md`.

---

# Contents

## Lessons 01 and 02

```text
webcam_object_events_sample.csv
```

Provides sample object-event telemetry when live webcam capture is unavailable or when a stable dataset is required.

## Lesson 04

```text
sample_spatial_telemetry.csv
sample_spatial_telemetry_congestion.csv
```

Provides spatial telemetry for region, confidence, persistence, and congestion analysis.

## Lesson 05

```text
AF002_L05_TELEMETRY_SAMPLE_v0_1.csv
```

Provides timestamped telemetry for dashboard and freshness analysis.

---

# Use

Use the dataset identified by the active lesson or SAS program.

Do not rename files or alter their field structure unless the lesson explicitly directs that action.

If a required dataset cannot be retrieved, follow the retrieval-failure guidance in `SETUP.md`.

---

End of README
