"""
AF-002 Image Object Telemetry

Purpose:
    Use sample images and a lightweight YOLO object-detection model to create
    AI-assisted operational telemetry that SAS can analyze.

Course:
    AF-002 - IoT and AIoT for SAS Programmers

Repository-relative path:
    af-002-iot-aiot-for-sas-programmers/python/image_object_telemetry.py

Expected input folder:
    media/

Expected output:
    data/image_object_events.csv

Required packages:
    ultralytics
    opencv-python
    pandas

Run from the AF-002 course folder:

    python python/image_object_telemetry.py

or:

    py python/image_object_telemetry.py

Notes:
    This is not a computer vision theory lesson.
    The goal is to show that AI-assisted observations from still images can
    become structured telemetry that SAS can analyze.
"""

from __future__ import annotations

import argparse
from datetime import datetime
from pathlib import Path

import cv2
import pandas as pd
from ultralytics import YOLO


def detect_image(model: YOLO, image_path: Path, frame_number: int, confidence_threshold: float) -> list[dict]:
    """Run object detection for one image and return telemetry rows."""
    frame = cv2.imread(str(image_path))
    if frame is None:
        raise RuntimeError(f"Could not read image file: {image_path}")

    timestamp = datetime.now().isoformat(timespec="seconds")
    rows: list[dict] = []
    detection_count = 0

    results = model(frame, verbose=False)

    for result in results:
        for box in result.boxes:
            confidence = float(box.conf[0])
            if confidence < confidence_threshold:
                continue

            class_id = int(box.cls[0])
            label = str(model.names[class_id])
            detection_count += 1

            rows.append(
                {
                    "timestamp": timestamp,
                    "frame_number": frame_number,
                    "object_detected": label,
                    "confidence": round(confidence, 4),
                    "detection_count": detection_count,
                    "source": f"image:{image_path.name}",
                }
            )
            print(f"{image_path.name}: {label}_detected (confidence={confidence:.4f})")

    if detection_count == 0:
        rows.append(
            {
                "timestamp": timestamp,
                "frame_number": frame_number,
                "object_detected": "NONE",
                "confidence": 0.0,
                "detection_count": 0,
                "source": f"image:{image_path.name}",
            }
        )
        print(f"{image_path.name}: No detections.")

    return rows


def write_csv(output_path: Path, rows: list[dict]) -> None:
    """Write telemetry rows to CSV."""
    output_path.parent.mkdir(parents=True, exist_ok=True)
    columns = ["timestamp", "frame_number", "object_detected", "confidence", "detection_count", "source"]
    df = pd.DataFrame(rows, columns=columns)
    df.to_csv(output_path, index=False)

    print(f"\nDone. Events written to {output_path.resolve()}")
    print(f"Rows written: {len(df)}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Create image object telemetry for AF-002.")
    parser.add_argument("--media-dir", default="media", help="Folder containing sample images.")
    parser.add_argument("--output", default="data/image_object_events.csv", help="Output CSV path.")
    parser.add_argument("--model", default="yolov8n.pt", help="YOLO model file or model name.")
    parser.add_argument("--confidence", type=float, default=0.50, help="Minimum confidence threshold.")
    parser.add_argument(
        "--images",
        nargs="*",
        default=["bridge.jpg", "mountain.jpg", "dog.jpg", "banana.jpg"],
        help="Image filenames to process from the media folder.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    model = YOLO(args.model)
    media_dir = Path(args.media_dir)
    events: list[dict] = []

    for frame_number, image_name in enumerate(args.images):
        image_path = media_dir / image_name
        if not image_path.exists():
            raise FileNotFoundError(f"Expected image file not found: {image_path}")
        events.extend(detect_image(model, image_path, frame_number, args.confidence))

    write_csv(Path(args.output), events)


if __name__ == "__main__":
    main()
