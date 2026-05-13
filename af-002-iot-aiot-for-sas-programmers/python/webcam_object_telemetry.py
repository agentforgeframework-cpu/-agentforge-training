"""
AF-002 Webcam Object Telemetry

Purpose:
    Use a webcam and a lightweight YOLO object-detection model to create
    AI-assisted operational telemetry that SAS can analyze.

Course:
    AF-002 - IoT and AIoT for SAS Programmers

Repository-relative path:
    af-002-iot-aiot-for-sas-programmers/python/webcam_object_telemetry.py

GitHub URL:
    https://github.com/agentforgeframework-cpu/-agentforge-training/blob/main/af-002-iot-aiot-for-sas-programmers/python/webcam_object_telemetry.py

Raw URL:
    https://raw.githubusercontent.com/agentforgeframework-cpu/-agentforge-training/refs/heads/main/af-002-iot-aiot-for-sas-programmers/python/webcam_object_telemetry.py

Expected output:
    data/webcam_object_events.csv

Required packages:
    ultralytics
    opencv-python
    pandas

Run from the AF-002 course folder:

    python python/webcam_object_telemetry.py

or:

    py python/webcam_object_telemetry.py

Notes:
    The educational goal is not to teach computer vision theory.
    The goal is to show that AI-assisted operational observations can
    become structured telemetry that SAS can analyze.
"""

from __future__ import annotations

import argparse
from datetime import datetime
from pathlib import Path

import cv2
import pandas as pd
from ultralytics import YOLO


def load_model(model_path: str) -> YOLO:
    """Load YOLO model. Ultralytics may download yolov8n.pt on first use."""
    return YOLO(model_path)


def detect_objects(model: YOLO, frame, frame_number: int, source: str, confidence_threshold: float) -> list[dict]:
    """Run object detection for one frame and return telemetry rows."""
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
                    "source": source,
                }
            )

            print(
                f"Frame {frame_number}: {label}_detected "
                f"(confidence={confidence:.4f})"
            )

    if detection_count == 0:
        rows.append(
            {
                "timestamp": timestamp,
                "frame_number": frame_number,
                "object_detected": "NONE",
                "confidence": 0.0,
                "detection_count": 0,
                "source": source,
            }
        )
        print(f"Frame {frame_number}: No detections.")

    return rows


def capture_webcam(output_path: Path, frames: int, camera_index: int, model_path: str, confidence_threshold: float) -> None:
    """Capture webcam frames and write object-detection telemetry rows."""
    model = load_model(model_path)
    cap = cv2.VideoCapture(camera_index)

    if not cap.isOpened():
        raise RuntimeError(
            "Could not open webcam. Check camera permissions, camera index, "
            "or use the sample CSV fallback."
        )

    events: list[dict] = []

    try:
        for frame_number in range(frames):
            ok, frame = cap.read()
            if not ok:
                print("Failed to capture frame.")
                break

            events.extend(
                detect_objects(
                    model=model,
                    frame=frame,
                    frame_number=frame_number,
                    source="webcam",
                    confidence_threshold=confidence_threshold,
                )
            )

            cv2.waitKey(100)
    finally:
        cap.release()

    write_csv(output_path, events)


def write_csv(output_path: Path, rows: list[dict]) -> None:
    """Write telemetry rows to CSV."""
    output_path.parent.mkdir(parents=True, exist_ok=True)
    columns = ["timestamp", "frame_number", "object_detected", "confidence", "detection_count", "source"]
    df = pd.DataFrame(rows, columns=columns)
    df.to_csv(output_path, index=False)

    print(f"\nDone. Events written to {output_path}")
    print(f"Rows written: {len(df)}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Create webcam object telemetry for AF-002.")
    parser.add_argument("--output", default="data/webcam_object_events.csv", help="Output CSV path.")
    parser.add_argument("--frames", type=int, default=100, help="Number of webcam frames to process.")
    parser.add_argument("--camera-index", type=int, default=0, help="Webcam index.")
    parser.add_argument("--model", default="yolov8n.pt", help="YOLO model file or model name.")
    parser.add_argument("--confidence", type=float, default=0.50, help="Minimum confidence threshold.")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    capture_webcam(
        output_path=Path(args.output),
        frames=args.frames,
        camera_index=args.camera_index,
        model_path=args.model,
        confidence_threshold=args.confidence,
    )


if __name__ == "__main__":
    main()
