"""
AF-002 Image Telemetry Capture

Purpose:
    Read a small set of still images and write simple image-derived telemetry to CSV.

Course:
    AF-002 - IoT and AIoT for SAS Programmers

Repository-relative path:
    -agentforge-training/af-002-iot-aiot-for-sas-programmers/python/image_telemetry_capture.py

GitHub URL:
    https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/python/image_telemetry_capture.py

Raw URL:
    https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/python/image_telemetry_capture.py

Expected input folder:
    media/

Expected output:
    data/image_telemetry.csv

Required package:
    opencv-python

Run from the AF-002 course folder:

    python python/image_telemetry_capture.py

or:

    py python/image_telemetry_capture.py

Notes:
    This script intentionally stays simple. It does not classify image contents.
    The educational goal is to turn still images into timestamped operational
    telemetry that SAS can inspect.
"""

from __future__ import annotations

import argparse
import csv
from datetime import datetime
from pathlib import Path

import cv2


def calculate_image_metrics(image_path: Path) -> dict:
    """Calculate simple telemetry metrics for one image."""
    frame = cv2.imread(str(image_path))

    if frame is None:
        raise RuntimeError(f"Could not read image file: {image_path}")

    height, width = frame.shape[:2]
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    return {
        "timestamp": datetime.now().isoformat(timespec="seconds"),
        "image_file": image_path.name,
        "width": width,
        "height": height,
        "mean_brightness": round(float(gray.mean()), 2),
        "source": "still_image",
    }


def write_csv(output_path: Path, rows: list[dict]) -> None:
    """Write image telemetry rows to CSV."""
    output_path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = ["timestamp", "image_file", "width", "height", "mean_brightness", "source"]

    with output_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

    print(f"Image telemetry CSV written to: {output_path}")
    print(f"Rows written: {len(rows)}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Create simple image telemetry for AF-002.")
    parser.add_argument(
        "--media-dir",
        default="media",
        help="Folder containing sample images. Default: media",
    )
    parser.add_argument(
        "--output",
        default="data/image_telemetry.csv",
        help="Output CSV path. Default: data/image_telemetry.csv",
    )
    parser.add_argument(
        "--images",
        nargs="*",
        default=["bridge.jpg", "mountain.jpg", "dog.jpg", "banana.jpg"],
        help="Image filenames to process from the media folder.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    media_dir = Path(args.media_dir)
    output_path = Path(args.output)

    rows = []
    for image_name in args.images:
        image_path = media_dir / image_name
        if not image_path.exists():
            raise FileNotFoundError(f"Expected image file not found: {image_path}")
        rows.append(calculate_image_metrics(image_path))

    write_csv(output_path, rows)


if __name__ == "__main__":
    main()
