# Lesson Status — Lesson 01: Simple Video and Images

Course: IoT/AIoT for SAS Programmers  
Status: Stabilization Draft  
Last Updated: YYYY-MM-DD

## Lesson Identity

Lesson Number: 01  
Lesson Title: Simple Video and Images  
Lesson Folder: `01-simple-video-and-images`

## Stabilization Status

| Area | Status | Notes |
|---|---|---|
| Lesson scope frozen | Complete | Lesson 1 is in stabilization mode. |
| Core concept defined | Complete | Input → inference → event → telemetry → SAS analytics. |
| Lesson guide | Drafted | Needs review after file integration. |
| Lab guide | Drafted | Based on working prototype sequence. |
| Student handout | Drafted | Concise learner reference. |
| Instructor notes | Drafted | Includes pacing and friction points. |
| Scripts | Drafted | Three core Python scripts included. |
| Visuals | Deferred | Visuals intentionally skipped for this stabilization pass. |
| SAS examples | Partial | Basic PROC IMPORT and PROC FREQ examples included. |
| Troubleshooting | Partial | Common issues captured in lab guide and instructor notes. |
| Workshop ready | Not yet | Needs full run-through from clean folder. |
| PDF/export ready | Not yet | Requires review and formatting pass. |

## Included Scripts

Expected scripts:

- `scripts/webcam_to_events.py`
- `scripts/image_to_events.py`
- `scripts/batch_image_to_events.py`

## Known Issues / Future Refinements

- Add stronger no-detection handling to batch script.
- Consider adding `image_detection_count` to batch output.
- Consider adding a SAS-specific analysis script.
- Add visuals after lesson text stabilizes.
- Add screenshots after a clean workshop-style run.
- Add date and tested environment details after final validation.

## Completion Criteria for v1.0

Lesson 01 may be considered v1.0-ready when:

- All required files are populated.
- Scripts run from a clean folder.
- CSV outputs are generated successfully.
- SAS import example is tested.
- Known setup issues are documented.
- Lesson can be followed by another learner without relying on chat history.
- Scope remains controlled.

## Current Decision

Lesson 1 is the reference implementation for the course lesson structure.

Do not expand Lesson 1 into later-course topics.
