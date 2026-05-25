# AF-002 Governance Standard
# Controlled Evidence Doctrine

Document ID:
AF002-GOV-001

Title:
Controlled Evidence Doctrine

Status:
Approved Operational Governance

Scope:
AF-002 — IoT/AIoT for SAS Programmers

Location:
./af-002-iot-aiot-for-sas-programmers/governance/

---

# Purpose

This doctrine establishes operational controls for instructional evidence
used during AF-002 runtime teaching sessions, walkthroughs, demonstrations,
clean-room testing, and deployment activities.

The doctrine exists to preserve:

- learner safety
- operational trust
- evidence reproducibility
- instructional consistency
- Human-in-Command discipline
- clean-room survivability

---

# Core Principle

Operational evidence used during instructional runtime must be:

- approved
- reviewable
- reproducible
- stable across sessions

Instructional runtime must NOT introduce uncontrolled evidence artifacts.

---

# Runtime Rule

During instructional runtime:

DO NOT generate images dynamically.

Use ONLY:

- approved repository artifacts
- approved screenshots
- approved overlays
- approved telemetry examples
- approved SAS outputs
- approved diagrams

---

# Allowed Runtime Evidence

Examples include:

- static lesson PNG files
- reviewed VisualBrief assets
- approved telemetry CSV files
- approved SAS output screenshots
- approved floor plans
- approved operational overlays

---

# Prohibited Runtime Evidence

The following are NOT allowed during instructional runtime:

- dynamically generated images
- synthetic operational screenshots
- improvised evidence graphics
- runtime-created telemetry visuals
- uncontrolled AI-generated evidence artifacts

---

# Exception Handling

Some AF projects or courses may intentionally teach:

- image generation
- VisualBrief workflows
- AI image systems
- synthetic media creation

In such cases:

- image generation may be allowed
- generated artifacts must still remain controlled
- lesson governance must explicitly authorize the behavior

Governance should therefore occur at the:

- course level
- tool level
- operational workflow level

rather than globally across all AgentForge work.

---

# Operational Rationale

This doctrine emerged from live runtime operational failures during
AF-002 Lesson 04 testing.

Observed failures included:

- evidence continuity collapse
- learner trust degradation
- mismatch between telemetry and visuals
- uncontrolled instructional artifacts

Operational findings demonstrated that:

Operational realism depends on evidence discipline.

---

# Human-in-Command Alignment

Human operators must be able to:

- trust instructional evidence
- verify operational provenance
- reproduce observations
- validate telemetry relationships

Controlled evidence strengthens:

- operational skepticism
- analytical discipline
- evidence validation behavior
- Human-in-Command reasoning

---

# Approved Alternative

If additional visuals are desired during runtime:

Generate image prompts ONLY.

Image generation itself must occur:

- outside instructional runtime
- under controlled review
- with explicit approval before use

---

# Relationship to VisualBrief

This doctrine does NOT prohibit:

- VisualBrief development
- controlled image generation workflows
- approved media creation pipelines

It governs ONLY:

runtime instructional evidence behavior.

---

# Survivability Principle

Operational lessons should remain stable across:

- AI platforms
- clean-room sessions
- offline environments
- enterprise environments
- classroom deployments

Controlled evidence improves:

- portability
- reproducibility
- operational continuity
- instructional survivability

---

# Development & Test Environment

Platform:
AgentForge Framework

Project:
AF-002 — IoT/AIoT for SAS Programmers

Date:
2026-05-25

Purpose:
Operational governance stabilization
