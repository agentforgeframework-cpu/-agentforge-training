# LESSONS LEARNED
# LL-004 — Local-First SAS Survivability

Status:
Accepted

Project:
AF-002 — IoT/AIoT for SAS Programmers

Date:
2026-05-25

---

# Observation

Depending on external runtime URLs reduced:
- SAS survivability
- enterprise realism
- portability
- offline usability

The issue became especially visible when considering enterprise SAS deployments.

---

# Hidden Dependency Risks

Patterns such as:
- remote %INCLUDE
- GitHub URL dependencies
- live runtime retrieval

introduced hidden assumptions:
- outbound internet access
- DNS resolution
- proxy configuration
- firewall permissions
- TLS compatibility

These assumptions are frequently invalid in enterprise SAS environments.

---

# Important Discovery

GitHub links work well for:
- onboarding
- setup
- artifact distribution

They work poorly as:
```text
runtime operational dependencies.
```

---

# Preferred Operational Pattern

Preferred:
- local CSV
- local SAS utilities
- local image artifacts
- DATALINES fallback

This significantly improves:
- restartability
- portability
- classroom survivability
- enterprise survivability

---

# Runtime Improvement

Adding:
- local CSV workflow
- DATALINES fallback
- SAS utility file

substantially improved operational realism.

---

# Operational Conclusion

Operational lessons should minimize hidden infrastructure dependencies whenever practical.

---

# Human-in-Command Alignment

Local-first workflows improve:
- operational transparency
- reproducibility
- environmental control
- deployment survivability

---

# Development & Test Environment

Platform:
AgentForge Framework

Project:
AF-002 — IoT/AIoT for SAS Programmers

Date:
2026-05-25

Purpose:
SAS operational survivability refinement
