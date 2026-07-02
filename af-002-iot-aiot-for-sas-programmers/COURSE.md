# AF-002 - IoT/AIoT for SAS Programmers

**Kit Type:** Training Kit  
**Status:** Production Candidate  
**Version:** 1.0  
**Repository:** AF-002 - IoT/AIoT for SAS Programmers  
**Repository Object:** ROOT_LIBRARY  
**Raw:** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/LIBRARY.md  
**This File (Raw):** https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/COURSE.md  

---

# Authority

`COURSE.md` is the authoritative definition of the course.

It establishes the course's identity, instructional model, architecture, governing principles, and completion boundary.

---

# Course Identity

AF-002 is a practical operational course for SAS professionals exploring Internet of Things and Artificial Intelligence of Things workflows.

The course teaches SAS professionals that their existing operational analytics skills apply naturally to telemetry systems, event streams, computer-vision observations, and AI-assisted operational workflows.

AF-002 is SAS-centered. Python, computer vision, and AI-assisted observation are used to create operational telemetry that can be investigated and analyzed using SAS.

The course is not intended to turn learners into machine-learning engineers, computer-vision specialists, or enterprise IoT architects.

---

# Course Objective

By the end of AF-002, learners should be able to:

> Capture, process, analyze, and reason about operational telemetry using practical SAS-centered AIoT workflows.

---

# Governing Principles

## Human-in-Command

Systems may assist with observation, analysis, and instruction.

Humans retain judgment, accountability, and operational authority.

Telemetry and AI-generated results are evidence requiring interpretation. They are not unquestionable truth.

## Fast First Success

The learner should move quickly from a familiar physical input to structured telemetry and SAS analysis.

The first successful operational workflow should occur before unnecessary theory or architectural complexity is introduced.

## Action Before Theory

The learner should first create, inspect, and analyze telemetry.

Conceptual explanations should support the working experience rather than delay it.

## Architecture Follows Data

Telemetry generation, data movement, analysis, and decision support should occur where each workload functions naturally and understandably.

The course does not assume that every component belongs in one platform or technology stack.

## Lightweight Survivability

The course favors systems that learners can understand, inspect, troubleshoot, restart, and explain.

AF-002 avoids unnecessary dependency sprawl, hardware complexity, cloud lock-in, and enterprise over-engineering.

## Visible Evidence

Learners should be shown the relevant images, telemetry, SAS output, logs, and operational evidence needed to complete each investigation.

The course should not hide meaningful evidence behind summaries or unexplained conclusions.

## Bounded Progression

The learner completes one instructional unit at a time.

A facilitator should not compress, summarize, or skip required learner actions, checkpoints, or evidence merely to move through the course faster.

---

# Primary Success Pattern

```text
webcam -> telemetry -> CSV -> SAS analysis
```

This first-success pattern helps SAS professionals recognize telemetry as structured operational analytics data.

The webcam is used as an understandable sensor. Python and computer vision generate labeled observations. CSV provides a visible and portable interchange format. SAS provides the operational analysis environment.

---

# Lesson Sequence

## Lesson 00 - Setup and Orientation

Confirm the learner's environment and establish the course workspace.

## Lesson 01 - Simple Video and Images

Create the first telemetry-to-CSV-to-SAS success.

## Lesson 02 - Event Streams and Real-Time Thinking

Move from individual observations to sequences, timestamps, and operational events.

## Lesson 03 - AIoT Decision Loops

Connect operational rules, validation, AI assistance, and human judgment.

## Lesson 04 - Architecture Follows Data for AIoT

Investigate spatial telemetry and place observation, analysis, and decisions where the workload makes operational sense.

## Lesson 05 - Capstone Workflow

Apply the course concepts in one directed telemetry investigation.

---

# Instructional Architecture

Each lesson file is a self-contained, loadable instructional unit.

```text
One lesson file = one instructional unit
```

A lesson should contain the context, sequence, operational instructions, checkpoints, evidence requirements, and recovery guidance needed to complete that portion of the course.

Each lesson must remain:

- independently loadable
- operationally bounded
- restartable
- understandable to both humans and AI facilitators
- connected to the approved course sequence
- consistent with the governing principles in this document

The course is not delivered as one large undifferentiated prompt.

The learner or facilitator loads and completes the appropriate lesson unit, then advances to the next lesson when the current lesson's completion conditions have been satisfied.

---

# Course Delivery Model

AF-002 may be facilitated by an AI assistant, a human instructor, or both.

The facilitator must:

- follow the active lesson rather than replace it with a summary
- preserve the intended lesson sequence
- present required evidence visibly
- stop at learner checkpoints
- confirm required learner actions before advancing
- help recover from operational failures without silently changing the lesson objective
- avoid expanding the course into unrelated architecture, infrastructure, or theory
- preserve Human-in-Command decision authority

The lesson files contain the detailed delivery instructions for their respective instructional units.

This document governs the course-level identity and behavior those lessons must preserve.

---

# Completion Boundary

AF-002 is complete as a course when:

- the full approved lesson sequence exists
- the learner can enter the course through the defined startup path
- setup and recovery paths are usable
- Lesson 01 produces a reliable first telemetry-to-SAS success
- the learner completes a working telemetry investigation
- each lesson functions as an independently loadable instructional unit
- the learner encounters and evaluates operational evidence
- the learner retains final interpretive and decision authority
- a SAS professional can complete the course without requiring hidden infrastructure or undocumented steps

Completion does not require mastery of advanced machine learning, enterprise IoT architecture, robotics, or hyperscale infrastructure.

The course completion boundary is defined by operational understanding and successful SAS-centered telemetry investigation.
