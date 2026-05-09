"""
AF-002 Webcam Telemetry Capture

Purpose:
    Capture simple webcam-derived telemetry and write it to CSV.

Course:
    AF-002 - IoT and AIoT for SAS Programmers

Repository-relative path:
    -agentforge-training/af-002-iot-aiot-for-sas-programmers/python/webcam_telemetry_capture.py

GitHub URL:
    https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/python/webcam_telemetry_capture.py

Raw URL:
    https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/python/webcam_telemetry_capture.py

Expected output:
    data/webcam_telemetry.csv

Required packages:
    opencv-python
    pandas

Run from the AF-002 course folder:

    python python/webcam_telemetry_capture.py

or:

    py python/webcam_telemetry_capture.py

Notes:
    This script intentionally stays simple. The educational goal is not
    advanced computer vision. The goal is to turn visual input into
    timestamped operational telemetry that SAS can analyze.
"""

from __future__ import annotations

import argparse
import csv
from datetime import datetime
from pathlib import Path
from typing import Optional

import cv2


def get_course_root() -> Path:
    """Return the likely course root when script is run from the course folder."""
    return Path.cwd()


def calculate_frame_metrics(frame, previous_gray: Optional[object]) -> tuple[float, float, object]:
    """Calculate simple brightness and motion metrics for one frame."""
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    brightness = float(gray.mean())

    if previous_gray is None:
        motion_score = 0.0
    else:
        diff = cv2.absdiff(gray, previous_gray)
        motion_score = float(diff.mean())

    return brightness, motion_score, gray


def capture_webcam(output_path: Path, frames: int, camera_index: int) -> None:
    """Capture a small number of frames from a webcam and write telemetry rows."""
    cap = cv2.VideoCapture(camera_index)

    if not cap.isOpened():
        raise RuntimeError(
            "Webcam could not be opened. Check camera permissions, camera index, "
            "or use the sample CSV fallback."
        )

    previous_gray = None
    rows = []

    for frame_number in range(1, frames + 1):
        ok, frame = cap.read()

        if not ok:
            raise RuntimeError("Could not read from webcam.")

        brightness, motion_score, previous_gray = calculate_frame_metrics(frame, previous_gray)

        rows.append(
            {
                "timestamp": datetime.now().isoformat(timespec="seconds"),
                "frame_number": frame_number,
                "brightness": round(brightness, 2),
                "motion_score": round(motion_score, 2),
                "source": "webcam",
            }
        )

        # Brief pause so consecutive frames differ enough to be meaningful.
        cv2.waitKey(250)

    cap.release()
    write_csv(output_path, rows)


def process_image(image_path: Path, output_path: Path) -> None:
    """Create one telemetry row from a static image file."""
    if not image_path.exists():
        raise FileNotFoundError(f"Image file not found: {image_path}")

    frame = cv2.imread(str(image_path))

    if frame is None:
        raise RuntimeError(f"Could not read image file: {image_path}")

    brightness, motion_score, _ = calculate_frame_metrics(frame, None)

    rows = [
        {
            "timestamp": datetime.now().isoformat(timespec="seconds"),
            "frame_number": 1,
            "brightness": round(brightness, 2),
            "motion_score": round(motion_score, 2),
            "source": f"image:{image_path.name}",
        }
    ]

    write_csv(output_path, rows)


def write_csv(output_path: Path, rows: list[dict]) -> None:
    """Write telemetry rows to CSV."""
    output_path.parent.mkdir(parents=True, exist_ok=True)

    fieldnames = ["timestamp", "frame_number", "brightness", "motion_score", "source"]

    with output_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

    print(f"Telemetry CSV written to: {output_path}")
    print(f"Rows written: {len(rows)}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Capture simple webcam or image telemetry for AF-002."
    )

    parser.add_argument(
        "--output",
        default="data/webcam_telemetry.csv",
        help="Output CSV path. Default: data/webcam_telemetry.csv",
    )

    parser.add_argument(
        "--frames",
        type=int,
        default=10,
        help="Number of webcam frames to capture. Default: 10",
    )

    parser.add_argument(
        "--camera-index",
        type=int,
        default=0,
        help="Webcam index. Default: 0",
    )

    parser.add_argument(
        "--image",
        default=None,
        help="Optional image file fallback. If provided, webcam capture is skipped.",
    )

    return parser.parse_args()


def main() -> None:
    args = parse_args()
    output_path = Path(args.output)

    if args.image:
        process_image(Path(args.image), output_path)
    else:
        capture_webcam(output_path, args.frames, args.camera_index)


if __name__ == "__main__":
    main()
