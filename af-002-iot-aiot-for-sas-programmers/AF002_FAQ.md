# AF-002 Frequently Asked Questions (FAQ)

Repository-relative path: `/af-002-iot-aiot-for-sas-programmers/AF002_FAQ.md`

GitHub URL:
https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/AF002_FAQ.md

Raw URL:
https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/AF002_FAQ.md

---

## What is AF-002?

AF-002 is a practical operational course designed to help SAS programmers understand how telemetry, AI-assisted observation, and operational reasoning work together inside small understandable operational systems.

The course focuses on:
- telemetry generation
- operational investigation
- SAS-based analysis
- Human-in-Command reasoning
- operational visibility

The course intentionally emphasizes practical understanding over hype or theoretical complexity.

---

## Who is this course for?

AF-002 is primarily designed for:
- SAS programmers
- SAS administrators
- analysts
- operational investigators
- technically curious learners

The course is especially useful for people who want to understand how telemetry and AI-assisted systems can support operational workflows without requiring deep AI specialization.

---

## Is this a SAS course or an AI course?

AF-002 is fundamentally a SAS-centered operational analysis course.

AI-assisted observation and computer vision are used as telemetry-generation tools.

The course is not intended to turn learners into machine learning researchers or AI engineers.

---

## Do I need prior AI experience?

No.

The course assumes little or no prior AI experience.

AF-002 introduces concepts gradually and focuses on operational understanding rather than advanced AI theory.

---

## Do I need prior IoT experience?

No.

The course explains operational telemetry concepts from the beginning and uses intentionally understandable examples.

---

## Is this course anti-cloud?

No.

The course is architecture-neutral.

AF-002 focuses on understanding telemetry, operational workflows, survivability, and Human-in-Command reasoning.

The course intentionally avoids assuming hyperscale cloud infrastructure because many learners work in ordinary operational environments.

---

## What does “small understandable operational systems” mean?

AF-002 intentionally uses systems that learners can reasonably:
- understand
- investigate
- restart
- explain
- troubleshoot

The goal is operational clarity, not architectural spectacle.

---

## Why does the course emphasize Human-in-Command?

Telemetry and AI-assisted systems provide evidence.

Humans remain responsible for operational judgment, interpretation, and decision-making.

AF-002 consistently reinforces:
- human oversight
- operational accountability
- bounded uncertainty
- evidence-based reasoning

---

## Do I need a GPU?

No.

The course is intentionally designed to run on ordinary hardware whenever possible.

---

## Will this run on an ordinary laptop?

Usually yes.

Most AF-002 examples are intentionally lightweight and designed for practical accessibility rather than high-performance infrastructure.

---

## Do I need a webcam?

A webcam is helpful for some exercises, but prerecorded images or video may also be used in many workflows.

---

## Can I use prerecorded images or video instead?

Yes.

Many lessons support prerecorded media as a telemetry source.

---

## What operating system is recommended?

Windows is currently the primary reference environment because the course uses PowerShell examples throughout setup and workflow demonstrations.

However, many concepts are portable to other platforms.

---

## What version of Python is recommended?

The course generally uses modern supported Python 3.x environments.

Always follow the current setup documentation included with the repository.

---

## What version of SAS is recommended?

AF-002 was designed primarily around:
- SAS 9.4
- SAS Studio
- SAS OnDemand for Academics

Other SAS environments may also work depending on configuration.

---

## Can I use SAS OnDemand for Academics?

Yes.

SAS OnDemand for Academics is supported throughout the course where practical.

---

## Why does the course use PowerShell?

PowerShell provides:
- reproducible setup steps
- deterministic workflow examples
- restartable command execution
- visibility into operational actions

The course prioritizes survivability and transparency over hidden automation.

---

## What is a Python virtual environment?

A Python virtual environment is an isolated Python workspace used to manage project-specific dependencies safely.

AF-002 uses virtual environments to reduce dependency conflicts and improve restartability.

---

## What if pip install fails?

Do not panic.

Dependency installation issues are common in real-world operational environments.

The course intentionally treats recovery and troubleshooting as part of operational learning.

Follow the documented recovery paths and setup guidance.

---

## What if my webcam does not work?

You may:
- troubleshoot the webcam
- use prerecorded media
- continue with portions of the course that do not require live capture

The course is designed to remain survivable even when components fail.

---

## Can I safely restart the lessons?

Yes.

AF-002 intentionally emphasizes:
- restartability
- deterministic URLs
- known-good outputs
- recovery paths
- survivability

---

## What is telemetry?

Telemetry is structured operational data representing:
- events
- activity
- states
- measurements
- operational conditions

---

## What is operational telemetry?

Operational telemetry represents meaningful operational activity such as:
- occupancy
- movement
- congestion
- detections
- workflow activity
- environmental conditions

---

## What is semantic telemetry?

Semantic telemetry represents meaningful labeled events rather than raw signals alone.

Examples:
- person detected
- forklift entered restricted zone
- occupancy threshold exceeded

---

## What is spatial telemetry?

Spatial telemetry represents:
- position
- movement
- occupancy
- region interaction

within a visual or operational environment.

---

## What is operational ambiguity?

Operational ambiguity occurs when telemetry is:
- incomplete
- delayed
- conflicting
- unclear
- imperfect

AF-002 intentionally includes bounded operational ambiguity because real operational environments are rarely perfect.

---

## Why are timestamps important?

Operational interpretation depends heavily on understanding:
- when events occurred
- when telemetry was transmitted
- when telemetry was processed
- how fresh the telemetry is

---

## What is timestamp lineage?

Timestamp lineage means understanding exactly what a timestamp represents.

Examples include:
- event time
- detection time
- transmission time
- processing time

---

## Why are confidence scores not absolute truth?

Confidence scores estimate detection likelihood.

They do not guarantee correctness.

Human operational judgment remains necessary.

---

## What are false positives and false negatives?

False Positive:
A detection incorrectly reports something that is not truly present.

False Negative:
A system fails to detect something that actually exists.

Both conditions matter operationally.

---

## What is dashboard abstraction?

Dashboard abstraction occurs when dashboards simplify telemetry in ways that may hide operational detail.

Summaries are useful, but they can reduce visibility into:
- timing
- freshness
- uncertainty
- edge conditions

---

## Why is SAS used in this course?

SAS is extremely strong at:
- operational analysis
- structured telemetry investigation
- summarization
- trend analysis
- reporting
- data workflow clarity

AF-002 demonstrates how SAS can remain highly valuable in telemetry-driven operational environments.

---

## Do I need advanced SAS programming skills?

No.

The course intentionally uses approachable SAS workflows whenever possible.

---

## Why are PROC FREQ and PROC MEANS used so heavily?

These procedures provide fast operational insight into:
- counts
- distributions
- trends
- frequencies
- operational conditions

Simple procedures often reveal important operational evidence.

---

## What is PROC TIMEPLOT used for?

PROC TIMEPLOT helps visualize telemetry and operational activity across time.

Time-oriented visibility is extremely important in operational investigation.

---

## Why does the course use CSV files?

CSV files are:
- portable
- transparent
- restartable
- easy to inspect
- widely supported

The course prioritizes operational clarity and survivability.

---

## Is this course intended for production deployment?

No.

AF-002 is an educational operational learning environment.

Some ideas may inspire production systems, but the course itself is not a production deployment framework.

---

## Are the example telemetry systems “real”?

The examples are intentionally simplified but operationally believable.

The course focuses on helping learners think operationally rather than simulating hyperscale enterprise environments.

---

## What is object detection?

Object detection is the process of identifying objects within images or video frames using AI-assisted systems.

---

## What is YOLO?

YOLO (“You Only Look Once”) is a family of object-detection models used throughout AF-002 examples.

---

## What is OpenCV?

OpenCV is an open-source computer vision library commonly used for image and video workflows.

---

## How accurate are detections?

Detection quality varies depending on:
- lighting
- camera angle
- motion
- environment
- model limitations
- operational conditions

Detections are operational evidence, not unquestionable truth.

---

## Why do bounding boxes sometimes look imperfect?

Object detections are approximations.

Operational systems often produce:
- partial overlap
- imperfect alignment
- edge clipping
- uncertain positioning

This is normal in many real-world systems.

---

## Can AI replace human operational judgment?

No.

AF-002 consistently reinforces Human-in-Command operational reasoning.

AI-assisted systems support operational visibility and evidence gathering.

Humans remain responsible for interpretation and decisions.

---

## Why does the course include imperfect telemetry?

Real operational systems are rarely perfect.

AF-002 intentionally teaches learners how to:
- investigate ambiguity
- recognize uncertainty
- evaluate evidence
- reason operationally

---

## What should I do if I get stuck?

Pause and review:
- setup instructions
- known-good outputs
- recovery paths
- lesson checkpoints

Operational troubleshooting is part of the learning process.

---

## Is it normal to feel uncertain during investigation exercises?

Yes.

Operational investigation often involves incomplete or imperfect information.

Learning to reason carefully under bounded uncertainty is part of the course.

---

## Are there always “correct” operational answers?

Not always.

Many operational investigations involve judgment, tradeoffs, uncertainty, and incomplete evidence.

AF-002 intentionally emphasizes operational reasoning rather than rote answers.

---

## Does AF-002 teach enterprise orchestration?

No.

The course intentionally avoids deep orchestration or hyperscale infrastructure complexity.

---

## Does AF-002 teach advanced machine learning?

No.

AF-002 focuses on operational telemetry understanding rather than machine learning theory or model development.

---

## Does AF-002 teach robotics or autonomous systems?

No.

The course focuses on telemetry-assisted operational understanding and Human-in-Command workflows.

---

## Why are deterministic URLs used throughout the course?

Deterministic URLs improve:
- survivability
- restartability
- portability
- validation consistency
- operational clarity

---

## Why are setup and quickstart separated?

The separation improves operational clarity.

SETUP focuses on:
- structured environment preparation
- machine-readable startup guidance

QUICKSTART focuses on:
- rapid human onboarding
- learner accessibility

---

# Final Note

AF-002 is designed to help learners think operationally about telemetry, visibility, uncertainty, and Human-in-Command reasoning using practical SAS-centered workflows.

The course intentionally prioritizes:
- clarity
- survivability
- restartability
- operational realism
- understandable systems

over architectural complexity or hype.

---

# Development & Test Environment

- Platform: ChatGPT (Web)
- Model: GPT-5.5
- Date: 2026-05-27

Notes:
- Developed during AF-002 Version 1.0 release engineering and deployment hardening.
- FAQ wording aligned to glossary terminology and release-freeze operational guidance.

---
```
