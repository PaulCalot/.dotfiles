#!/bin/bash

# Check if fswebcam is installed
if ! command -v fswebcam &> /dev/null; then
    echo "Error: fswebcam is not installed. Please install it using 'sudo apt install fswebcam' (for Debian/Ubuntu) or equivalent for your distribution."
    exit 1
fi

# Get list of video devices
devices=$(ls /dev/video*)

# Check if there are no video devices
if [ -z "$devices" ]; then
    echo "Error: No video devices found. Make sure a camera is connected and detected."
    exit 1
fi

# Attempt to capture image from the first detected video device
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
filename="/tmp/camera_capture_${timestamp}.jpg"
fswebcam -q --resolution 640x480 --jpeg 85 --save ${filename} -d /dev/video0

if [ $? -eq 0 ]; then
    echo "Image captured successfully and saved to /tmp/camera_capture.jpg"
    xdg-open "$filename"
else
    echo "Error: Failed to capture image from camera."
    exit 1
fi

