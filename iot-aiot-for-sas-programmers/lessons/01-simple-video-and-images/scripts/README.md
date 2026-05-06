# Scripts — Lesson 01: Simple Video and Images

These scripts support the hands-on labs for Lesson 01.

They are educational scripts, not production-hardened software.

## Included Scripts

- `webcam_to_events.py`  
  Reads from the default webcam, detects people, and writes event records to `events.csv`.

- `image_to_events.py`  
  Reads one image file named `test_photo.jpg`, detects objects, and writes event records to `image_events.csv`.

- `batch_image_to_events.py`  
  Reads multiple image files named `test-image-*.jpg`, detects objects, and writes event records to `batch_image_events.csv`.

## General Use

Install required packages:

```powershell
python -m pip install opencv-python ultralytics pandas
```

Run a script:

```powershell
python webcam_to_events.py
```

or:

```powershell
python image_to_events.py
```

or:

```powershell
python batch_image_to_events.py
```

## Notes

The first YOLO run may download the model file `yolov8n.pt`.

Generated CSV files are intended to be SAS-readable.
