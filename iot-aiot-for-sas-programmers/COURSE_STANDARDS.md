# COURSE_STANDARDS.md

Version: v1.0  
Status: Stabilized Working Draft
Date:  6 May 2026

# Course Standards

## Philosophy

Teach operational AIoT understanding through small, understandable systems.

The course is designed primarily for SAS programmers and analytics professionals who already understand enterprise data, operational reporting, and analytics workflows.

The goal is not hyperscale complexity.

The goal is to help learners understand how operational AIoT systems behave, how telemetry is generated, and how AI-driven event systems connect naturally to analytics and decision support.

Avoid overwhelm. Learners should be able to mentally model the active system.

---

# Educational Model

The course follows a guided operational apprenticeship model.

Learners should:
- build systems
- observe behavior
- refine implementations
- understand operational meaning
- reason about architecture
- connect telemetry back to analytics

Lessons should remain:
- conversational
- adaptive
- operational
- architecture-aware

The course should emphasize learning by doing rather than passive lecture delivery.

---

# Standards

Lessons should:
- remain practical
- include operational discussion
- include architecture discussion
- remain reproducible
- avoid unnecessary complexity
- provide early visible success
- allow safe imperfection and experimentation
- connect AIoT concepts back to operational telemetry
- introduce architecture through operational behavior
- reinforce how SAS fits into operational AIoT workflows

---

# Small Understandable Systems

Lessons should prioritize:
- small systems
- visible workflows
- understandable architecture
- local execution where practical
- incremental refinement

Learners should be able to understand:
- what the system is doing
- why it is doing it
- how events are generated
- how telemetry is stored
- how analytics connect to operations

Avoid introducing unnecessary infrastructure complexity early in the learning process.

---

# Safe Imperfection

Imperfect outcomes are educationally valuable.

Examples:
- incorrect classifications
- confidence instability
- threshold tuning
- missing detections
- environmental variability
- setup friction

Operational imperfections often create stronger learning opportunities than perfectly controlled demonstrations.

---

# Lesson Rhythm

Preferred lesson rhythm:

1. Small visible success
2. Explain what happened
3. Refine or expand
4. Explain deeper operational meaning
5. Reflect architecturally
6. Connect back to SAS operational thinking

Pacing should remain flexible and adaptive to learner needs.

---

# Required Lesson Sections

Every lesson should include:

- Why This Matters
- Operational Concept
- Working Lab
- How SAS Fits
- Architecture Discussion
- Reflection Questions

Additional sections may be added when useful.

---

# Minimum Standard Deployment

Each lesson should contain at minimum:

- README.md
- LESSON_GUIDE.md
- LESSON_STATUS.md
- /scripts
- /visuals

Additional folders may be added when operationally useful.

---

# Optional Standard Extensions

Optional standardized extensions may include:

- /data
- /examples
- /output
- /html
- /configs
- /sas

Optional folders should only be added when they materially improve:
- lesson clarity
- operational organization
- workshop usability
- execution support

Avoid unnecessary structural complexity.

---

# Naming Standards

Lesson folders should follow:

NN-short-kebab-case-title

Examples:
- 01-simple-video-and-images
- 02-events-schemas-and-exception-handling

Avoid ambiguous or compressed naming styles.

---

# AI Teacher Behavior

AI lesson support should:
- guide operational understanding
- adapt pacing dynamically
- explain concepts after operational experience
- encourage experimentation
- reinforce architectural reasoning
- maintain learner orientation

AI instruction should avoid:
- excessive abstraction
- hyperscale assumptions
- unnecessary jargon
- enterprise theater
- overwhelming the learner

---

# Stabilization Philosophy

Lessons are expected to mature over time.

Priority order:
1. understandable
2. runnable
3. teachable
4. repeatable
5. refined

"Stable" is more important than "finished."

---

# Final Principle

The learner should always be able to mentally model the active system.

If the learner loses the ability to understand the operational flow, the lesson should be simplified, divided into smaller stages, or slowed down.