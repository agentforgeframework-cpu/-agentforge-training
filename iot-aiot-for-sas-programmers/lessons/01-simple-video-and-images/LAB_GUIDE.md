# Lab Guide — Lesson 01: Simple Video and Images

Status: Stabilization Draft  
Course: IoT/AIoT for SAS Programmers

## Lab Goal

Build simple pipelines that convert webcam and image input into structured CSV event records.

The labs are intentionally small and local.

The goal is to understand the operational flow:

```text
input
→ inference
→ event
→ CSV
→ SAS-ready data
```

---

# Prerequisites

## Required

- Python 3.x installed
- PowerShell or command line access
- Webcam for Lab A
- Internet access during first model download
- Basic file editing ability

## Python Packages

Install required packages:

```powershell
python -m pip install opencv-python ultralytics pandas
```

If `pip` is not recognized, use:

```powershell
py -m pip install opencv-python ultralytics pandas
```

---

# Working Folder

Create or use a working folder such as:

```text
aiot_camera_lab
```

All scripts and test files should be placed in the same folder during the first lab.

---

# Lab A — Webcam to Event Records

## Purpose

Use the default webcam to detect people and write event records to `events.csv`.

## Script

Use:

```text
scripts/webcam_to_events.py
```

## Run

```powershell
python webcam_to_events.py
```

## Expected Behavior

A camera window opens.

When a person is detected, PowerShell prints events such as:

```text
2026-05-05T19:12:34 BasementWebcam person_detected 0.87
```

A CSV file is created:

```text
events.csv
```

Expected columns:

```text
timestamp,camera_id,event_type,label,confidence
```

## Stop the Script

Click the camera window and press:

```text
Q
```

## Success Criteria

The lab succeeds if:
- the camera opens
- the script runs
- at least one event row is written
- the CSV file can be opened and inspected

---

# Lab B — Single Image to Event Records

## Purpose

Process one image file and write detections to `image_events.csv`.

## Prepare Image

Place an image in the working folder and name it:

```text
test_photo.jpg
```

## Script

Use:

```text
scripts/image_to_events.py
```

## Run

```powershell
python image_to_events.py
```

## Expected Output

Console output may show:

```text
Processing image: test_photo.jpg
2026-05-05T20:15:01 test_photo.jpg person_detected 0.88
Done. Events written to image_events.csv
```

Expected CSV:

```text
image_events.csv
```

---

# Lab C — Batch Image Processing

## Purpose

Process multiple images and write all detections to one CSV file.

## Prepare Images

Place images in the working folder using names such as:

```text
test-image-1.jpg
test-image-2.jpg
test-image-3.jpg
...
test-image-10.jpg
```

## Script

Use:

```text
scripts/batch_image_to_events.py
```

## Run

```powershell
python batch_image_to_events.py
```

## Expected Output

Console output may show:

```text
Found 10 image files.

Processing: test-image-1.jpg
  person_detected (confidence=0.934)

Processing: test-image-2.jpg
  dog_detected (confidence=0.9042)

Done. Events written to batch_image_events.csv
```

Expected CSV:

```text
batch_image_events.csv
```

---

# Optional SAS Check

After a CSV file exists, test reading it with SAS.

Example:

```sas
proc import datafile="C:\path\to\events.csv"
    out=work.aiot_events
    dbms=csv
    replace;
    guessingrows=max;
run;

proc print data=work.aiot_events(obs=20);
run;

proc freq data=work.aiot_events;
    tables event_type label;
run;
```

---

# Common Issues

## pip is not recognized

Try:

```powershell
python -m pip install opencv-python ultralytics pandas
```

or:

```powershell
py -m pip install opencv-python ultralytics pandas
```

## No matching image files found

Check:
- file names
- file extensions
- folder location

The script may expect `.jpg` files, while the files may be `.jpeg` or `.png`.

## Camera does not open

Check:
- webcam permissions
- whether another app is using the camera
- whether the correct camera index is being used

The line:

```python
cap = cv2.VideoCapture(0)
```

uses the default camera.

## Object is detected incorrectly

This is normal.

The default model maps objects to categories it knows. A forklift may appear as a truck, or an object may not be detected.

Use this as a learning point.

---

# Lab Completion

The lab is complete when the learner can explain:

1. how input is read
2. how YOLO performs inference
3. how detections become events
4. how CSV stores telemetry
5. how SAS can analyze the event records
