import cv2
import csv
import os
from datetime import datetime
from ultralytics import YOLO

IMAGE_FILE = "test_photo.jpg"
OUTPUT_FILE = "image_events.csv"
CONFIDENCE_MIN = 0.50

model = YOLO("yolov8n.pt")


def ensure_csv_header():
    with open(OUTPUT_FILE, "a", newline="") as f:
        writer = csv.writer(f)
        if f.tell() == 0:
            writer.writerow([
                "timestamp",
                "image_file",
                "event_type",
                "label",
                "detection_confidence"
            ])


def write_event(timestamp, image_file, event_type, label, confidence):
    with open(OUTPUT_FILE, "a", newline="") as f:
        writer = csv.writer(f)
        writer.writerow([
            timestamp,
            image_file,
            event_type,
            label,
            round(confidence, 4)
        ])


ensure_csv_header()

if not os.path.exists(IMAGE_FILE):
    raise FileNotFoundError(f"Could not find image file: {IMAGE_FILE}")

frame = cv2.imread(IMAGE_FILE)

if frame is None:
    raise RuntimeError(f"Could not read image file: {IMAGE_FILE}")

results = model(frame, verbose=False)

print(f"Processing image: {IMAGE_FILE}")

detection_count = 0

for result in results:
    for box in result.boxes:
        class_id = int(box.cls[0])
        label = model.names[class_id]
        confidence = float(box.conf[0])

        if confidence >= CONFIDENCE_MIN:
            timestamp = datetime.now().isoformat(timespec="seconds")
            event_type = f"{label}_detected"

            write_event(
                timestamp,
                IMAGE_FILE,
                event_type,
                label,
                confidence
            )

            detection_count += 1
            print(timestamp, IMAGE_FILE, event_type, round(confidence, 4))

if detection_count == 0:
    print("No detections above confidence threshold.")

print(f"Done. Events written to {OUTPUT_FILE}")
