# LESSON 01 — Simple Video and Images

Course: AF-002 - IoT and AIoT for SAS Programmers

Repository-relative path: `/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md`

GitHub URL:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md

---

# Lesson Purpose

Create the first visual-input-to-CSV-to-SAS success.

This lesson turns familiar visual sources, a webcam and still images, into simple operational telemetry.

---

# AI Assistant Guidance

If you are assisting a learner with this lesson:

- keep the learner focused on first success
- do not expand into advanced computer vision
- do not expand into enterprise IoT architecture
- help the learner run the Python script
- help the learner find the CSV output
- help the learner import the CSV into SAS
- explain errors in plain operational language
- move to the recap only after the learner has seen SAS output

The goal is not to teach computer vision.

The goal is to show that telemetry can become structured data that SAS can analyze.

---

# Learning Objectives

By the end of this lesson, the learner should be able to:

- capture simple webcam or image information
- generate a small telemetry CSV
- inspect the CSV as operational data
- import the CSV into SAS
- produce visible SAS output
- recognize telemetry as timestamped operational data

---

# Core Workflow

```text
visual input → telemetry → CSV → SAS analysis
```

Operationally, this means:

1. Python observes webcam input or still-image input.
2. Python summarizes the observation into rows of telemetry.
3. Python writes those rows to a CSV file.
4. SAS imports the CSV file.
5. SAS displays and summarizes the telemetry.

---

# Required Supporting Files

This lesson expects the following files:

```text
python/webcam_telemetry_capture.py
sas/sas_import_telemetry.sas
python/image_telemetry_capture.py
media/bridge.jpg
media/mountain.jpg
media/dog.jpg
media/banana.jpg
```

If these files are missing, pause and confirm that the course repository copied or downloaded correctly.

---

---

# Supporting File Links

These explicit links support AI-assisted continuation and deterministic retrieval.

## Webcam telemetry Python script

Repository-relative path:

```text
python/webcam_telemetry_capture.py
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/python/webcam_telemetry_capture.py

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/python/webcam_telemetry_capture.py

## Image telemetry Python script

Repository-relative path:

```text
python/image_telemetry_capture.py
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/python/image_telemetry_capture.py

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/python/image_telemetry_capture.py

## SAS import telemetry program

Repository-relative path:

```text
sas/sas_import_telemetry.sas
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/sas/sas_import_telemetry.sas

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/sas/sas_import_telemetry.sas

## Sample telemetry CSV

Repository-relative path:

```text
data/webcam_telemetry_sample.csv
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/data/webcam_telemetry_sample.csv

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/data/webcam_telemetry_sample.csv

## Image: bridge

Repository-relative path:

```text
media/bridge.jpg
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/media/bridge.jpg

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/media/bridge.jpg

## Image: mountain

Repository-relative path:

```text
media/mountain.jpg
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/media/mountain.jpg

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/media/mountain.jpg

## Image: dog

Repository-relative path:

```text
media/dog.jpg
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/media/dog.jpg

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/media/dog.jpg

## Image: banana

Repository-relative path:

```text
media/banana.jpg
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/media/banana.jpg

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/media/banana.jpg

---

# Local File Map

Keep this simple.

During this lesson, the key paths are:

```text
python/webcam_telemetry_capture.py
python/image_telemetry_capture.py
data/webcam_telemetry.csv
data/webcam_telemetry_sample.csv
sas/sas_import_telemetry.sas
media/bridge.jpg
media/mountain.jpg
media/dog.jpg
media/banana.jpg
data/image_telemetry.csv
```

The Python script writes the telemetry CSV.

The SAS program reads the telemetry CSV.

The sample CSV is a safety net if the webcam workflow fails.

The image telemetry script reads sample images from `/media/` and writes an image telemetry CSV.

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



## Resume Here

If you are returning after interruption, continue from this step.

# Step 1 — Confirm Python Environment

Most run problems are recoverable by fixing the issue and rerunning the step.


Lesson 00 should already have validated:
- Python
- required packages
- webcam readiness

If Lesson 00 completed successfully, continue to Step 2.

---

# Step 2 — Run the Webcam Telemetry Script

From the course folder, run:


```text
python python/webcam_telemetry_capture.py
```

If `python` does not work but `py` does, run:

```text
py python/webcam_telemetry_capture.py
```

The script should access the webcam and create a telemetry CSV file.

Expected output file:

```text
data/webcam_telemetry.csv
```

If the script uses a different output path, use the path shown by the script.

---

# Step 3 — Confirm the CSV Exists

Open the generated CSV file.

A simple telemetry CSV should contain columns similar to:

```text
timestamp,frame_number,brightness,motion_score,source
```

Example rows may look like:

```text
timestamp,frame_number,brightness,motion_score,source
2026-05-09T14:05:01,1,118.4,0.00,webcam
2026-05-09T14:05:02,2,119.1,3.25,webcam
2026-05-09T14:05:03,3,121.7,4.10,webcam
```

Exact values will vary.

That is normal.

The important point is that your webcam activity has become timestamped operational data.

---

# Step 4 — Run the SAS Import Example

Open your SAS environment.

Use:

```text
sas/sas_import_telemetry.sas
```

The SAS program should import the telemetry CSV and display the data.

Expected SAS actions may include:

- import the CSV
- print several rows
- summarize numeric telemetry fields
- show that SAS can work with the generated telemetry

If the CSV path in the SAS program does not match your local folder, update the path to the location of your generated CSV file.

Inside the SAS file, look for:

```sas
%let TELEMETRY_CSV = data/webcam_telemetry.csv;
```

If needed, change it to the actual path of your generated CSV file.

For example, on a local Windows PC:

```sas
%let TELEMETRY_CSV = C:\AF-002\data\webcam_telemetry.csv;
```

Fallback Path — SAS OnDemand / Restricted Upload Environments
- For SAS OnDemand, upload the CSV to your SAS Files area and use the server-side path shown by SAS.
- If direct CSV upload is awkward or unavailable, telemetry rows may also be copied from PowerShell output and loaded directly into SAS using a DATA step.

Instead of PROC IMPORT, the learner can use this data step to import the data:

```sas
data work.webcam_telemetry (drop = dataline) ;
   format timestamp datetime. ;
   input @1 dataline $40. ;
   
   timestamp = input(scan(dataline, 1, ',', 't'), anydtdtm.) ;
   if timestamp ne . ;
   frame_number = input(scan(dataline, 2, ',', 't'), best.) ;
   width = input(scan(dataline, 3, ',', 't'), best.) ;
   height = input(scan(dataline, 4, ',', 't'), best.) ;
   brightness = input(scan(dataline, 5, ',', 't'), best.) ;
cards ;
/* 
Run this PowerShell command:

Get-Content .\data\webcam_telemetry.csv -TotalCount 10

Then copy and paste telemetry rows below this comment
and above the trailing semicolon before `run ;`

Example:

2026-05-12T10:54:40,0,640,480,97.53
*/
; /* be sure to keep this semicolon */
run ;
```

---

# Step 5 — Confirm Visible SAS Output

A successful result should show the telemetry data in SAS.

You should be able to see:

- timestamp values
- frame numbers
- brightness values
- motion scores or similar calculated fields
- source values such as `webcam`

You do not need a complex model.

You do not need a dashboard.

You only need to confirm:

```text
SAS can read and inspect the telemetry CSV.
```

---

# Image Telemetry Workflow

The webcam workflow shows live visual input.

The image workflow shows that still images can also become telemetry data.

This is not image recognition or object detection.

The goal is the same:

```text
visual input → telemetry → CSV → SAS analysis
```

Use the sample images in:

```text
/media
```

Expected files include:

```text
media/bridge.jpg
media/mountain.jpg
media/dog.jpg
media/banana.jpg
```

From the course folder, run:

```text
python python/image_telemetry_capture.py
```

If `python` does not work but `py` does, run:

```text
py python/image_telemetry_capture.py
```

Expected output file:

```text
data/image_telemetry.csv
```

Open the generated CSV file.

The CSV should contain one row per image, with basic telemetry values derived from each image.

Exact values will vary.

That is normal.

The important point is that still images can become structured telemetry data.

To inspect the image telemetry in SAS, use the same import pattern from Step 4 and change the CSV path to:

```text
data/image_telemetry.csv
```

If using SAS OnDemand, upload image_telemetry.csv or use the same copy/paste DATA step pattern shown earlier.


---

# Troubleshooting

## Python command not found

Try:

```text
py --version
```

Then use `py` instead of `python` in later commands.

## Missing Python package

Run:

```text
python -m pip install opencv-python pandas
```

or:

```text
py -m pip install opencv-python pandas
```

## Webcam does not open

Check:

- Windows Camera app
- privacy settings
- whether another app is using the camera
- workplace restrictions

If the webcam remains unavailable, use the image telemetry workflow or sample CSV path.

## CSV not created

Check:

- whether the script completed
- whether the script printed an output path
- whether you ran the command from the course folder
- whether the `/data/` folder exists

## SAS cannot find the CSV

Update the file path in the SAS program.

Use the exact path to your generated CSV file.

---

# Success Checkpoint

Before moving on, confirm that you can physically identify:

- the Python script in `/python/`
- the SAS program in `/sas/`
- the telemetry CSV in `/data/`
- visible SAS output from the telemetry CSV
- the image telemetry CSV in `/data/`, if you completed the image workflow
- the sample images in `/media/`

If you can identify the required files and visible SAS output, you have completed the operational heart of Lesson 01.

---

# Visible Checkpoint

You should now have or be able to see:

- `data/webcam_telemetry.csv`, or the fallback `data/webcam_telemetry_sample.csv`
- optional `data/image_telemetry.csv` if you ran the still-image workflow
- visible CSV rows
- visible SAS output from PROC PRINT and PROC MEANS or PROC FREQ

If the webcam path failed, using the sample CSV or image workflow is still a valid Lesson 01 path.

---

# Restart Checkpoint

If you stop here, restart later by opening this lesson file again and checking:

```text
data/webcam_telemetry.csv
```

If that file exists, continue with the SAS import step.

If it does not exist, rerun the Python script or use:

```text
data/webcam_telemetry_sample.csv
```

---

# First Success

You are successful when you can say:

> I generated visual telemetry data from webcam or image input and analyzed it with SAS.

---

# What You Just Did

You used webcam or image input as a simple visual sensor.

You turned visual input into timestamped rows.

You saved those rows as CSV.

You used SAS to inspect the result.

That is the basic shape of many IoT and AIoT workflows.

---

# Recap

IoT stops being mysterious when it becomes timestamped operational data.

---

# Next Step

After completing this lesson, continue to:

`LESSON_02_EVENT_STREAMS_AND_REAL_TIME_THINKING.md`

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_02_EVENT_STREAMS_AND_REAL_TIME_THINKING.md

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_02_EVENT_STREAMS_AND_REAL_TIME_THINKING.md

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


## Checkpoint

You should now have:
- data/webcam_telemetry.csv
- a successful SAS import or DATA step
- a SAS dataset available for analysis


## Visual Brief

Review visual summary:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/media/AF-002_LESSON_01_VISUAL_BRIEF.png


---

# File Reference Information

GitHub URL:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md

Previous Lesson:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_00_SETUP_AND_ORIENTATION.md

Next Lesson:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_02_EVENT_STREAMS_AND_REAL_TIME_THINKING.md

Return to README:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/README.md
