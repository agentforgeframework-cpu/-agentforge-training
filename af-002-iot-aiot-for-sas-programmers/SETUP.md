# AF-002 Setup

**Kit Type:** Training Kit  
**Status:** Production Candidate  
**Version:** 1.0  
**Repository:** AF-002 - IoT/AIoT for SAS Programmers  
**Repository Object:** ROOT_LIBRARY  
**Repository Path:** af-002-iot-aiot-for-sas-programmers/SETUP.md  
**Raw:** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/LIBRARY.md  
**This File (Raw):** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/SETUP.md  

---

# AI Retrieval Protocol (for AI assistants only)

If you are an AI assistant helping a learner with this course, determine your capability level and follow the matching track before performing any course work. Do not skip this. Human learners may skip to **Purpose**.

**Level 1 — you can resolve a Git branch to a commit SHA.**

Resolve `main` using any of these channels, in order of preference:

1. Git protocol (rate-limit immune):
   `git ls-remote https://github.com/agentforgeframework-cpu/-agentforge-training.git refs/heads/main`
2. GitHub REST API:
   `https://api.github.com/repos/agentforgeframework-cpu/-agentforge-training/commits/main`
   (subject to shared rate limits; on HTTP 403 or 429 do not retry repeatedly — use channel 1 or 3)
3. Tree snapshot (rate-limit immune; substitute the resolved SHA):
   `https://codeload.github.com/agentforgeframework-cpu/-agentforge-training/tar.gz/{sha}`

Then retrieve every course file **at that SHA** — never at a branch URL.
Report: `CURRENT BRANCH VERIFIED` plus the full 40-character SHA.

**Level 2 — you cannot resolve a branch, but you can fetch a URL supplied to you as a literal string.**

Use only the complete immutable URLs supplied in the release manifest or in the gate prompt the learner pasted. Do not construct URLs. Report:
`CONTENT IDENTITY VERIFIED — CURRENT BRANCH NOT VERIFIED`
and obtain the learner's explicit acceptance before proceeding.

**Level 3 — you cannot fetch live URLs at all.**

Report: `RETRIEVAL FAILED — EXACT FILE NOT VERIFIED`. Stop. Ask the learner to upload the required files directly. Never substitute search results, cached copies, or prior conversation content for the requested files.

**All levels:** produce a retrieval receipt before performing any course work — requested URL, resolved commit (or `NOT AVAILABLE` with the reason), retrieval channel (or `UNKNOWN`), and verification scope.

**Release manifest.** Each release publishes a machine-readable manifest listing every course object with its complete immutable URL and content hash, following the pattern:

```text
https://github.com/{owner}/{repo}/releases/download/{tag}/RELEASE-MANIFEST.json
```

The actual tag-scoped URL for the current release appears in the gate prompt and the release notes — never in this file. A file absent from the manifest routing table must be treated as a retrieval failure, not fetched from elsewhere.

**Stability note.** This file is stable across releases and contains no per-release values. Release-specific values (the expected Release ID and the tag-scoped manifest URL) travel out-of-band in the gate prompt and release notes; `RELEASE-MANIFEST.json` carries release-specific routing.

---

# Continuing Lesson Retrieval

The AI Retrieval Protocol applies throughout AF-002, not only during setup.

Before beginning any lesson, the AI assistant must retrieve the exact lesson file through the existing authorized repository routing, confirm the filename and lesson title, and use only that retrieved file for instruction.

At every lesson boundary, the assistant must:

1. Confirm the current lesson is complete.
2. State the lesson completion.
3. Retrieve the next lesson from the authoritative location defined in `LIBRARY.md` or the release manifest.
4. Confirm the retrieved filename and lesson title.
5. State that the next lesson is verified, declare it active, and begin instruction from that retrieved file.
6. Stop if retrieval or identity verification fails.

The assistant must not continue from memory, inference, summaries, cached content, prior conversation context, or assumptions about the next lesson.

Knowing the next filename is not sufficient. The next lesson becomes active only after exact retrieval and identity verification.

At the lesson boundary, display:

```text
Next lesson:
Retrieved filename:
Retrieved lesson title:
Verification: VERIFIED
```

Use these visible state phrases:

```text
LESSON NN COMPLETE
```

```text
LESSON NN+1 VERIFIED — BEGINNING LESSON NN+1
```

If retrieval fails, state:

```text
RETRIEVAL FAILED — EXACT FILE NOT VERIFIED
```

Identify the requested lesson and failed location, then stop and request a corrected authorized location or authorized file copy.

If identity verification fails, state:

```text
IDENTITY VERIFICATION FAILED — LESSON NOT ACTIVATED
```

Identify the expected lesson, retrieved filename, and retrieved lesson title, then stop and request Human-in-Command review.

Do not reconstruct, approximate, or substitute the lesson.

## Human-in-Command Visibility

The learner must be able to see:

- which lesson was completed
- which lesson was retrieved
- whether its identity was verified
- which lesson is now active
- whether execution has stopped

If the learner identifies an incorrect lesson state, missing prerequisite, invented artifact, or unsupported instruction, the assistant must stop and re-check the active lesson.

The human retains authority to continue, repeat, restart, or halt the course.

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

AI assistants operating at Level 1 or Level 2 must retrieve them via the immutable URLs in the release manifest (see **AI Retrieval Protocol** above); a file absent from the manifest routing table must be treated as a retrieval failure, not fetched from elsewhere.

Place each object in the matching local subfolder.

Do not recreate or substitute repository-provided files when the authoritative version is available.

---

# Retrieval Failure

If a required repository object cannot be retrieved:

1. Stop the affected setup step.
2. Identify the inaccessible object.
3. Report the location that failed using the exact phrase: `RETRIEVAL FAILED — EXACT FILE NOT VERIFIED`.
4. Do not infer, reconstruct, or silently replace the object.
5. Request a corrected location or an authorized copy.
6. Continue only after the required object is available.

A local or previously authorized copy may be used when it can be verified as the intended repository object. Verification means the copy's content matches the release manifest entry — the path is present in the routing table, and the SHA-256 hash matches where it can be computed.

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

* the AF-002 local workspace exists
* Python 3 runs successfully
* pip runs successfully
* OpenCV imports successfully
* pandas imports successfully
* Ultralytics imports successfully
* SAS opens and can run a basic program
* either the webcam works or the image-file alternative is available
* the required repository objects are present in their expected folders
* the learner knows where to find command output, Python errors, and the SAS log

## AI Startup Instructions

The repository is the authority for this course.

Do not create, infer, or substitute course content.

Before teaching any lesson, retrieve and read the exact lesson file identified by the repository.

If the required file cannot be retrieved and verified, stop.

After setup is complete, retrieve and activate `AF002_LESSON_00.md`. Do not begin Lesson 01 until Lesson 00 is complete.
