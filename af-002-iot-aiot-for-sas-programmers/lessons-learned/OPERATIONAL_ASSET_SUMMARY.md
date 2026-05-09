# AF-002 Operational Asset Placement

Place these files as follows:

```text
-agentforge-training/
└── af-002-iot-aiot-for-sas-programmers/
    ├── python/
    │   └── webcam_telemetry_capture.py
    ├── sas/
    │   ├── sas_import_telemetry.sas
    ├── data/
    │   └── webcam_telemetry_sample.csv
    └── lessons-learned/
        └── OPERATIONAL_ASSET_SUMMARY.md
```

## What These Files Fix

These files address the load-bearing operational issues found in Claude's digital twin test:

1. `python/webcam_telemetry_capture.py`
   - Provides the executable webcam-to-CSV telemetry workflow.
   - Supports optional image-file fallback using `--image`.
   - Writes `examples/webcam_telemetry.csv` by default.

2. `sas/sas_import_telemetry.sas`
   - Imports the telemetry CSV into SAS.
   - Produces visible PROC PRINT, PROC MEANS, and PROC FREQ output.
   - Includes local Windows and SAS OnDemand path examples.

3. `data/webcam_telemetry_sample.csv`
   - Provides a static fallback dataset.
   - Allows SAS testing even if webcam or Python execution fails.

## Basic Test Commands

From the AF-002 course folder:

```text
python -m pip install opencv-python pandas
python python/webcam_telemetry_capture.py
```

or:

```text
py -m pip install opencv-python pandas
py python/webcam_telemetry_capture.py
```

Expected output:

```text
data/webcam_telemetry.csv
```

Then run:

```text
sas/sas_import_telemetry.sas
```

in SAS, after adjusting the CSV path if necessary.
