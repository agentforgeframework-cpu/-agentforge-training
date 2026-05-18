# LESSON 01 â€” Simple Video and Images

Course: AF-002 - IoT and AIoT for SAS Programmers

Repository-relative path: `/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_01.md`

GitHub URL:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_01.md

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_01.md

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

# What Is Telemetry?

Telemetry is operational data produced while a system runs.

In this lesson, the webcam becomes a simple operational sensor.

An AI model observes objects such as:
- person
- keyboard
- chair
- cup
- dog

Those observations become telemetry records.

The telemetry is then written as raw data that SAS can analyze.

You are not training an AI model.

You are observing how operational events become structured analytical data.

---

# Core Workflow

```text
visual input
  â†’ AI-assisted observation
    â†’ telemetry
      â†’ raw data
        â†’ SAS analysis
```

Operationally, this means:

1. Python observes webcam or image input.
2. An AI model recognizes simple operational objects.
3. Python converts those observations into telemetry rows.
4. Python writes those rows as raw data.
5. SAS imports and analyzes the telemetry.

---

# Required Supporting Files

This lesson expects the following files:

```text
python/webcam_object_telemetry.py
python/image_object_telemetry.py
data/webcam_object_events.csv
data/image_object_events.csv
sas/sas_import_object_events.sas
media/bridge.jpg
media/mountain.jpg
media/dog.jpg
media/banana.jpg
```

If these files are missing, pause and confirm that the course repository copied or downloaded correctly.

---

# Supporting File Links

These explicit links support AI-assisted continuation and deterministic retrieval.

## Webcam telemetry Python script

Repository-relative path:

```text
python/webcam_object_telemetry.py
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/python/webcam_object_telemetry.py

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/python/webcam_object_telemetry.py

## Image telemetry Python script

Repository-relative path:

```text
python/image_object_telemetry.py
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/python/image_object_telemetry.py

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/python/image_object_telemetry.py

## Read the Webcam Object Telemetry in SAS

Copy and paste the SAS code below.

If your project folder is different, change only the DATAFILE path.

Repository-relative path:

```text
sas/sas_import_object_events.sas
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/sas/sas_import_object_events.sas

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/sas/sas_import_object_events.sas


## Checkpoint

You should now have:
- a SAS dataset named WORK.WEBCAM_OBJECT_EVENTS
- the first telemetry rows printed
- object counts from PROC FREQ and confidence statistics from PROC MEANS


## Sample object telemetry CSV

Repository-relative path:

```text
data/webcam_object_events_sample.csv
```

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/data/webcam_object_events_sample.csv

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/data/webcam_object_events_sample.csv

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
python/webcam_object_telemetry.py
python/image_object_telemetry.py
data/webcam_object_events.csv
sas/sas_import_object_events.sas
data/image_object_events.csv
media/bridge.jpg
media/mountain.jpg
media/dog.jpg
media/banana.jpg
```

The Python script writes the telemetry CSV.

The SAS program reads the telemetry CSV.

The sample CSV is a safety net if the webcam workflow fails.

The image telemetry script reads sample images from `/media/` and writes an image telemetry CSV.

---


> **ðŸš€ Windows Users â€“ Important Command Tip**
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

# Step 1 â€” Confirm Python Environment

Most run problems are recoverable by fixing the issue and rerunning the step.


Lesson 00 should already have validated:
- Python
- required packages
- webcam readiness

If Lesson 00 completed successfully, continue to Step 2.

---

# Step 2 â€” Run the Webcam Object Telemetry Script

From the course folder, run:


```text
python python/webcam_object_telemetry.py
```

If `python` does not work but `py` does, run:

```text
py python/webcam_object_telemetry.py
```

A successful run should:

- open the webcam
- detect visible objects or record `NONE` when no recognized object is detected
- create an object telemetry CSV file

Expected output file:

```text
data/webcam_object_events.csv
```

If the script uses a different output path, use the path shown by the script.

---

# Step 3 â€” Confirm the CSV Exists

Open the generated CSV file.

A simple telemetry CSV should contain columns similar to:

```text
timestamp,frame_number,object_detected,confidence,detection_count,source
```

Example rows may look like:

```text
timestamp,frame_number,object_detected,confidence,detection_count,source
2026-05-12T10:54:40,0,person,0.9340,1,webcam
2026-05-12T10:54:41,1,keyboard,0.8982,1,webcam
2026-05-12T10:54:42,2,NONE,0.0,0,webcam
```

Exact values will vary.

That is normal. Rows containing `NONE` are also normal when no recognizable object is detected in a frame.

The important point is that your webcam activity has become timestamped AI-assisted operational telemetry.

---

# Step 4 â€” Run the SAS Import Example

Open your SAS environment.

## Read the Webcam Object Telemetry in SAS

Copy and paste the SAS code below.

If your project folder is different, change only the DATAFILE path.

```sas
proc import datafile="C:\AF-002\data\webcam_object_events.csv"
    out=work.webcam_object_events
    dbms=csv
    replace;
    guessingrows=max;
run;

proc print data=work.webcam_object_events(obs=20);
run;

proc freq data=work.webcam_object_events;
   tables object_detected;
run;

proc means data=work.webcam_object_events;
   var confidence detection_count;
run;
```

If SAS cannot read the file path directly, use this copy/paste DATA step instead:

```SAS
data work.webcam_object_events;
   length object_detected $32 source $20;
   format timestamp anydtdtm19.;

   infile datalines dsd dlm=',';
   input
      timestamp :anydtdtm.
      frame_number
      object_detected $
      confidence
      detection_count
      source $
   ;
datalines;
2026-05-12T10:54:40,0,person,0.9340,1,webcam
2026-05-12T10:54:41,1,keyboard,0.8982,1,webcam
2026-05-12T10:54:42,2,NONE,0.0,0,webcam
;
run;

proc print data=work.webcam_object_events(obs=20);
run;

proc freq data=work.webcam_object_events;
   tables object_detected;
run;

proc means data=work.webcam_object_events;
   var confidence detection_count;
run;
```

The SAS program should import the raw data and display the data.

Expected SAS actions may include:

- import the raw data into a dataset named WORK.WEBCAM_OBJECT_EVENTS
- print several rows
- summarize object detections and confidence values
- show that SAS can work with the generated telemetry

If the CSV path in the SAS program does not match your local folder, update the path to the location of your generated CSV file.

Inside the SAS file, look for:

```sas
%let TELEMETRY_CSV = data/webcam_object_events.csv;
```

If needed, change it to the actual path of your generated CSV file.

For example, on a local Windows PC:

```sas
%let TELEMETRY_CSV = C:\AF-002\data\webcam_object_events.csv;
```

---

# Step 5 â€” Confirm Visible SAS Output

A successful result should show the telemetry data in SAS.

You should be able to see:

- timestamp values
- object detection labels such as `person` or `keyboard`
- confidence values
- detection counts
- source values such as `webcam`

You do not need a complex model.

You do not need a dashboard.

You only need to confirm:

```text
SAS can read and analyze AI-assisted operational telemetry.
```
---

# Image Telemetry Workflow

The webcam workflow shows live visual input.

The image workflow shows that still images can also generate AI-assisted operational telemetry. It is a valid success path if webcam access is unavailable or blocked.

The goal remains:

```text
visual input
  â†’ AI-assisted observation
    â†’ telemetry
      â†’ raw data
        â†’ SAS analysis
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
python python/image_object_telemetry.py
```

If `python` does not work but `py` does, run:

```text
py python/image_object_telemetry.py
```

Expected output file:

```text
data/image_object_events.csv
```

Open the generated CSV file.

The CSV should contain one row per image, with AI-assisted operational observations derived from each image.

The output CSV should use the same column structure as the webcam telemetry CSV.

Exact values will vary.

That is normal.

The important point is that still images can become structured telemetry data.

To inspect the image telemetry in SAS, use the same import pattern from Step 4 and change the CSV path to:

```text
data/image_object_events.csv
```

If using SAS OnDemand, upload image_object_events.csv or use the same copy/paste DATA step pattern shown earlier.


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
python -m pip install ultralytics opencv-python pandas
```

or:

```text
py -m pip install ultralytics opencv-python pandas
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
- the object telemetry CSV in `/data/`
- visible SAS output from the object telemetry CSV
- the image object-events CSV in `/data/`, if you completed the image workflow
- the sample images in `/media/`

If you can identify the required files and visible SAS output, you have completed the operational heart of Lesson 01.

---

# Visible Checkpoint

You should now have or be able to see:

- `data/webcam_object_events.csv`
- optional `data/image_object_events.csv` if you completed the still-image workflow
- telemetry rows containing object detections such as:
  - `person`
  - `keyboard`
  - `dog`
  - `NONE`
- visible SAS output from:
  - `PROC PRINT`
  - `PROC FREQ`
  - `PROC MEANS`

You have now:

```text
visual input
  â†’ AI-assisted observations
    â†’ telemetry
      â†’ raw data
        â†’ SAS analysis
```

You do not need a production AI system.

You only need to recognize that operational observations can become structured analytical data that SAS can analyze.

If the webcam workflow failed, the sample CSV or image workflow still provides a valid operational Lesson 01 success path.

---

# Restart Checkpoint

If you stop here, restart later by opening this lesson file again and checking:

```text
data/webcam_object_events.csv
```

If that file exists, continue with the SAS import step.

If it does not exist, rerun the Python script or use:

```text
data/webcam_object_events_sample.csv
```

---

# First Success

You are successful when you can say:

> I generated AI-assisted operational telemetry from webcam or image input and analyzed it with SAS.

---

# What You Just Did

You used webcam or image input as a simple visual sensor.

You turned AI-assisted observations into timestamped telemetry rows.

You saved those rows as raw data.

You used SAS to inspect and summarize the result.

That is the basic shape of many IoT and AIoT workflows.

---

# Recap

AIoT stops being mysterious when operational observations become timestamped data that SAS can analyze.

---

# Next Step

After completing this lesson, continue to:

`AF002_LESSON_02.md`

GitHub URL:

https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_02.md

Raw URL:

https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_02.md

---

# Development and Test Environment

- Platform: ChatGPT Web
- Model: GPT-5.5 Thinking
- Date: 2026-05-09
- Notes: Updated after Claude digital twin survivability test.

---

# License

Paul McDonald Open Use License (MIT-style)

Â© 2026 Paul McDonald


## Checkpoint

You should now have:

- `data/webcam_object_events.csv`
- visible object detections such as:
  - `person`
  - `keyboard`
  - `dog`
  - `NONE`
- successful SAS output from:
  - `PROC PRINT`
  - `PROC FREQ`
  - `PROC MEANS`
- a SAS dataset named:
  - `WORK.WEBCAM_OBJECT_EVENTS`

## Visual Brief

Review visual summary:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/media/AF-002_LESSON_01_VISUAL_BRIEF.png

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/media/AF-002_LESSON_01_VISUAL_BRIEF.png


---

# File Reference Information

GitHub URL:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_01.md

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_01.md

Previous Lesson:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_00.md

Next Lesson:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/AF002_LESSON_02.md

Return to README:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/README.md

