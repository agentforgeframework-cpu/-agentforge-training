# AF-002 Setup

**Kit Type:** Training Kit  
**Status:** Production Candidate  
**Version:** 1.0  
**Repository:** AF-002 - IoT/AIoT for SAS Programmers  
**Repository Object:** ROOT_LIBRARY  
**Raw:** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/LIBRARY.md  
**This File (Raw):** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/SETUP.md  

---

# Purpose

`SETUP.md` defines the environment preparation and validation required before beginning AF-002.

Before completing setup, load `COURSE.md` from the location defined in `LIBRARY.md`.

`COURSE.md` is the authoritative definition of the course. It establishes the course's identity, instructional model, architecture, governing principles, and completion boundary.

After reading `COURSE.md`, complete this setup before beginning Lesson 00.

The goal is not to create a complex development environment. The goal is to establish a small, understandable, and restartable workspace capable of producing telemetry and analyzing it with SAS.

---

# Required Access

AF-002 assumes access to:

- a Windows computer
- internet access
- an AI assistant capable of working with Markdown files
- Python 3
- a webcam or the supplied image-file alternative
- SAS access
- permission to create and modify local files

Suitable SAS environments may include:

- SAS OnDemand for Academics
- SAS Studio
- local SAS
- an available workplace SAS environment

The learner must be able to run a SAS program that imports and analyzes a CSV file.

---

# Create the Local Workspace

Create a local working folder for AF-002.

A suitable Windows location is:

```text
C:\AF-002\
```

Create these subfolders:

```text
C:\AF-002\
    data\
    lessons\
    media\
    python\
    sas\
```

Another location may be used, but the folder structure should remain simple and understandable.

Do not begin by redesigning the repository structure or creating additional infrastructure.

---

# Confirm Python

Open PowerShell or Command Prompt.

Run:

```powershell
python --version
```

A successful result displays a Python 3 version.

If `python` is not recognized, try:

```powershell
py --version
```

Use whichever command works consistently on the computer.

If neither command works, install Python from a trusted source and reopen PowerShell or Command Prompt before checking again.

Do not continue until a Python 3 version is displayed.

---

# Confirm pip

Using the working Python command, run one of the following:

```powershell
python -m pip --version
```

or:

```powershell
py -m pip --version
```

A successful result displays the installed pip version and location.

---

# Confirm Required Python Packages

AF-002 uses:

- OpenCV
- pandas
- Ultralytics YOLO

Check the packages before installing anything.

Using `python`:

```powershell
python -c "import cv2; print('opencv OK')"
python -c "import pandas; print('pandas OK')"
python -c "from ultralytics import YOLO; print('ultralytics OK')"
```

Using `py`:

```powershell
py -c "import cv2; print('opencv OK')"
py -c "import pandas; print('pandas OK')"
py -c "from ultralytics import YOLO; print('ultralytics OK')"
```

Install the packages only when a check fails:

```powershell
python -m pip install ultralytics opencv-python pandas
```

or:

```powershell
py -m pip install ultralytics opencv-python pandas
```

After installation, repeat the package checks.

The first object-detection run may download a YOLO model file. This is expected.

---

# Confirm SAS Access

Open the SAS environment that will be used for the course.

Confirm that it can:

- create a SAS program
- run a DATA step or procedure
- access or upload a CSV file
- display the SAS log
- display results or output

The exact SAS platform may differ, but these capabilities are required.

---

# Confirm the Webcam

Open the Windows Camera application or another trusted camera application.

Confirm that the webcam displays a live image.

If the webcam is unavailable, blocked, or unsuitable, AF-002 can begin with the supplied image files instead.

A webcam failure does not prevent completion of the course.

---

# Required Repository Objects

The initial AF-002 workflow requires the following repository objects:

```text
python/webcam_object_telemetry.py
python/image_object_telemetry.py
sas/sas_import_object_events.sas
data/webcam_object_events_sample.csv
media/bridge.jpg
media/mountain.jpg
media/dog.jpg
media/banana.jpg
```

Retrieve these objects using the locations defined in `LIBRARY.md`.

Place each object in the matching local subfolder.

Do not recreate or substitute repository-provided files when the authoritative version is available.

---

# Retrieval Failure

If a required repository object cannot be retrieved:

1. Stop the affected setup step.
2. Identify the inaccessible object.
3. Report the location that failed.
4. Do not infer, reconstruct, or silently replace the object.
5. Request a corrected location or an authorized copy.
6. Continue only after the required object is available.

A local or previously authorized copy may be used when it can be verified as the intended repository object.

---

# Confirm the Local Files

Before continuing, confirm that the local workspace includes:

```text
C:\AF-002\
    data\
        webcam_object_events_sample.csv

    media\
        banana.jpg
        bridge.jpg
        dog.jpg
        mountain.jpg

    python\
        image_object_telemetry.py
        webcam_object_telemetry.py

    sas\
        sas_import_object_events.sas
```

The lesson files may remain in the repository or be copied into the local `lessons` folder.

---

# Setup Recovery

Most setup failures are recoverable.

When a command or program fails:

1. Preserve the full error message or log.
2. Confirm the current folder and filename.
3. Confirm whether `python` or `py` is the working command.
4. Confirm that the required package or file exists.
5. Correct only the identified problem.
6. Repeat the failed check.

Do not replace the course workflow with a more complex architecture merely because one setup step fails.

When using an AI assistant, provide the exact PowerShell, Python, or SAS error output rather than summarizing it.

---

# Setup Completion Check

Setup is complete when all of the following are true:

- the AF-002 local workspace exists
- Python 3 runs successfully
- pip runs successfully
- OpenCV imports successfully
- pandas imports successfully
- Ultralytics imports successfully
- SAS opens and can run a basic program
- either the webcam works or the image-file alternative is available
- the required repository objects are present in their expected folders
- the learner knows where to find command output, Python errors, and the SAS log

After setup is complete, load Lesson 00 from the location defined in `LIBRARY.md`.

Do not begin Lesson 01 before completing Lesson 00.
