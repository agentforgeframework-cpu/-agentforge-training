import cv2
import csv
import glob
from datetime import datetime
from ultralytics import YOLO

OUTPUT_FILE = "batch_image_events.csv"
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

image_files = sorted(
    glob.glob("test-image-*.jpg") +
    glob.glob("test-image-*.jpeg") +
    glob.glob("test-image-*.png")
)

if not image_files:
    raise RuntimeError("No matching image files found.")

print(f"Found {len(image_files)} image files.")

for image_file in image_files:

    print(f"\nProcessing: {image_file}")

    frame = cv2.imread(image_file)

    if frame is None:
        print(f"Could not read image: {image_file}")
        continue

    results = model(frame, verbose=False)

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
                    image_file,
                    event_type,
                    label,
                    confidence
                )

                detection_count += 1

                print(
                    f"  {event_type} "
                    f"(confidence={round(confidence, 4)})"
                )

    if detection_count == 0:
        print("  No detections above confidence threshold.")

print(f"\nDone. Events written to {OUTPUT_FILE}")
