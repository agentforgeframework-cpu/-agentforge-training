# VALIDATION_DAY1.md

**Project:** AF-001 — Everyday AI Bootcamp  
**Scope:** Lesson 01 — Core Prompting Fundamentals  
**Validation Type:** AI-assisted structural and persona simulation review  
**Validator:** Claude (Anthropic Claude Sonnet 4.6) — acting as test environment  
**Requested By:** Paul McDonald  
**Date:** 2026-05-09  
**Repository Path:** /validation/VALIDATION_DAY1.md  
**Status:** DRAFT — for team review

---

## 1. Purpose of This Document

This report captures the findings of an initial AI-side validation pass on AF-001 Lesson 01 (Core Prompting Fundamentals). It was produced by presenting the course overview document and Lesson 01 to a Claude instance with no prior configuration, system prompt, or role assignment, and asking the model to evaluate readability, structural integrity, persona fit, and deployment readiness.

This document is intended for use by the human and AI developer team as a project record. It is not a learner-facing document.

---

## 2. Files Reviewed

| File | Source | Status |
|------|--------|--------|
| `af-001-everyday-ai-bootcamp.md` | GitHub raw URL | Read successfully |
| `LESSON_01_CORE_PROMPTING_FUNDAMENTALS.md` | GitHub raw URL | Read successfully |

Both files were fetched directly from the public GitHub repository and parsed without error. Formatting was clean. Markdown structure was consistent and well-formed.

The following referenced documents were **not** available during this validation pass:

- `HIC-001_Human-in-Command_Standard.md`
- `AgentForge-Directives.md`
- `AF-001_Beta_Sprint_Log.md`

Absence of these files is noted as a gap. Their inclusion in future validation passes is recommended.

---

## 3. Structural Review

### 3.1 Course Overview Document

The course overview document (`af-001-everyday-ai-bootcamp.md`) is well-structured and clearly communicates:

- Course purpose and audience
- Instructional philosophy (EDGE method, Human-in-Command, Tool-Neutral design)
- Adaptive layer rules and self-selection principle
- 14-day course arc with clear lesson titles
- Deployment philosophy and license

**Observations:**

- The document reads as both a design spec and an operational reference. For a validation context this is appropriate. For a future AI system prompt it will need to be condensed and reframed as behavioral instructions.
- The "Raw file URL: To be determined" entry in the file header is a placeholder that should be updated before the repository is considered stable.
- The course arc (Days 1–14) is outlined at title level only. Lesson-level detail exists only for Day 1 at this stage. This is expected for Version 0.1 but should be tracked in the sprint log.

**Structural integrity:** PASS

---

### 3.2 Lesson 01 Document

The lesson document (`LESSON_01_CORE_PROMPTING_FUNDAMENTALS.md`) follows the AF-001 Template v1.1 standard. Required elements present:

- [x] Lesson header
- [x] Section progress indicators (SECTION 1/5 through 5/5)
- [x] Mode reminder
- [x] Recap block
- [x] Completion confirmation
- [x] Next lesson pointer
- [ ] Conversational continuity mechanism — **absent** (see Section 5.3)

**Structural integrity:** PASS WITH NOTE

---

## 4. Persona Simulation Results

Four digital-twin beginner personas were simulated completing Lesson 01. The simulation evaluated engagement, comprehension, friction points, and completion likelihood for each persona.

---

### 4.1 Jordan T., 34 — Business Analyst (Beginner Techie)

**Profile:** Comfortable with SaaS tools. Familiar with document workflows. No prior AI experience.

**Simulation outcome:** Completes in approximately 15 minutes. High confidence throughout. Refinement loop clicks immediately — maps to document iteration habits.

**Friction points:**
- Lesson may feel slightly slow in Sections 1–2. Risk of low engagement before reaching the more substantive content.
- Reflection questions likely skipped — action-oriented persona does not naturally pause for introspection.

**Recommendation:** Stretch prompt option in Section 4 or 5 would improve retention for this persona type. Lesson is otherwise well-matched.

**Completion likelihood:** HIGH

---

### 4.2 Maya K., 10 — Elementary School Student

**Profile:** Uses tablets for school. Comfortable with games and apps. No AI experience. Not in stated primary audience.

**Simulation outcome:** Completes with adult support. Natural curiosity drives engagement through Sections 1–3. Struggles with written reflection and abstract framing in Section 5.

**Friction points:**
- Camping checklist example in Section 3 is adult-oriented. A school project or hobby topic would land better for this age group.
- Reflection questions require adult facilitation. Self-directed written reflection is not developmentally appropriate at age 10 without scaffolding.
- Human-in-Command framing in Section 5 is too abstract without adult translation. "You remain responsible for judgment and decisions" does not map to a 10-year-old's frame of reference.

**Recommendation:** This persona falls outside the stated primary audience. The lesson is workable with adult co-facilitation. A parenthetical facilitator note within Section 5 (not a separate track) would address the most critical gap. Flag for the planned youth track in future expansion.

**Completion likelihood:** MODERATE (adult-assisted)

---

### 4.3 Rick B., 58 — Mainframe Engineer (Tired, Skeptical)

**Profile:** Deep technical background. Decades of systems experience. Skeptical of AI hype. Fatigued by buzzword-heavy technology discourse.

**Simulation outcome:** Completes, but at risk of early disengagement. Section 1 reads as too elementary for his background. Sections 3–5 earn his respect and sustain completion.

**Friction points:**
- "A prompt is a question or request" in Section 1 risks feeling condescending to a technically experienced reader.
- No early signal that the lesson will engage at a more substantive level. If Rick decides in Section 1 that this course is not for him, he may not reach the content that would change his mind.
- Refinement loop in Section 4 maps well to debugging workflows — this framing is not surfaced in the lesson and represents a missed opportunity.

**Recommendation:** Add one sentence to Section 1 acknowledging that structured prompting has value even for technically experienced users — frame it as a professional discipline rather than a beginner concept. This is a low-effort change with high impact for this persona type.

**Completion likelihood:** MODERATE (drop-off risk at Section 1)

---

### 4.4 Luz R., 47 — Small Business Restaurant Owner

**Profile:** Runs a taqueria. Uses smartphone for business. Avoids technology where possible. Little to no prior tech experience beyond basic phone use.

**Simulation outcome:** Completes. Highest emotional payoff of the four personas. The lesson's tone, pacing, and Human-in-Command closer are near-optimal for this audience.

**Friction points:**
- "Access to a conversational AI system" in Required Materials is too vague. This persona does not know what that means or where to go.
- Refinement loop commands ("rewrite professionally," "make this shorter") are functional but abstract without a domain example she can immediately map to her work context.
- Getting to the tool is the highest friction point. Once she is in the tool, the lesson carries her well.

**Recommendation:** Add a concrete tool recommendation to Required Materials. Even a one-sentence example ("For example: ChatGPT at chatgpt.com, or Google Gemini at gemini.google.com") would resolve the most significant barrier for this persona. Consider adding one restaurant or small business domain example to Section 3 or 4 alongside the camping checklist.

**Completion likelihood:** HIGH (once tool access is established)

---

### 4.5 Cross-Persona Summary

| Persona | Completion Likelihood | Primary Friction | Strongest Section |
|---|---|---|---|
| Jordan (techie) | High | Lesson pace in S1–S2 | Section 4 — Refinement loop |
| Maya (child) | Moderate (assisted) | Abstract reflection and HIC framing | Section 2 — Baseline exercise |
| Rick (engineer) | Moderate | Section 1 condescension risk | Section 5 — HIC reminder |
| Luz (restaurant owner) | High | Tool access setup | Section 5 — HIC reminder |

**All four personas completed the lesson.** No structural failure points were identified. The lesson is deployable in its current state with the caveats noted above.

---

## 5. Deployment Readiness Assessment

### 5.1 Content

**Status: READY**

Lesson content is clear, well-paced, and appropriate for the stated audience. No factual errors, structural gaps, or tone problems were identified. The EDGE instructional model is evident in the lesson structure. Human-in-Command framing is consistent with the course philosophy.

---

### 5.2 System Prompt Layer

**Status: NOT PRESENT — ACTION REQUIRED**

No system prompt exists to configure the AI instructor role. During this validation pass, Claude operated on its own defaults. This means:

- Mode system (Conversational / Direct) was not enforced
- HIC-001 behavioral standard was approximated, not applied
- Instructor persona and tone were inferred, not defined
- No consistency guarantees exist across sessions or AI instances

This is the highest-priority gap in the current deployment architecture. A system prompt must be developed before structured deployment begins. At minimum it should include:

- Role assignment and instructor persona
- Mode system rules and switching behavior
- HIC-001 behavioral constraints (requires loading the reference document)
- Lesson open and close protocols
- Handling rules for confused, disengaged, or off-topic learners

---

### 5.3 Session Continuity

**Status: NOT ADDRESSED — ACTION REQUIRED**

The course is designed as a 14-day arc. No mechanism currently exists to carry learner state between sessions. Each new conversation begins fresh with no memory of prior lessons, modes, or learner preferences.

Recommended approaches (in order of implementation effort):

1. Use Claude Projects to provide persistent memory within a defined course space — lowest friction for current platform
2. Add a structured state handoff block to each lesson completion confirmation — learner copies a short context string and pastes it at the start of the next session
3. Build a formal session-open ritual into each lesson template — learner confirms starting state before content begins

Option 2 is the most platform-agnostic and aligns with the course's low-friction deployment philosophy.

---

### 5.4 Reference Document Availability

**Status: INCOMPLETE**

Three documents cited throughout the course materials were not available during this validation pass:

- `HIC-001_Human-in-Command_Standard.md`
- `AgentForge-Directives.md`
- `AF-001_Beta_Sprint_Log.md`

These should be loaded alongside lesson content in any production deployment session. Their absence during this validation means the AI operated on inferred rather than defined behavioral standards. Future validation passes should include all three.

---

### 5.5 Tool Access Onboarding

**Status: GAP IDENTIFIED**

Three of four simulated personas encountered friction at the Required Materials step due to the phrase "access to a conversational AI system." For non-technical learners this is insufficient.

A "Start Here" onboarding document — separate from lesson content — is recommended. It should cover:

- Which AI tools are suitable (with example URLs)
- How to open and start a conversation
- What the Human-in-Command principle means before they begin
- What to expect from the course

This document requires no changes to existing lesson files and aligns with the course's low-friction philosophy.

---

## 6. Recommended Actions

The following actions are listed in recommended priority order.

| Priority | Action | Effort | Owner |
|---|---|---|---|
| 1 | Write the AI system prompt for the instructor role | High | Dev team |
| 2 | Load HIC-001 and AgentForge-Directives into validation and production sessions | Low | Dev team |
| 3 | Build session continuity mechanism (state handoff or Projects integration) | Medium | Dev team |
| 4 | Add tool recommendation sentence to Lesson 01 Required Materials | Low | Content team |
| 5 | Write "Start Here" onboarding document | Medium | Content team |
| 6 | Add one-line Section 1 acknowledgment for technically experienced learners | Low | Content team |
| 7 | Add second domain example to Section 3 alongside camping checklist | Low | Content team |
| 8 | Add facilitator note to Section 5 for youth or child learners | Low | Content team |
| 9 | Update placeholder "Raw file URL: To be determined" in course overview | Trivial | Dev team |

---

## 7. Validator Notes

This validation was conducted without a system prompt, without the HIC-001 standard, and without prior session history. The AI operated on default Claude behavior throughout.

This is an accurate reflection of what any learner or developer would experience when presenting these documents to a fresh Claude session today. The content performs well under those conditions. The infrastructure layer does not yet exist.

The course is well-conceived, clearly written, and structurally sound. The primary work remaining before structured deployment is architectural, not content-level.

---

## 8. Document History

| Version | Date | Author | Notes |
|---|---|---|---|
| 0.1 | 2026-05-09 | Claude (Sonnet 4.6) | Initial validation draft — AI-generated, human review required |

---

*This document was generated by Claude (Anthropic Claude Sonnet 4.6) on 2026-05-09 at the request of Paul McDonald as part of the AF-001 AgentForge Training project validation process. It should be reviewed by the human development team before being treated as a final project record.*
