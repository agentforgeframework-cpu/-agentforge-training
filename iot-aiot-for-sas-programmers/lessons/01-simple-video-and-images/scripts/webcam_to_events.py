import cv2
import csv
from datetime import datetime
from ultralytics import YOLO

CAMERA_ID = "BasementWebcam"
OUTPUT_FILE = "events.csv"
FRAME_SKIP = 30
CONFIDENCE_MIN = 0.50

model = YOLO("yolov8n.pt")


def ensure_csv_header():
    with open(OUTPUT_FILE, "a", newline="") as f:
        writer = csv.writer(f)
        if f.tell() == 0:
            writer.writerow([
                "timestamp",
                "camera_id",
                "event_type",
                "label",
                "confidence"
            ])


def write_event(timestamp, camera_id, event_type, label, confidence):
    with open(OUTPUT_FILE, "a", newline="") as f:
        writer = csv.writer(f)
        writer.writerow([
            timestamp,
            camera_id,
            event_type,
            label,
            round(confidence, 4)
        ])


ensure_csv_header()

cap = cv2.VideoCapture(0)

if not cap.isOpened():
    raise RuntimeError("Could not open webcam.")

frame_count = 0

print("AIoT webcam lab running. Press Q in the camera window to quit.")

while True:
    ret, frame = cap.read()

    if not ret:
        print("Could not read frame.")
        break

    frame_count += 1

    if frame_count % FRAME_SKIP == 0:
        results = model(frame, verbose=False)

        for result in results:
            for box in result.boxes:
                class_id = int(box.cls[0])
                label = model.names[class_id]
                confidence = float(box.conf[0])

                if label == "person" and confidence >= CONFIDENCE_MIN:
                    timestamp = datetime.now().isoformat(timespec="seconds")
                    event_type = f"{label}_detected"

                    write_event(
                        timestamp,
                        CAMERA_ID,
                        event_type,
                        label,
                        confidence
                    )

                    print(timestamp, CAMERA_ID, event_type, round(confidence, 4))

    cv2.imshow("AIoT Camera Lab", frame)

    if cv2.waitKey(1) & 0xFF == ord("q"):
        break

cap.release()
cv2.destroyAllWindows()

print(f"Done. Events written to {OUTPUT_FILE}")
