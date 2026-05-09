"""
AF-002 Webcam Telemetry Capture

Purpose:
Capture simple webcam frames and write basic operational telemetry to CSV.

This script is intentionally simple. It is for learning, not production monitoring.

Repository-relative path:
/af-002-iot-aiot-for-sas-programmers/core-tools/webcam_telemetry_capture.py
"""

from __future__ import annotations

import csv
import datetime as dt
from pathlib import Path

try:
    import cv2
except ImportError as exc:
    raise SystemExit(
        "OpenCV is not installed. Try: python -m pip install opencv-python"
    ) from exc

OUTPUT = Path("telemetry_webcam_sample.csv")
FRAME_COUNT = 30
CAMERA_INDEX = 0


def main() -> None:
    camera = cv2.VideoCapture(CAMERA_INDEX)
    if not camera.isOpened():
        raise SystemExit("Could not open webcam. Check camera permissions or use an image-file fallback.")

    rows = []
    try:
        for sample_id in range(1, FRAME_COUNT + 1):
            ok, frame = camera.read()
            if not ok:
                raise RuntimeError("Could not read frame from webcam.")

            gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
            brightness_mean = float(gray.mean())
            brightness_min = int(gray.min())
            brightness_max = int(gray.max())

            rows.append({
                "sample_id": sample_id,
                "timestamp": dt.datetime.now().isoformat(timespec="seconds"),
                "brightness_mean": round(brightness_mean, 2),
                "brightness_min": brightness_min,
                "brightness_max": brightness_max,
            })
    finally:
        camera.release()

    with OUTPUT.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)

    print(f"Wrote {len(rows)} telemetry records to {OUTPUT.resolve()}")


if __name__ == "__main__":
    main()
