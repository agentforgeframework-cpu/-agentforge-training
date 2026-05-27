# README Standard — AgentForge Operational Guidance

Status: Draft Operational Guidance  
Current Location: `/operations/release-engineering/README_STANDARD.md`  
Future Candidate Location: `-agentforgeframework/-governance/` after operational review and multi-project validation.

---

# Purpose

This document defines the minimum operational structure for `README.md` files used within AgentForge projects.

The goal is to improve:
- operational survivability
- deterministic navigation
- AI-assisted retrieval
- restartability
- public maintainability
- clean-room usability
- deployment consistency

This standard emerged from operational findings during development of:

AF-002 — IoT/AIoT for SAS Programmers

The guidance currently represents:
- operational guidance
- survivability guidance
- release-engineering guidance

rather than finalized cross-project governance doctrine.

---

# Core Principle

README files are operational infrastructure.

README files should support:
- humans
- AI systems
- clean-room operation
- deterministic retrieval
- operational restartability

README files are NOT treated as casual project notes.

---

# Minimum README Structure

All operational README files should contain the following sections.

---

## 1. README Attributes

Required marker:

```markdown
## README Attributes
````

Expected contents:

* Repository Path
* GitHub URL
* Raw URL
* Status

Purpose:

* deterministic identification
* AI retrieval support
* operational survivability

---

## 2. Purpose

Required marker:

```markdown
## Purpose
```

Describe:

* why the folder exists
* operational role
* intended use

Validation type:
PROSE

Machine validation requirement:

* section exists
* non-empty content exists

---

## 3. Audience

Required marker:

```markdown
## Audience
```

Describe:

* intended readers
* maintainers
* learners
* operators
* release engineers
* developers

Validation type:
PROSE

---

## 4. What Belongs Here

Required marker:

```markdown
## What Belongs Here
```

Describe:

* expected files
* expected artifacts
* intended folder contents

Validation type:
PROSE

---

## 5. What Does NOT Belong Here

Required marker:

```markdown
## What Does NOT Belong Here
```

Describe:

* prohibited artifacts
* temporary files
* generated runtime clutter
* deprecated content
* unsupported materials

Validation type:
PROSE

---

## 6. File and Immediate Subfolder Inventory

Required markers:

```markdown
<!-- BEGIN AUTO-INVENTORY -->
<!-- END AUTO-INVENTORY -->
```

Inventory should include whenever possible:

* repository-relative path
* GitHub URL
* raw URL

Reason:
Different AI systems require different retrieval surfaces.

Operational findings showed:

* humans often prefer GitHub blob URLs
* Claude frequently requires raw URLs
* deterministic retrieval improves survivability

Validation type:
DETERMINISTIC

Machine validation requirements:

* markers exist
* inventory exists
* referenced files exist
* referenced paths are valid
* GitHub URLs are structurally valid
* raw URLs are structurally valid when present

---

## 7. Maintenance Notes

Required marker:

```markdown
## Maintenance Notes
```

Describe:

* update expectations
* inventory maintenance
* survivability expectations
* deterministic navigation expectations

Validation type:
PROSE

---

## 8. Attribution and Licensing

Required marker when operationally relevant:

```markdown
## Attribution and Licensing
```

Typically required for:

* media folders
* downloadable assets
* OSS references
* publication artifacts
* external-source materials

Validation type:
CONDITIONAL

---

## 9. Development & Test Environment

Required marker:

```markdown
## Development & Test Environment
```

Expected contents:

* platform
* model/tooling
* environment notes
* testing assumptions

Validation type:
PROSE

---

## 10. Operational / Restartability Guidance

Required marker:

```markdown
## Operational Guidance
```

OR

```markdown
## Restartability Guidance
```

Describe:

* restart assumptions
* clean-room considerations
* operational recovery guidance
* navigation assumptions

Validation type:
PROSE

---

# Validation Philosophy

README validation intentionally separates:

* deterministic validation
* prose validation

---

## Deterministic Validation

Strict validation SHOULD occur for:

* inventories
* file references
* URLs
* repository-relative paths
* deterministic metadata

These are operational infrastructure.

---

## Prose Validation

Machine validation SHOULD ONLY verify:

* section exists
* non-empty content exists

Machine validation SHOULD NOT evaluate:

* prose quality
* writing style
* wording choices
* narrative structure

This preserves:

* human flexibility
* contextual communication
* proportional governance

---

# Operational Guidance

This standard intentionally emphasizes:

* survivability
* deterministic navigation
* AI interoperability
* clean-room restartability
* operational proportionality

while intentionally avoiding:

* documentation bureaucracy
* excessive metadata inflation
* rigid prose governance

The standard may evolve after:

* additional AgentForge projects
* broader operational validation
* reusable tooling maturity
* cross-project survivability testing

---

# Recommended Future Tooling

Potential future tooling:

* `validate-readme.ps1`
* `update-readme-inventory.ps1`

Suggested validation modes:

* structure validation
* deterministic validation

Potential machine-managed sections:

* inventory generation
* URL generation
* repository-relative path generation
* README attributes

Human-managed sections should remain:

* purpose
* audience
* operational guidance
* survivability guidance
* contextual explanation

