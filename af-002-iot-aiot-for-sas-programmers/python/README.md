# README.md

**Kit Type:** Training Kit  
**Status:** Production Candidate  
**Version:** 1.0  
**Repository:** AF-002 - IoT/AIoT for SAS Programmers  
**Repository Object:** ROOT_LIBRARY  
**Raw:** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/LIBRARY.md  
**This File (Raw):** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/python/README.md  

---

# Purpose

The `python/` folder contains the telemetry-generation programs used by AF-002.

These programs convert webcam frames or still images into structured CSV telemetry that can be analyzed in SAS.

Use the authoritative file locations defined in `LIBRARY.md`.

---

# Contents

## Webcam Telemetry

```text
webcam_object_telemetry.py
```

Captures webcam frames, performs object detection, and writes telemetry to:

```text
data/webcam_object_events.csv
```

This is the primary live-telemetry path.

## Image Telemetry

```text
image_object_telemetry.py
```

Processes the sample images in `media/`, performs object detection, and writes telemetry to:

```text
data/image_object_events.csv
```

This provides a deterministic fallback when webcam capture is unavailable or unsuitable.

---

# Requirements

Both programs require:

```text
ultralytics
opencv-python
pandas
```

The object-detection model may be downloaded automatically by Ultralytics during the first run.

---

# Use

Run the scripts from the AF-002 repository root.

Webcam telemetry:

```text
python python/webcam_object_telemetry.py
```

Image telemetry:

```text
python python/image_object_telemetry.py
```

Use `py` instead of `python` where required by the local Windows installation.

Follow the active lesson for the required script, output, and validation steps.

If a required program or dependency cannot be used, follow the fallback and retrieval guidance in `SETUP.md`.

---

End of README
