# AF-002 Lessons 00–03 Digital Twin Continuity Report

---

## Test Context

- **Course:** AF-002 — IoT/AIoT for SAS Programmers
- **Lessons Evaluated:** 00, 01, 02, 03
- **Test Type:** Digital Twin Instructional Continuity and Survivability Evaluation
- **Test Date:** 2026-05-18
- **Tester:** Claude (Anthropic) — acting as digital twin learner/evaluator
- **Primary Setup File:** SETUP_af-002-iot-aiot-for-sas-programmers.md (fetched and confirmed live)
- **Lesson Files Evaluated:**
  - AF002_LESSON_00.md (fetched via GitHub blob — confirmed live, full content)
  - AF002_LESSON_01.md (fetched via GitHub blob — confirmed live, full content)
  - AF002_LESSON_02.md (fetched via GitHub blob — confirmed live, full content)
  - AF002_LESSON_03.md (fetched via GitHub blob — confirmed live, full content)
- **Navigation Method:** GitHub blob HTML scrape (raw.githubusercontent.com blocked by network; GitHub blob accessible)
- **Stable filename convention tested:** AF002_LESSON_NN.md — **confirmed present in repository**

---

## Overall Result

**PARTIAL PASS**

The course architecture is sound and the instructional identity is well-preserved across Lessons 00–02. The progression from setup through telemetry generation to stream-aware SAS thinking is coherent and survivable. However, **Lesson 03 contains a critical structural problem** that prevents it from functioning as a self-contained learner-facing lesson at this time. Two secondary navigation issues also require attention.

---

## Navigation And File Reference Findings

**Stable Filename Convention — CONFIRMED WORKING**

The AF002_LESSON_NN.md naming convention is live in the repository. The following files were confirmed present by directory inspection:

- AF002_LESSON_00.md
- AF002_LESSON_01.md
- AF002_LESSON_02.md
- AF002_LESSON_03.md
- AF002_LESSON_04.md
- AF002_LESSON_05.md

**Raw URL Navigation Chain**

Each lesson from 00 through 02 ends with an explicit Next Lesson raw URL pointing to the next AF002_LESSON_NN.md file. The navigation chain is intact for those lessons and the format is correct.

**SETUP File Mismatch — CRITICAL**

The SETUP file (`SETUP_af-002-iot-aiot-for-sas-programmers.md`) still references the old naming convention:

> `LESSON_00_SETUP_AND_ORIENTATION.md`

with URLs pointing to:

> `.../lessons/LESSON_00_SETUP_AND_ORIENTATION.md`

A file with that name is still live in the repository under `lessons/`. This creates a **dual-path ambiguity**: the SETUP file routes to the old filename, while the stable convention uses AF002_LESSON_00.md. An AI assistant or learner following the SETUP file would navigate to the OLD Lesson 00 file — a shorter, thinner version that lacks the full setup checks and Next Step URL present in AF002_LESSON_00.md.

**Finding:** The SETUP file's post-setup navigation URL is stale. It must be updated to point to AF002_LESSON_00.md.

**Old Lesson 00 File — Stale Ghost**

`LESSON_00_SETUP_AND_ORIENTATION.md` is still live. It contains a stub-level Lesson 00 (no setup checks, no webcam verification, no explicit Next Step URL, no restart checkpoint). If a learner or AI assistant reaches that file instead of AF002_LESSON_00.md, the lesson chain effectively breaks at the first step.

**Lesson 03 File Reference Block — CRITICAL**

Lesson 03's File Reference Information contains:

> Human URL: (TBD after repository commit)
> Raw URL: (TBD after repository commit)

This is a developer artifact left in a learner-facing file. The lesson also has no explicit Next Step link to Lesson 04. Both are critical failures for navigation continuity and learner trust.

---

## Lesson 00 Findings

**Overall: PASS**

Lesson 00 (AF002_LESSON_00.md) is well-constructed and survivable.

**Strengths:**

- Five named setup checks with explicit validation criteria
- The `py` vs `python` tip is prominent and correctly placed — this will rescue Windows learners at the exact moment it matters
- Webcam fallback path acknowledged before it becomes a blocker
- The "What You Are Preparing For" section explains the full pipeline before the learner starts it — this sets correct expectations without overwhelming
- Restart Checkpoint is clear and actionable
- Visual Brief URL is present
- Next Step section contains both GitHub URL and Raw URL for AF002_LESSON_01.md
- File Reference block is complete with Previous/Next/README links
- The phrase "You are NOT building a hyperscale streaming platform" is well-placed and identity-preserving

**Issues:**

- The SETUP file routes to the OLD Lesson 00 file, not this one. A learner following the SETUP file will miss all of the above.
- The Development and Test Environment block still shows "ChatGPT Web / GPT-5.5 Thinking" — minor trust artifact for non-ChatGPT learners, not critical
- "GitHub URL: pending repository placement" has been removed from this file — confirmed clean

**Answer to Specific Question 1:** Yes, Lesson 00 prepares the learner without overwhelming them. The structure is tight, the checks are concrete, and the tone is reassuring.

---

## Lesson 01 Findings

**Overall: PASS**

Lesson 01 (AF002_LESSON_01.md) is the strongest lesson in the sequence for operational confidence delivery.

**Strengths:**

- The webcam → CSV → SAS pipeline is fully executable with explicit steps
- The image telemetry fallback is a genuine secondary success path, not a consolation note
- Inline SAS code (PROC IMPORT, PROC PRINT, PROC FREQ, PROC MEANS) is complete and copy-pasteable
- A DATA step fallback (copy/paste data) is included for SAS OnDemand environments — this is operationally critical and well-placed
- All supporting file links include explicit GitHub and Raw URLs
- Sample CSV with example rows gives the learner a visible target before running anything
- Success Checkpoint clearly states what the learner should be able to see
- Restart Checkpoint is actionable
- The "First Success" statement is operationally satisfying: *"I generated AI-assisted operational telemetry from webcam or image input and analyzed it with SAS."*
- File Reference block is complete

**Issues:**

- The Troubleshooting section does not mention the case where YOLO model download fails on first run (ultralytics downloads weights automatically; on restricted networks this can fail silently). This is a plausible abandonment point.
- The `/data/` folder must exist before the Python script runs. The lesson does not confirm this or instruct the learner to create it if absent.

**Answer to Specific Question 2:** Yes, Lesson 01 creates the first visible telemetry success. The multiple fallback paths (webcam → image → sample CSV) make success reachable across a wide range of real-world conditions.

---

## Lesson 02 Findings

**Overall: PASS**

Lesson 02 (AF002_LESSON_02.md) is a substantive and operationally coherent lesson. The pivot from live telemetry capture to standardized teaching data is handled cleanly and is justified explicitly.

**Strengths:**

- Standardized teaching data embedded directly in the SAS code blocks — no external file dependency for the main path
- All 16 sections follow a clear EDGE progression (Explain → Demonstrate → Guide → Enable)
- The "incrementally maintainable vs recalculate" framework is genuine operational SAS thinking
- The Section 10 table (Often Incrementally Maintainable / Requires Caution / Often Recalculated) is a high-value reference that learners will return to
- PROC SGPLOT is introduced naturally as a visualization of operational behavior, not as a graphics exercise
- The optional tie-back to Lesson 01 telemetry is correctly positioned as optional
- Restart Checkpoint lists exactly which sections to rerun
- AI Assistant Guidance explicitly warns against Kafka, cloud streaming, and distributed systems — strong drift guardrail
- File Reference block is complete with Previous/Next/README links
- Operational Guideline at the end (*"Update what you can. Recalculate what you must."*) is a strong closing anchor

**Issues:**

- The `%eval(&old_total + &new_total)` macro in Section 8 may cause confusion with HTML entity encoding (`&amp;` appears in the GitHub-rendered version). Learners copy-pasting from the rendered page rather than the raw file may encounter broken macro variable references. This is a display artifact, not a file content error, but worth noting.
- The learner exercise (Section 15) introduces a new sensor (SENSOR_D) which requires inserting a new row into a summary dataset. The instruction is correct but does not give the SAS code for that new-row insertion — the learner is expected to figure it out. This is intentional as an enabling exercise but represents a potential abandonment point for less confident SAS programmers.

**Answer to Specific Question 3:** Yes, Lesson 02 successfully teaches that telemetry changes over time. The Section 7 "One New Event Arrives" moment is the pedagogical heart of the lesson and it works cleanly.

---

## Lesson 03 Findings

**Overall: CONDITIONAL PASS with CRITICAL ISSUES**

Lesson 03 (AF002_LESSON_03.md) has strong instructional doctrine and the right operational identity, but it is **not currently in a learner-facing deployable state**.

**Strengths:**

- The bird feeder scenario is the right size — operationally relatable, low cost, visually meaningful
- The Phase structure (1–7) provides clear instructional progression
- The Human-in-Command doctrine is explicitly embedded and well-placed
- The "2.2 birds" summary statistics anchor (Phase 6) is a genuinely effective teaching moment — the learner naturally recognizes mathematically valid / operationally absurd
- The Fresh-Session Survivability Rule is explicit and correct
- Quiet telemetry (NO_ACTIVITY) as operational information is a sophisticated and appropriately placed concept for this stage
- The Instructor Opening Example includes complete SAS DATA step and PROC PRINT code
- The learner artifact list is specific

**Critical Issues:**

1. **File Reference block is incomplete.** Both the Human URL and Raw URL are listed as "(TBD after repository commit)." This is a developer artifact in a learner-facing file. A learner who loses their place cannot navigate back to or forward from this lesson using the file itself.

2. **No explicit Next Step link.** There is no "Continue to AF002_LESSON_04.md" section. The navigation chain breaks here.

3. **Lesson 03 is written as an instructor guide, not a learner-facing lesson.** The file contains instructor prompts ("Instructor guidance example:", "Recommended instructor prompts:"), phase structures described as "how to deliver" rather than "what to do," and phase sections that describe SAS actions without fully executing them. A learner arriving at this file without a live instructor would encounter guidance on *how to teach* Lesson 03 rather than instructions for *completing* Lesson 03.

4. **Phase 5 SAS code contains HTML entity encoding.** The line `if species_count >= 4 then` appears as `if species_count &gt;= 4 then` in the repository. This is likely a rendering artifact, but it must be confirmed in the raw file before deployment.

5. **No Restart Checkpoint.** Unlike Lessons 00–02, Lesson 03 has no explicit restart boundary.

6. **No First Success statement.** The lesson completion signal is written as an instructor cue ("The instructor should explicitly state: You have completed...") rather than a learner-owned success statement.

**Answer to Specific Question 4:** Lesson 03 *would* successfully teach operational telemetry use if delivered with a live instructor. As a standalone self-directed learner file, it does not yet meet that standard.

---

## Cross-Lesson Continuity

**Lesson 00 → 01 transition: STRONG**

The Lesson 00 success statement ("I know that Lesson 01 will turn AI-assisted webcam observations into telemetry data and analyze that telemetry in SAS") exactly matches what Lesson 01 delivers. No gap.

**Lesson 01 → 02 transition: STRONG**

Lesson 02 opens with an explicit bridge: "Lesson 01 showed this pattern... Lesson 02 adds time and change." The Core Idea section names the conceptual shift cleanly. The pivot to standardized data is explained rather than assumed.

**Lesson 02 → 03 transition: ADEQUATE with gap**

Lesson 02 ends correctly with "Continue to AF002_LESSON_03.md" including raw URL. Lesson 03 opens with a correct callback ("In Lesson 02, you learned that telemetry changes over time"). The conceptual bridge is present. The gap is that Lesson 03's instructional mode shifts from self-directed lab to conversational instructor-led — and this shift is not explicitly communicated to the learner arriving from Lesson 02.

**Answer to Specific Question 7:** The conceptual transition from Lesson 02 to Lesson 03 feels natural. The mode-of-delivery shift does not.

---

## SAS Identity Preservation

**STRONG across Lessons 00–02. ADEQUATE in Lesson 03.**

The course consistently feels like SAS work being extended into a new domain, rather than a Python or IoT course that happens to mention SAS.

Lesson 00: SAS access verification is a peer check alongside Python and webcam. Not subordinate.

Lesson 01: SAS is the final destination of every workflow step. The entire pipeline culminates in PROC PRINT / PROC FREQ / PROC MEANS. The DATA step fallback for SAS OnDemand strengthens this further.

Lesson 02: Pure SAS lesson. No Python, no webcam. The DATA step, PROC FREQ, PROC SUMMARY, and PROC SGPLOT are all tools the learner already knows. The operational wrapping is new; the SAS is familiar.

Lesson 03: The bird feeder DATA step is SAS. PROC FORMAT and LABEL statements are SAS professional practice. The summary statistics moment is SAS. The Human-in-Command framing is consistent. However, the instructor-guide format makes it harder for a learner to feel they are doing SAS work, because they are reading about how someone else would guide them through it.

**Answer to Specific Question 5:** The course does NOT drift into hyperscale architecture, cloud platform tourism, orchestration systems, AI hype, or enterprise fantasy. The identity guardrails in the AI Assistant Guidance sections of each lesson are specific and effective.

---

## Operational Telemetry Progression

The four-lesson arc is coherent as a concept map:

| Lesson | Telemetry Role | SAS Role |
|--------|---------------|----------|
| 00 | Telemetry doesn't exist yet — prepare to create it | Verify access |
| 01 | Telemetry is generated and becomes SAS data | Import, print, freq, means |
| 02 | Telemetry arrives continuously — some results can be updated, some must be recalculated | Incremental update thinking |
| 03 | Telemetry represents operational behavior — interpret, investigate, decide | Operational state reasoning |

This is a legitimate progression from "generate" → "understand" → "use." It matches the stated mission: *prepare → generate → understand → use operationally.*

The progression does not skip steps or introduce unnecessary concepts. Each lesson earns the next.

**Answer to Specific Question 9:** Yes, the learner progression feels like operational growth rather than added topics. The same pipeline concept deepens across all four lessons rather than branching into unrelated territory.

---

## Learner Confidence Continuity

**Lessons 00–02: HIGH**

Each lesson has a visible success checkpoint, a named first success statement, and a restart checkpoint. The learner always knows what success looks like and how to recover from interruption. The tone across all three lessons is consistently reassuring without being condescending.

The "You are NOT building a hyperscale streaming platform" statement in Lesson 00 sets a permission structure that reduces anxiety before it can form.

**Lesson 03: MODERATE RISK**

A learner completing Lesson 02 with high confidence and opening Lesson 03 will encounter a file that reads like an instructor's delivery script. This is a potential confidence disruption — not because the content is wrong, but because the learner's role is ambiguous. They may not know what to execute, in what order, or how to know when they are done.

The absence of a "First Success" statement and the absence of a Restart Checkpoint compound this.

**Answer to Specific Question 8:** Lesson 03 partially preserves operational confidence. The scenario, the Human-in-Command framing, and the SAS code are all appropriate. The instructional format is the risk.

**Answer to Specific Question 10:** The course is ready for wider digital twin testing of Lessons 00–02. Lesson 03 requires conversion to self-directed learner format before being included in wider testing.

---

## Drift Risks

**Identified drift risks, in priority order:**

1. **SETUP file routes to old Lesson 00.** A learner following the SETUP file enters the old, thinner version of Lesson 00. This is a quiet navigation failure that could go undetected during testing.

2. **Lesson 03 instructor-guide format.** If an AI assistant is asked to "help me complete Lesson 03," it will struggle to identify which steps the learner should execute and in what order. The lesson's current format is optimized for a human instructor reading it, not an AI assistant supporting a learner.

3. **Old LESSON_00_SETUP_AND_ORIENTATION.md file remains live.** Any AI assistant given the old URL (from the SETUP file) will load the wrong file without warning.

4. **Lesson 03 TBD URLs.** An AI assistant asked to "load the next lesson after Lesson 03" will fail if it relies on the File Reference block in Lesson 03.

5. **YOLO model download on restricted networks** (Lesson 01). Not a course content issue, but a real-world abandonment risk not covered in Troubleshooting.

---

## Required Fixes

Listed in priority order.

**Fix 1 — Update SETUP file navigation URL (CRITICAL)**
Change the SETUP file's post-setup continuation URL from:
`.../lessons/LESSON_00_SETUP_AND_ORIENTATION.md`
to:
`.../lessons/AF002_LESSON_00.md`

**Fix 2 — Convert Lesson 03 to self-directed learner format (CRITICAL)**
Lesson 03 must be rewritten so that:
- Each phase contains learner-executable instructions (not instructor delivery notes)
- A Restart Checkpoint is present
- A "First Success" statement is present
- Instructor prompts are either removed or converted to inline coaching language ("Look at these rows. Which one catches your attention first?")
- Phases 2–7 have complete SAS code blocks that the learner runs independently

**Fix 3 — Complete Lesson 03 File Reference block (CRITICAL)**
Replace both "(TBD after repository commit)" entries with the live GitHub and Raw URLs. Add a Next Step section pointing to AF002_LESSON_04.md.

**Fix 4 — Remove or redirect old LESSON_00_SETUP_AND_ORIENTATION.md (HIGH)**
Either delete the old file or add a redirect notice at the top pointing to AF002_LESSON_00.md.

**Fix 5 — Confirm Lesson 03 Phase 5 operator encoding (MEDIUM)**
Verify that `>=` in the Phase 5 SAS code block appears correctly in the raw file and not as `&gt;=`. If the raw file contains the HTML entity, fix it.

---

## Recommended Improvements

These are not blockers but would improve survivability or learner experience.

**Recommendation 1 — Add YOLO download note to Lesson 01 Troubleshooting**
Add a troubleshooting entry: "ultralytics downloads model weights on first run — this requires an internet connection and may take a few minutes. On restricted networks it may fail silently. If the script appears to hang, check your internet access."

**Recommendation 2 — Add /data/ folder existence check to Lesson 01**
Add a step or a note: "Confirm that the /data/ folder exists. If it does not, create it before running the Python script."

**Recommendation 3 — Add SAS code for SENSOR_D row insertion in Lesson 02 Exercise**
Provide a hint or example of how to append a new row to an existing SAS summary dataset. The exercise is appropriate as a stretch task, but one example of the new-row pattern would reduce the risk of abandonment for less confident learners.

**Recommendation 4 — Update Development and Test Environment block in all lessons**
Consider adding a note that all lessons have been cross-platform validated on Claude (in addition to ChatGPT). This would reduce the perception that the course is ChatGPT-specific.

**Recommendation 5 — Clarify lesson mode in Lesson 03 opening**
Once Lesson 03 is converted to self-directed format, add a brief note explaining the conversational pacing: "This lesson works best when you run one step, observe the result, and then continue. Take your time between phases."

---

## Final Verdict

**PARTIAL PASS**

Lessons 00, 01, and 02 form a coherent, survivable, and SAS-centered learning sequence. A normal SAS-oriented learner following those three lessons would emerge with a working telemetry pipeline, a visible SAS output, and a genuine understanding of why continuously arriving data changes how analysis should be handled.

Lesson 03 has the right instructional doctrine and the right scenario, but is not yet in a state where a self-directed learner can complete it without a live instructor. The TBD file references and the instructor-guide format are blocking issues.

**The course should not be promoted as Lessons 00–03 complete until Lesson 03 is converted to self-directed learner format and its file reference block is completed.**

Lessons 00–02 are ready for wider digital twin testing as a standalone arc.

---

*Report generated: 2026-05-18*
*Evaluator: Claude (Anthropic) — digital twin instructional continuity test*
*Test scope: AF-002 Lessons 00–03, SETUP file, navigation chain, SAS identity, learner confidence continuity*
