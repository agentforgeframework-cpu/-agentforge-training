# LESSON 01 — Simple Video and Images

Course: AF-002 - IoT and AIoT for SAS Programmers

Repository-relative path: `/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md`

GitHub URL:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/lessons/LESSON_01_SIMPLE_VIDEO_AND_IMAGES.md

---

# Lesson Purpose

Create the first webcam-to-CSV-to-SAS success.

This lesson turns a familiar device, your webcam, into a simple source of operational telemetry.

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
webcam → telemetry → CSV → SAS analysis
```

Operationally, this means:

1. Python observes webcam input.
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
```

If these files are missing, pause and confirm that the course repository copied or downloaded correctly.

---

# Local File Map

Keep this simple.

During this lesson, the key paths are:

```text
python/webcam_telemetry_capture.py
sas/sas_import_telemetry.sas
data/webcam_telemetry.csv
data/webcam_telemetry_sample.csv
```

The Python script writes the telemetry CSV.

The SAS program reads the telemetry CSV.

The sample CSV is a safety net if the webcam workflow fails.

---

# Step 1 — Confirm Python Packages

Open Command Prompt or PowerShell.

Run:

```text
python -m pip install opencv-python pandas
```

If `python` does not work but `py` does, run:

```text
py -m pip install opencv-python pandas
```

A successful result may say the packages were installed or already satisfied.

Either result is acceptable.

If Python package installation takes a couple attempts, that is normal. Keep the error message visible and ask your AI assistant to help interpret it.

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

For SAS OnDemand, upload the CSV to your SAS Files area and use the server-side path shown by SAS.

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

# Image-File Fallback

If the webcam cannot be used, the lesson may be completed with an image-file fallback if the Python script supports it.

The fallback pattern is:

```text
image file → telemetry row → CSV → SAS analysis
```

Use this fallback when:

- webcam access is blocked
- a camera driver fails
- organizational policy blocks the camera
- you are testing without live camera access

The Python script supports an image-file fallback with the `--image` option.

Example:

```text
python python/webcam_telemetry_capture.py --image path\to\your_image.jpg
```

or:

```text
py python/webcam_telemetry_capture.py --image path\to\your_image.jpg
```

If the webcam and image fallback are both unavailable, continue with:

```text
data/webcam_telemetry_sample.csv
```

That sample data keeps the SAS portion of the lesson survivable.

The fallback should preserve the same learning point:

```text
visual input can become structured telemetry data.
```

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

If the webcam remains unavailable, use the image-file fallback or sample CSV path.

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

If you can identify those four things, you have completed the operational heart of Lesson 01.

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

> I generated operational telemetry data and analyzed it with SAS.

---

# What You Just Did

You used a webcam as a simple sensor.

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
